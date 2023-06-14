import 'package:air_pollution/conponent/card_title.dart';
import 'package:air_pollution/conponent/main_card.dart';
import 'package:air_pollution/conponent/main_stat.dart';
import 'package:air_pollution/const/colors.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: MainCard(
        child: LayoutBuilder(
          builder: (context,constraint) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CardTitle(
                  title: '종류별통계',
                ),
                Expanded(
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    physics: PageScrollPhysics(),
                    children: List.generate(
                      20,
                      (index) => MainStat(
                        width: constraint.maxWidth / 3,
                        category: '미세먼지',
                        imgPath: 'asset/img/best.png',
                        level: '최고',
                        stat: '0 ㎍/㎥',
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
        ),
      ),
    );
  }
}
