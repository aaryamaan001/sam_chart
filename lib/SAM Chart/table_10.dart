import 'package:flutter/material.dart';
import '../models/sam_chart_table_10.dart';

class Table10 extends StatefulWidget {
  final SamChartTable10 table10Data;

  Table10({required this.table10Data});

  @override
  _Table10State createState() => _Table10State();
}

class _Table10State extends State<Table10> {
  late SamChartTable10 _table10Data;

  final TextEditingController _hemoglobinController = TextEditingController();
  final TextEditingController _bloodGlucoseController = TextEditingController();
  final TextEditingController _totalLeucocyteCountController =
      TextEditingController();
  final TextEditingController _differentialLeucocyteCountController =
      TextEditingController();
  final TextEditingController _urineTestController = TextEditingController();
  final TextEditingController _testForTBController = TextEditingController();
  final TextEditingController _serumElectrolytesController =
      TextEditingController();
  final TextEditingController _otherTestsController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _table10Data = widget.table10Data;

    _hemoglobinController.text = _table10Data.hemoglobin?.toString() ?? '';
    _bloodGlucoseController.text = _table10Data.bloodGlucose?.toString() ?? '';
    _totalLeucocyteCountController.text =
        _table10Data.totalLeucocyteCount?.toString() ?? '';
    _differentialLeucocyteCountController.text =
        _table10Data.differentialLeucocyteCount ?? '';
    _urineTestController.text = _table10Data.urineTest ?? '';
    _testForTBController.text = _table10Data.testForTB ?? '';
    _serumElectrolytesController.text = _table10Data.serumElectrolytes ?? '';
    _otherTestsController.text = _table10Data.otherTests ?? '';
  }

  void _saveData() {
    setState(() {
      _table10Data.hemoglobin = double.tryParse(_hemoglobinController.text);
      _table10Data.bloodGlucose = double.tryParse(_bloodGlucoseController.text);
      _table10Data.totalLeucocyteCount =
          int.tryParse(_totalLeucocyteCountController.text);
      _table10Data.differentialLeucocyteCount =
          _differentialLeucocyteCountController.text;
      _table10Data.urineTest = _urineTestController.text;
      _table10Data.testForTB = _testForTBController.text;
      _table10Data.serumElectrolytes = _serumElectrolytesController.text;
      _table10Data.otherTests = _otherTestsController.text;

      Navigator.pop(context, true); // Return true to indicate changes
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit SAM Chart Table 10'),
        backgroundColor: Color(0xFF4A55F2),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTextField('Hemoglobin (gm%)', _hemoglobinController,
                TextInputType.number),
            _buildTextField('Blood Glucose (gm/dl)', _bloodGlucoseController,
                TextInputType.number),
            _buildTextField('Total Leucocyte Count',
                _totalLeucocyteCountController, TextInputType.number),
            _buildTextField('Differential Leucocyte Count',
                _differentialLeucocyteCountController),
            _buildTextField('Urine Test', _urineTestController),
            _buildTextField(
                'Test for TB (Chest X-ray & Montoux)', _testForTBController),
            _buildTextField('Serum Electrolytes', _serumElectrolytesController),
            _buildTextField('Other Tests', _otherTestsController),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: _saveData,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF4A55F2),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Save',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller,
      [TextInputType inputType = TextInputType.text]) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        keyboardType: inputType,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}
