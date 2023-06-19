import 'package:air_pollution/model/status_model.dart';
import 'package:flutter/material.dart';

final statusLevel = [
  StatusModel(
    level: 0,
    label: '최고',
    primaryColor: Color(0xFF2196F3),
    darkColor: Color(0xFF0069C0),
    lightColor: Color(0xFF6EC6FF),
    detailFontColor: Colors.black,
    imagePath: 'asset/img/best.png',
    comment: '우와!중국 없어짐',
    minFineDust: 0,
    minUltraFineDust: 0,
    minO3: 0,
    minNO2: 0,
    minCO: 0,
    minSO2: 0,
  ),
    StatusModel(
        level: 1,
        label: '좋음',
        primaryColor: Color(0xFF03a9f4),
        darkColor: Color(0xFF007ac1),
        lightColor: Color(0xFF67daff),
        detailFontColor: Colors.black,
        imagePath: 'asset/img/good.png',
        comment: '산책가자!',
        minFineDust: 16,
        minUltraFineDust: 9,
        minO3: 0.02,
        minNO2: 0.02,
        minCO: 1,
        minSO2: 0.01,
    ),
    StatusModel(
        level: 2,
        label: '양호',
        primaryColor: Color(0xFF00bcd4),
        darkColor: Color(0xFF008ba3),
        lightColor: Color(0xFF62efff),
        detailFontColor: Colors.black,
        imagePath: 'asset/img/ok.png',
        comment: '공기 좋아',
        minFineDust: 31,
        minUltraFineDust: 16,
        minO3: 0.03,
        minNO2: 0.03,
        minCO: 2,
        minSO2: 0.02,
    ),
    StatusModel(
        level: 3,
        label: '보통',
        primaryColor: Color(0xFF009688),
        darkColor: Color(0xFF00675b),
        lightColor: Color(0xFF52c7b8),
        detailFontColor: Colors.black,
        imagePath: 'asset/img/mediocre.png',
        comment: 'Not Bad',
        minFineDust: 41,
        minUltraFineDust: 21,
        minO3: 0.06,
        minNO2: 0.05,
        minCO: 5.5,
        minSO2: 0.04,
    ),
    StatusModel(
        level: 4,
        label: '나쁨',
        primaryColor: Color(0xFFffc107),
        darkColor: Color(0xFFc79100),
        lightColor: Color(0xFFfff350),
        detailFontColor: Colors.black,
        imagePath: 'asset/img/bad.png',
        comment: 'Not goodㅠ',
        minFineDust: 51,
        minUltraFineDust: 26,
        minO3: 0.09,
        minNO2: 0.06,
        minCO: 9,
        minSO2: 0.05,
    ),
    StatusModel(
        level: 5,
        label: '상당히나쁨',
        primaryColor: Color(0xFFff9800),
        darkColor: Color(0xFFc66900),
        lightColor: Color(0xFFffc947),
        detailFontColor: Colors.black,
        imagePath: 'asset/img/very_bad.png',
        comment: '나가지마 ㅠ',
        minFineDust: 76,
        minUltraFineDust: 38,
        minO3: 0.12,
        minNO2: 0.13,
        minCO: 12,
        minSO2: 0.1,
    ),
    StatusModel(
        level: 6,
        label: '매우나쁨',
        primaryColor: Color(0xFFf44336),
        darkColor: Color(0xFFba000d),
        lightColor: Color(0xFFff7961),
        detailFontColor: Colors.black,
        imagePath: 'asset/img/worse.png',
        comment: '집에만 있어!!',
        minFineDust: 101,
        minUltraFineDust: 51,
        minO3: 0.15,
        minNO2: 0.2,
        minCO: 15,
        minSO2: 0.15,
    ),
    StatusModel(
        level: 7,
        label: '최악',
        primaryColor: Color(0xFF212121),
        darkColor: Color(0xFF000000),
        lightColor: Color(0xFF484848),
        detailFontColor: Colors.black,
        imagePath: 'asset/img/worst.png',
        comment: '역대최악!',
        minFineDust: 151,
        minUltraFineDust: 76,
        minO3: 0.38,
        minNO2: 1.1,
        minCO: 32,
        minSO2: 0.16,
    ),
];