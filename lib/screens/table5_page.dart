import 'package:flutter/material.dart';
import 'package:minor_project/SAM%20Chart/table_5.dart';
import 'package:minor_project/models/sam_chart_table_5.dart';

class Table5Page extends StatefulWidget {
  final int index;
  final SamChartTable5 table5Data;

  Table5Page({required this.index, required this.table5Data});

  @override
  _Table5PageState createState() => _Table5PageState();
}

class _Table5PageState extends State<Table5Page> {
  late SamChartTable5 _table5Data;

  @override
  void initState() {
    super.initState();
    _table5Data = widget.table5Data; // Initialize data from childData
  }

  void navigateToEditTable5() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Table5(
          table5Data: _table5Data,
        ),
      ),
    );

    if (result == true) {
      setState(() {
        // Trigger a rebuild to reflect the updated data
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SAM Chart Table 5'),
        backgroundColor: Color(0xFF4A55F2),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: navigateToEditTable5, // Navigate to the edit page
          ),
        ],
      ),
      body: Container(
        color: Color(0xFFF5F7FA), // Background color
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Display SAM Chart Table 5 data
              _buildInfoRow(
                  'Date of Discharge', _table5Data.dateOfDischarge?.toString()),
              _buildInfoRow('Exit Indicator', _table5Data.exitIndicator),
              _buildInfoRow('Supplementary Sucking Technique',
                  _table5Data.supplementarySuckingTechnique),
              _buildInfoRow('Outcome of SST', _table5Data.outcomeOfSST),
              _buildInfoRow('Duration of Stay (in days)',
                  _table5Data.durationOfStay?.toString()),
              _buildInfoRow('Discharge Weight (Kg)',
                  '${_table5Data.dischargeWeightKg?.toString() ?? ''} Kg ${_table5Data.dischargeWeightGms?.toString() ?? ''} gms'),
              _buildInfoRow(
                  'Discharge WHZ Score', _table5Data.dischargeWHZScore),
              _buildInfoRow(
                  'Discharge MUAC (mm)', _table5Data.dischargeMUAC?.toString()),
              _buildInfoRow('Average Weight Gain (gms/Kg/day)',
                  _table5Data.averageWeightGainPerDay?.toString()),
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
