import 'package:flutter/material.dart';
import '../models/sam_chart_table_7.dart';

class Table7 extends StatefulWidget {
  final SamChartTable7 table7Data;

  Table7({required this.table7Data});

  @override
  _Table7State createState() => _Table7State();
}

class _Table7State extends State<Table7> {
  late SamChartTable7 _table7Data;

  final TextEditingController _diarrhoeaController = TextEditingController();
  final TextEditingController _vomitingController = TextEditingController();
  final TextEditingController _feverController = TextEditingController();
  final TextEditingController _hypothermiaController = TextEditingController();
  final TextEditingController _coughController = TextEditingController();
  final TextEditingController _lethargyController = TextEditingController();
  final TextEditingController _swellingController = TextEditingController();
  final TextEditingController _otherController = TextEditingController();
  final TextEditingController _immunizationController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _table7Data = widget.table7Data;

    _diarrhoeaController.text = _table7Data.diarrhoeaRemarks ?? '';
    _vomitingController.text = _table7Data.vomitingRemarks ?? '';
    _feverController.text = _table7Data.feverRemarks ?? '';
    _hypothermiaController.text = _table7Data.hypothermiaRemarks ?? '';
    _coughController.text = _table7Data.coughRemarks ?? '';
    _lethargyController.text = _table7Data.lethargyRemarks ?? '';
    _swellingController.text = _table7Data.swellingRemarks ?? '';
    _otherController.text = _table7Data.otherRemarks ?? '';
    _immunizationController.text = _table7Data.immunizationHistory ?? '';
  }

  void _saveData() {
    setState(() {
      _table7Data.diarrhoeaRemarks = _diarrhoeaController.text;
      _table7Data.vomitingRemarks = _vomitingController.text;
      _table7Data.feverRemarks = _feverController.text;
      _table7Data.hypothermiaRemarks = _hypothermiaController.text;
      _table7Data.coughRemarks = _coughController.text;
      _table7Data.lethargyRemarks = _lethargyController.text;
      _table7Data.swellingRemarks = _swellingController.text;
      _table7Data.otherRemarks = _otherController.text;
      _table7Data.immunizationHistory = _immunizationController.text;

      Navigator.pop(context, true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit SAM Chart Table 7'),
        backgroundColor: Color(0xFF4A55F2),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildTextField('Diarrhoea Remarks', _diarrhoeaController),
            _buildTextField('Vomiting Remarks', _vomitingController),
            _buildTextField('Fever Remarks', _feverController),
            _buildTextField('Hypothermia Remarks', _hypothermiaController),
            _buildTextField('Cough Remarks', _coughController),
            _buildTextField('Lethargy Remarks', _lethargyController),
            _buildTextField('Swelling Remarks', _swellingController),
            _buildTextField('Other Remarks', _otherController),
            _buildTextField('Immunization History', _immunizationController),
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

  Widget _buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
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
