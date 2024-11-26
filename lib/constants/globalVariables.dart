import 'package:flutter/material.dart';
import 'package:minor_project/models/child_data.dart';

class GlobalVariables {
  static const primaryColor = Colors.blue;
  static const secondaryColor = Colors.white;
  static const backgroundColor = Color.fromARGB(255, 14, 41, 179);
  static List<ChildData> childrenData = [];
}

List<ChildData> get childrenData => GlobalVariables.childrenData;
