import 'package:air_pollution/component/card_title.dart';
import 'package:air_pollution/component/main_card.dart';
import 'package:air_pollution/component/main_stat.dart';
import 'package:air_pollution/model/stat_model.dart';
import 'package:air_pollution/utils/data_utils.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CategoryCard extends StatelessWidget {
  final String region;
  final Color darkColor;
  final Color lightColor;

  const CategoryCard({
    required this.darkColor,
    required this.lightColor,
    required this.region,
    super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: MainCard(
        backgroundColor:lightColor,
        child: LayoutBuilder(builder: (context, constraint) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CardTitle(
                backgroundColor: darkColor,
                title: '종류별통계',
              ),
              Expanded(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  physics: PageScrollPhysics(),
                  children: ItemCode.values
                      .map(
                        (ItemCode itemCode) =>
                        ValueListenableBuilder<Box>(
                            valueListenable: Hive.box<StatModel>(itemCode.name).listenable(),
                            builder: (context, box, widget){
                              final stat = (box.values.last as StatModel);
                              final status = DataUtils.getStatusFromItemCodeAndValue(
                                  value: stat.getLevelFromRegion(region),
                                  itemCode: itemCode,
                              );

                              return MainStat(
                                width: constraint.maxWidth / 3,
                                category: DataUtils.getItemCodeKrString(
                                  itemCode: itemCode,
                                ),
                                imgPath: status.imagePath,
                                level: status.label,
                                stat: '${stat.getLevelFromRegion(
                                  region,
                                )}${DataUtils.getUnitFromItemCode(
                                  itemCode: itemCode,
                                )}',
                              );
                            },
                        ),
                  )
                      .toList(),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
