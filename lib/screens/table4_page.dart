import 'package:flutter/material.dart';
import 'package:minor_project/SAM%20Chart/table_4.dart';
import '../models/sam_chart_table_4.dart';

class Table4Page extends StatefulWidget {
  final int index;
  final SamChartTable4 table4Data;

  Table4Page({required this.index, required this.table4Data});

  @override
  _Table4PageState createState() => _Table4PageState();
}

class _Table4PageState extends State<Table4Page> {
  late SamChartTable4 _table4Data;

  @override
  void initState() {
    super.initState();
    _table4Data =
        widget.table4Data; // Initialize data from the provided table4Data
  }

  void navigateToEditTable4() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Table4(
          table4Data: _table4Data,
        ),
      ),
    );

    if (result == true) {
      setState(() {
        // Rebuild the page to reflect updated data
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SAM Chart Table 4'),
        backgroundColor: Color(0xFF4A55F2),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: navigateToEditTable4, // Navigate to edit screen
          ),
        ],
      ),
      body: Container(
        color: Color(0xFFF5F7FA), // Background color
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Container(
            color: Color(0xFFF5F7FA), // Page background color
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Page Header
                Container(
                  padding: EdgeInsets.all(16),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "SAM Chart Table 4",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Child Details for Table 4",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),

                // Display Data in Single Row
                _buildInfoRow('Date of Admission',
                    _formatDate(_table4Data.dateOfAdmission)),
                _buildInfoRow('Admission Weight (Kg)',
                    _table4Data.admissionWeightKg?.toString()),
                _buildInfoRow('Admission Weight (Gms)',
                    _table4Data.admissionWeightGms?.toString()),
                _buildInfoRow('Admission Height (Cms)',
                    _table4Data.admissionHeight?.toString()),
                _buildInfoRow('WHZ Score', _table4Data.whzScore?.toString()),
                _buildInfoRow('MUAC (mm)', _table4Data.muac?.toString()),
                _buildInfoRow('Oedema', _table4Data.oedema),
                _buildInfoRow('Appetite Test', _table4Data.appetiteTest),
                _buildInfoRow('Complications', _table4Data.complications),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper to Format Dates
  String _formatDate(DateTime? date) {
    if (date == null) return 'N/A';
    return '${date.day}/${date.month}/${date.year}';
  }

  // Helper to Build Info Rows
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
