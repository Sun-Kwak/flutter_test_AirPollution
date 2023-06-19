import 'package:air_pollution/component/main_app_bar.dart';
import 'package:air_pollution/component/main_drawer.dart';
import 'package:air_pollution/const/regions.dart';
import 'package:air_pollution/container/category_card.dart';
import 'package:air_pollution/container/hourly_card.dart';
import 'package:air_pollution/model/stat_model.dart';
import 'package:air_pollution/repository/stat_repository.dart';
import 'package:air_pollution/utils/data_utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //최초 지역은 첫번째 인덱스 값인 서울이 선택 된 상태
  String region = regions[0];
  bool isExpanded = true;
  ScrollController scrollController = ScrollController();

  @override
  initState() {
    super.initState();
    scrollController.addListener(scrollListener);
    fetchData();
  }

  @override
  dispose() {
    scrollController.removeListener(scrollListener);
    scrollController.dispose();
    super.dispose();
  }

  Future<void> fetchData() async {

    try{
      final now = DateTime.now();
      final fetchTime = DateTime(
        now.year,
        now.month,
        now.day,
        now.hour,
      );

      final box = Hive.box<StatModel>(ItemCode.PM10.name);
      final recent = box.values.last as StatModel;

      if(recent.dataTime.isAtSameMomentAs(fetchTime)){
        return;
      }

      print('잉?');
      print('${fetchTime}');

      List<Future> futures = [];

      for (ItemCode itemCode in ItemCode.values) {
        futures.add(
          StatRepository.fetchData(
            itemCode: itemCode,
          ),
        );
      }

      final results = await Future.wait(futures);

      for (int i = 0; i < results.length; i++) {
        final key = ItemCode.values[i];
        final value = results[i];

        final box = Hive.box<StatModel>(key.name);

        for (StatModel stat in value) {
          box.put(stat.dataTime.toString(), stat);
        }

        final allKeys = box.keys.toList();

        if(allKeys.length > 24){
          final deleteKeys = allKeys.sublist(0, allKeys.length - 24);
          box.deleteAll(deleteKeys);
        }
      }
    } on DioError catch (e){
     ScaffoldMessenger.of(context).showSnackBar(
       const SnackBar(content: Text(
         '인터넷 연결이 원활하지 않습니다.',
       ),
       ),
     );
    }
  }

  scrollListener() {
    bool isExpanded = scrollController.offset < 500 - kToolbarHeight;

    if (isExpanded != this.isExpanded) {
      setState(() {
        this.isExpanded = isExpanded;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box>(
        valueListenable: Hive.box<StatModel>(ItemCode.PM10.name).listenable(),
        builder: (context, box, widget){

          final recentStat = box.values.toList().last as StatModel;

          final status = DataUtils.getStatusFromItemCodeAndValue(
              value: recentStat.getLevelFromRegion(region),
              itemCode: ItemCode.PM10);

          return Scaffold(
              drawer: MainDrawer(
                darkColor: status.darkColor,
                lightColor: status.lightColor,
                selectedRegion: region,
                onRegionTop: (String region) {
                  setState(() {
                    this.region = region;
                  });
                  Navigator.of(context).pop();
                },
              ),
              body: Container(
                color: status.primaryColor,
                child: RefreshIndicator(
                  onRefresh: ()async{
                    await fetchData();
                  },
                  child: CustomScrollView(
                    controller: scrollController,
                    slivers: [
                      MainAppBar(
                        isExpanded: isExpanded,
                        region: region,
                        stat: recentStat,
                        status: status,
                      ),
                      SliverToBoxAdapter(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            CategoryCard(
                              region: region,
                              darkColor: status.darkColor,
                              lightColor: status.lightColor,
                            ),
                            SizedBox(
                              height: 6.0,
                            ),
                            ...ItemCode.values.map(
                                  (itemCode) {

                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 16),
                                  child: HourlyCard(
                                    itemCode : itemCode,
                                    region: region,
                                    darkColor: status.darkColor,
                                    lightColor: status.lightColor,
                                  ),
                                );
                              },
                            ).toList(),
                            SizedBox(
                              height: 16,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          );
        },
    );
  }
}
