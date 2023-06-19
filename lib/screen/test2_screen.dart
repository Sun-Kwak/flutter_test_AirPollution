import 'package:air_pollution/main.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TeestScreen2 extends StatelessWidget {
  const TeestScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
            'test screen'
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ValueListenableBuilder<Box>(
            valueListenable: Hive.box(testBox).listenable(),
            builder: (context, box, widget){

              return Column(
                children: box.values.map(
                      (e) => Text(e.toString()),
                ).toList(),
              );
            },
          ),

        ],
      ),
    );;
  }
}
