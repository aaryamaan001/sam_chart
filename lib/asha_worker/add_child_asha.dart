import 'package:flutter/material.dart';
import 'package:minor_project/models/child_data.dart';
import 'package:minor_project/models/sam_chart_table_1.dart';
import 'package:minor_project/models/sam_chart_table_2.dart';

class AddChildAsha extends StatefulWidget {
  final int index;
  AddChildAsha({required this.index});

  @override
  State<AddChildAsha> createState() => _AddChildPageState();
}

class _AddChildPageState extends State<AddChildAsha> {
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Child'),
        backgroundColor: Color(0xFF4A55F2), // AppBar color
      ),
      body: Container(
        color: Color(0xFFF5F7FA), // Page background color
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Page Title
            Text(
              "Add Child Details",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),

            // Child Name Input
            Container(
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
              child: TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Child Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),

            // Add Child Button
            ElevatedButton(
              onPressed: () {
                final newChild = ChildData(
                  table1Data: SamChartTable1(childName: _nameController.text),
                  table2Data: SamChartTable2(),
                );
                Navigator.pop(context, newChild);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF4A55F2), // Button color
                padding: EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 5, // Add shadow to the button
              ),
              child: Text(
                'Add Child',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
