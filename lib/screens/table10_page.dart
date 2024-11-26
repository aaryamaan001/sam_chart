import 'package:flutter/material.dart';
import '../models/sam_chart_table_10.dart';
import '../SAM Chart/table_10.dart';

class Table10Page extends StatefulWidget {
  final int index;
  final SamChartTable10 table10Data;

  Table10Page({required this.index, required this.table10Data});

  @override
  _Table10PageState createState() => _Table10PageState();
}

class _Table10PageState extends State<Table10Page> {
  late SamChartTable10 _table10Data;

  @override
  void initState() {
    super.initState();
    _table10Data = widget.table10Data;
  }

  void navigateToEditTable10() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Table10(
          table10Data: _table10Data,
        ),
      ),
    );

    if (result == true) {
      setState(() {
        // Trigger UI update if necessary
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SAM Chart Table 10'),
        backgroundColor: Color(0xFF4A55F2),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: navigateToEditTable10,
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        color: Color(0xFFF5F7FA),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildInfoRow(
                  'Hemoglobin (gm%)', _table10Data.hemoglobin?.toString()),
              _buildInfoRow('Blood Glucose (gm/dl)',
                  _table10Data.bloodGlucose?.toString()),
              _buildInfoRow('Total Leucocyte Count',
                  _table10Data.totalLeucocyteCount?.toString()),
              _buildInfoRow('Differential Leucocyte Count',
                  _table10Data.differentialLeucocyteCount),
              _buildInfoRow('Urine Test', _table10Data.urineTest),
              _buildInfoRow('Test for TB', _table10Data.testForTB),
              _buildInfoRow(
                  'Serum Electrolytes', _table10Data.serumElectrolytes),
              _buildInfoRow('Other Tests', _table10Data.otherTests),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String? value) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 8,
            spreadRadius: 2,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
          Text(
            value ?? 'N/A',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
