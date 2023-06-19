import 'package:air_pollution/main.dart';
import 'package:air_pollution/screen/test2_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
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
          ElevatedButton(
              onPressed: (){
                final box = Hive.box(testBox);
                print('Keys : ${box.keys.toList()}');
                print('Values : ${box.values.toList()}');
              },
              child: Text(
                '박스 출력!',
              ),
          ),
          ElevatedButton(
              onPressed: (){
                final box = Hive.box(testBox);
                box.add('테스트zz');
              },
              child: Text(
                '데이터 넣기',
                textAlign: TextAlign.center,
              ),
          ),
          ElevatedButton(
            onPressed: (){
              final box = Hive.box(testBox);
              print(box.get(100));
            },
            child: Text(
              '데이터 불러오기',
              textAlign: TextAlign.center,
            ),
          ),
          ElevatedButton(
              onPressed:(){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => TeestScreen2())
                );
              }, child: Text(
            '다음화면',
          ),
          ),
        ],
      ),
    );
  }
}
