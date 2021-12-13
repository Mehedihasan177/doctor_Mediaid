import 'package:flutter/material.dart';
import 'package:flutter/src/material/dropdown.dart';

class ManageScheduleModel {


  late String day;
  late TimeOfDay from;
  late TimeOfDay to;

  ManageScheduleModel(this.day, this.from, this.to);
}
