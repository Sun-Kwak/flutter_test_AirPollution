import 'package:air_pollution/conponent/category_card.dart';
import 'package:air_pollution/conponent/hourly_card.dart';
import 'package:air_pollution/conponent/main_app_bar.dart';
import 'package:air_pollution/conponent/main_drawer.dart';
import 'package:air_pollution/const/colors.dart';
import 'package:air_pollution/const/data.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }
  fetchData() async {
    final response = await Dio().get(
      'http://apis.data.go.kr/B552584/ArpltnStatsSvc/getCtprvnMesureLIst',
      queryParameters: {
        'serviceKey' : serviceKey,
        'returnType' : 'json',
        'numOfRows' : 30,
        'pageNo' : 1,
        'itemCode' : 'PM10',
        'dataGubun' : 'HOUR',
        'searchCondition' : 'WEEK'
      }
    );

    print(response.data);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      drawer: MainDrawer(),
      body: CustomScrollView(
        slivers: [
          MainAppBar(),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CategoryCard(),
                SizedBox(
                  height: 6.0,
                ),
                HourlyCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
