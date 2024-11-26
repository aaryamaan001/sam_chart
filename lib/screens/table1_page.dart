// import 'package:flutter/material.dart';
// import 'package:minor_project/SAM%20Chart/table_1.dart';
// import 'package:minor_project/models/child_data.dart';

// class Table1Page extends StatefulWidget {
//   int index;
//   final ChildData childData;

//   Table1Page({required this.index, required this.childData});

//   @override
//   _Table1PageState createState() => _Table1PageState();
// }

// class _Table1PageState extends State<Table1Page> {
//   @override
//   Widget build(BuildContext context) {
//     final table1Data = widget.childData.table1Data;

//     void navigateToTable1() async {
//       final result = await Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) =>
//               Table1(index: widget.index, childData: widget.childData),
//         ),
//       );

//       if (result == true) {
//         setState(() {
//           // Trigger a rebuild to reflect the updated data
//         });
//       }
//     }

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('SAM Chart Table 1'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.edit),
//             onPressed: () {
//               navigateToTable1();
//             },
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             _buildInfoRow('SAM No.', table1Data.samNumber),
//             _buildInfoRow('Child\'s Name', table1Data.childName),
//             _buildInfoRow('Father\'s Name', table1Data.fatherName),
//             _buildInfoRow('Mother\'s Name', table1Data.motherName),
//             _buildInfoRow('Date of Birth', table1Data.dateOfBirth?.toString()),
//             _buildInfoRow('Age (Years)', table1Data.ageYears?.toString()),
//             _buildInfoRow('Age (Months)', table1Data.ageMonths?.toString()),
//             _buildInfoRow('Gender', table1Data.gender),
//             _buildInfoRow('Caste', table1Data.caste),
//             _buildInfoRow(
//                 'Socio-Economic Status', table1Data.socioEconomicStatus),
//             _buildInfoRow('Address', table1Data.address),
//             _buildInfoRow('Contact Number', table1Data.contactNumber),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildInfoRow(String label, String? value) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
//           Text(value ?? 'null'),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:minor_project/SAM%20Chart/table_1.dart';
import 'package:minor_project/models/child_data.dart';
import 'package:minor_project/models/sam_chart_table_1.dart';

class Table1Page extends StatefulWidget {
  final int index;
  final ChildData childData;

  Table1Page({required this.index, required this.childData});

  @override
  _Table1PageState createState() => _Table1PageState();
}

class _Table1PageState extends State<Table1Page> {
  @override
  Widget build(BuildContext context) {
    final table1Data = widget.childData.table1Data;

    void navigateToTable1() async {
      final result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              Table1(index: widget.index, childData: widget.childData),
        ),
      );

      if (result == true) {
        setState(() {
          // Trigger a rebuild to reflect the updated data
        });
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('SAM Chart Table 1'),
        backgroundColor: Color(0xFF4A55F2),
        actions: [
          IconButton(
            icon: Icon(Icons.edit, color: Colors.white),
            onPressed: () {
              navigateToTable1();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
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
                      "Child Name: ${table1Data.childName ?? 'Not Available'}",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Data Rows
              ..._buildInfoRows(table1Data),
            ],
          ),
        ),
      ),
    );
  }

  // Generate a list of styled information rows
  List<Widget> _buildInfoRows(SamChartTable1 table1Data) {
    final data = {
      'SAM No.': table1Data.samNumber,
      'Father\'s Name': table1Data.fatherName,
      'Mother\'s Name': table1Data.motherName,
      'Date of Birth': table1Data.dateOfBirth?.toString(),
      'Age (Years)': table1Data.ageYears?.toString(),
      'Age (Months)': table1Data.ageMonths?.toString(),
      'Gender': table1Data.gender,
      'Caste': table1Data.caste,
      'Socio-Economic Status': table1Data.socioEconomicStatus,
      'Address': table1Data.address,
      'Contact Number': table1Data.contactNumber,
    };

    return data.entries.map((entry) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        padding: EdgeInsets.all(12),
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
              entry.key,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.grey[700],
              ),
            ),
            Text(
              entry.value ?? 'Not Available',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ],
        ),
      );
    }).toList();
  }
}
