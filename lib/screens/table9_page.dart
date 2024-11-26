import 'package:flutter/material.dart';
import '../models/sam_chart_table_9.dart';
import '../SAM Chart/table_9.dart';

class Table9Page extends StatefulWidget {
  final int index;
  final SamChartTable9 table9Data;

  Table9Page({required this.index, required this.table9Data});

  @override
  _Table9PageState createState() => _Table9PageState();
}

class _Table9PageState extends State<Table9Page> {
  late SamChartTable9 _table9Data;

  @override
  void initState() {
    super.initState();
    _table9Data = widget.table9Data;
  }

  void navigateToEditTable9() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Table9(table9Data: _table9Data),
      ),
    );

    if (result == true) {
      setState(() {
        // Reflect updated data
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SAM Chart Table 9'),
        backgroundColor: Color(0xFF4A55F2),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: navigateToEditTable9,
          ),
        ],
      ),
      body: Container(
        color: Color(0xFFF5F7FA),
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildInfoRow('Cyanosis', _table9Data.cyanosis),
              _buildInfoRow(
                  'Severe Visible Wasting', _table9Data.severeVisibleWasting),
              _buildInfoRow('Altered Sensorium', _table9Data.alteredSensorium),
              _buildInfoRow('Consciousness', _table9Data.consciousness),
              _buildInfoRow('Hair Changes', _table9Data.hairChanges),
              _buildInfoRow('Hair Changes Description',
                  _table9Data.hairChangesDescription),
              _buildInfoRow('Skin Changes', _table9Data.skinChanges),
              _buildInfoRow('Skin Changes Description',
                  _table9Data.skinChangesDescription),
              _buildInfoRow(
                  'Vitamin A Deficiency', _table9Data.vitaminADeficiency),
              _buildInfoRow('Vitamin A Deficiency Description',
                  _table9Data.vitaminADeficiencyDescription),
              _buildInfoRow('Palmar Pallor', _table9Data.palmarPallor),
              _buildInfoRow('Pallor Severity', _table9Data.pallorSeverity),
              _buildInfoRow('Dehydration', _table9Data.dehydration),
              _buildInfoRow(
                  'Other Observations', _table9Data.otherObservations),
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
          Text(label,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.grey[600])),
          Text(value ?? 'N/A',
              style: TextStyle(fontSize: 16, color: Colors.black)),
        ],
      ),
    );
  }
}
