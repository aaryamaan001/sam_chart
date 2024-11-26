import 'package:minor_project/models/sam_chart_table_1.dart';
import 'package:minor_project/models/sam_chart_table_2.dart';

class ChildData {
  final SamChartTable1 table1Data;
  final SamChartTable2 table2Data;

  ChildData({
    required this.table1Data,
    required this.table2Data,
  });
}

class Table1Data {
  final String childName;

  Table1Data({required this.childName});
}

class Table2Data {
  Table2Data();
}
