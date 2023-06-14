import 'package:air_pollution/const/colors.dart';
import 'package:flutter/material.dart';

class CardTitle extends StatelessWidget {
  final String title;
  const CardTitle({
    required this.title,
    super.key});

  @override
  Widget build(BuildContext context) {
    return                 Container(
      decoration: BoxDecoration(
        color: darkColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
