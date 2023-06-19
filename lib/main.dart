import 'dart:ui';

import 'package:air_pollution/model/stat_model.dart';
import 'package:air_pollution/screen/home_screen.dart';
import 'package:air_pollution/screen/test2_screen.dart';
import 'package:air_pollution/screen/test_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

const testBox = 'test';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(testBox);

  Hive.registerAdapter<StatModel>(StatModelAdapter());
  Hive.registerAdapter<ItemCode>(ItemCodeAdapter());

  for(ItemCode itemCode in ItemCode.values){
    await Hive.openBox<StatModel>(itemCode.name);
  }

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Sunflower'
      ),
      home: HomeScreen(),
    ),
  );
}
