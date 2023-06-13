import 'package:air_pollution/conponent/category_card.dart';
import 'package:air_pollution/conponent/main_app_bar.dart';
import 'package:air_pollution/conponent/main_drawer.dart';
import 'package:air_pollution/conponent/main_stat.dart';
import 'package:air_pollution/const/colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
