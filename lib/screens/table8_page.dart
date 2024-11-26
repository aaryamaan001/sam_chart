import 'package:flutter/material.dart';
import 'package:minor_project/SAM%20Chart/table_8.dart';
import '../models/sam_chart_table_8.dart';

class Table8Page extends StatefulWidget {
  final int index;
  final SamChartTable8 table8Data;

  Table8Page({required this.index, required this.table8Data});

  @override
  _Table8PageState createState() => _Table8PageState();
}

class _Table8PageState extends State<Table8Page> {
  late SamChartTable8 _table8Data;

  @override
  void initState() {
    super.initState();
    _table8Data = widget.table8Data;
  }

  void navigateToEditTable8() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Table8(table8Data: _table8Data),
      ),
    );

    if (result == true) {
      setState(() {
        // Refresh the UI after editing
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SAM Chart Table 8'),
        backgroundColor: Color(0xFF4A55F2),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: navigateToEditTable8,
          ),
        ],
      ),
      body: Container(
        color: Color(0xFFF5F7FA),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildInfoRow('Breast Feeding At Present',
                _table8Data.breastFeedingAtPresent),
            _buildInfoRow('Any Other Milk', _table8Data.anyOtherMilk),
            if (_table8Data.anyOtherMilk == 'Yes')
              _buildInfoRow('Which Milk', _table8Data.whichMilk),
            _buildInfoRow(
                'Complementary Feeds', _table8Data.complementaryFeeds),
            if (_table8Data.complementaryFeeds == 'Yes')
              _buildInfoRow(
                  'Age of Introduction', _table8Data.ageOfIntroduction),
            _buildInfoRow('Frequency of Complementary Feeding',
                _table8Data.frequencyOfComplementaryFeeding),
            _buildInfoRow('Dietary Diversity', _table8Data.dietaryDiversity),
          ],
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
