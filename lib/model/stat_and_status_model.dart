import 'package:air_pollution/model/stat_model.dart';
import 'package:air_pollution/model/status_model.dart';


class StatAndStatusModel{
  final StatusModel status;
  final StatModel stat;
  final ItemCode itemCode;

  StatAndStatusModel({
  required this.status,
  required this.stat,
  required this.itemCode,
});

}