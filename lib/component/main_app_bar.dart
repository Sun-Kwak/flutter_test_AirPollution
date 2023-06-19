import 'package:air_pollution/const/colors.dart';
import 'package:air_pollution/model/stat_model.dart';
import 'package:air_pollution/model/status_model.dart';
import 'package:air_pollution/utils/data_utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MainAppBar extends StatelessWidget {
  final StatusModel status;
  final StatModel stat;
  final String region;
  final bool isExpanded;

  const MainAppBar({
    required this.isExpanded,
    required this.region,
    required this.stat,
    required this.status,
    super.key});

  @override
  Widget build(BuildContext context) {
    final ts = TextStyle(
      color: Colors.white,
      fontSize: 30.0,
    );

    return  SliverAppBar(
      expandedHeight: 500,
      backgroundColor: status.primaryColor,
      pinned: true,
      centerTitle: true,
      title: isExpanded
        ? null
      : Text('$region ${DateFormat('yyyy-MM-dd HH:mm').format(stat.dataTime)}'),
      flexibleSpace: FlexibleSpaceBar(
        background: SafeArea(
          child: Container(
            margin: EdgeInsets.only(top: kToolbarHeight),
            child: Column(
              children: [
                Text(
                  region,
                  style: ts.copyWith(
                    fontSize: 40.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  DateFormat('yyyy-MM-dd HH:mm').format(stat.dataTime),
                  style: ts.copyWith(
                    fontSize: 20.0,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Image.asset(
                  status.imagePath,
                  width: MediaQuery.of(context).size.width / 2,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  status.label,
                  style: ts.copyWith(
                    fontSize: 40.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  status.comment,
                  style: ts.copyWith(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
