import 'package:flutter/material.dart';
import 'package:minor_project/SAM%20Chart/table_7.dart';
import '../models/sam_chart_table_7.dart';

class Table7Page extends StatefulWidget {
  final int index;
  final SamChartTable7 table7Data;

  Table7Page({required this.index, required this.table7Data});

  @override
  _Table7PageState createState() => _Table7PageState();
}

class _Table7PageState extends State<Table7Page> {
  late SamChartTable7 _table7Data;

  @override
  void initState() {
    super.initState();
    _table7Data = widget.table7Data;
  }

  void navigateToEditTable7() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Table7(table7Data: _table7Data),
      ),
    );

    if (result == true) {
      setState(() {
        // Rebuild to reflect changes
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SAM Chart Table 7'),
        backgroundColor: Color(0xFF4A55F2),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: navigateToEditTable7,
          ),
        ],
      ),
      body: Container(
        color: Color(0xFFF5F7FA),
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildInfoRow('Diarrhoea Remarks', _table7Data.diarrhoeaRemarks),
              _buildInfoRow('Vomiting Remarks', _table7Data.vomitingRemarks),
              _buildInfoRow('Fever Remarks', _table7Data.feverRemarks),
              _buildInfoRow(
                  'Hypothermia Remarks', _table7Data.hypothermiaRemarks),
              _buildInfoRow('Cough Remarks', _table7Data.coughRemarks),
              _buildInfoRow('Lethargy Remarks', _table7Data.lethargyRemarks),
              _buildInfoRow('Swelling Remarks', _table7Data.swellingRemarks),
              _buildInfoRow('Other Remarks', _table7Data.otherRemarks),
              _buildInfoRow(
                  'Immunization History', _table7Data.immunizationHistory),
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
