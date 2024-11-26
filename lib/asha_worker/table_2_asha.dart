import 'package:flutter/material.dart';
import 'package:minor_project/models/child_data.dart';
import 'package:minor_project/models/sam_chart_table_2.dart';

class Table2Asha extends StatefulWidget {
  final int index;
  final ChildData childData;

  Table2Asha({required this.index, required this.childData});

  @override
  _Table2AshaState createState() => _Table2AshaState();
}

class _Table2AshaState extends State<Table2Asha> {
  late SamChartTable2 _table2Data;

  @override
  void initState() {
    super.initState();
    _table2Data = widget.childData.table2Data; // Initialize data from childData
  }

  // void navigateToEditTable2() async {
  //   final result = await Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => Table2(
  //         index: widget.index,
  //         childData: widget.childData,
  //       ),
  //     ),
  //   );

  //   if (result == true) {
  //     setState(() {
  //       // Trigger a rebuild to reflect the updated data
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('SAM Chart Table 2'),
          backgroundColor: Color(0xFF4A55F2),
          // actions: [
          //   IconButton(
          //     icon: Icon(Icons.edit),
          //     onPressed: navigateToEditTable2, // Navigate to the edit page
          //   ),
          // ],
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
                          "SAM Chart Table 1",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Child Name: ${widget.childData.table1Data.childName ?? 'Not Available'}",
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
                  _buildInfoRow('District', _table2Data.district),
                  _buildInfoRow('Block', _table2Data.block),
                  _buildInfoRow('Facility Name', _table2Data.facilityName),
                  _buildInfoRow('Facility Type', _table2Data.facilityType),
                  _buildInfoRow('Toilet Facility Available',
                      _table2Data.toiletFacilityAvailable),
                  _buildInfoRow('Water Source', _table2Data.waterSource),
                  _buildInfoRow('Referred From', _table2Data.referredFrom),
                  _buildInfoRow('Referral Reason', _table2Data.referredReason),
                ],
              ),
            ),
          ),
        ));
  }

  // Updated Method to Display Each Row in a Single Line
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
