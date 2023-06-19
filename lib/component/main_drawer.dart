import 'package:air_pollution/const/regions.dart';
import 'package:flutter/material.dart';

typedef OnRegionTop = void Function(String region);

class MainDrawer extends StatelessWidget {
  final onRegionTop;
  final selectedRegion;
  final Color darkColor;
  final Color lightColor;

  const MainDrawer({
    required this.lightColor,
    required this.darkColor,
    required this.onRegionTop,
    required this.selectedRegion,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: darkColor,
      child: ListView(
        children: [
          DrawerHeader(
              child: Text(
                '지역 선택',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
          ),
          ...regions.map(
              (e) => ListTile(
                tileColor: Colors.white,
                selectedTileColor: lightColor,
                selectedColor: Colors.black,
                selected: e == selectedRegion,
                onTap: (){onRegionTop(e);},
                title: Text(
                    e,
                ),
              ),
          ).toList(),
        ],
      ),
    );
  }
}
