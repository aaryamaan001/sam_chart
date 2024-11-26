import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For formatting dates
import '../models/sam_chart_table_4.dart';

class Table4 extends StatefulWidget {
  final SamChartTable4 table4Data;

  Table4({required this.table4Data});

  @override
  _Table4State createState() => _Table4State();
}

class _Table4State extends State<Table4> {
  final TextEditingController _admissionWeightKgController =
      TextEditingController();
  final TextEditingController _admissionWeightGmsController =
      TextEditingController();
  final TextEditingController _admissionHeightController =
      TextEditingController();
  final TextEditingController _whzScoreController = TextEditingController();
  final TextEditingController _muacController = TextEditingController();
  final TextEditingController _complicationsController =
      TextEditingController();

  final List<String> _oedemaOptions = ['0', '+', '++', '+++'];
  final List<String> _appetiteTestOptions = ['Pass', 'Fail'];

  String? _selectedOedema;
  String? _selectedAppetiteTest;
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    // Initialize the controllers with existing data
    _admissionWeightKgController.text =
        widget.table4Data.admissionWeightKg?.toString() ?? '';
    _admissionWeightGmsController.text =
        widget.table4Data.admissionWeightGms?.toString() ?? '';
    _admissionHeightController.text =
        widget.table4Data.admissionHeight?.toString() ?? '';
    _whzScoreController.text = widget.table4Data.whzScore?.toString() ?? '';
    _muacController.text = widget.table4Data.muac?.toString() ?? '';
    _selectedOedema = widget.table4Data.oedema;
    _selectedAppetiteTest = widget.table4Data.appetiteTest;
    _complicationsController.text = widget.table4Data.complications ?? '';
    _selectedDate = widget.table4Data.dateOfAdmission;
  }

  void _saveData() {
    setState(() {
      widget.table4Data.dateOfAdmission = _selectedDate;
      widget.table4Data.admissionWeightKg =
          double.tryParse(_admissionWeightKgController.text);
      widget.table4Data.admissionWeightGms =
          int.tryParse(_admissionWeightGmsController.text);
      widget.table4Data.admissionHeight =
          double.tryParse(_admissionHeightController.text);
      widget.table4Data.whzScore = double.tryParse(_whzScoreController.text);
      widget.table4Data.muac = int.tryParse(_muacController.text);
      widget.table4Data.oedema = _selectedOedema;
      widget.table4Data.appetiteTest = _selectedAppetiteTest;
      widget.table4Data.complications = _complicationsController.text;
      Navigator.pop(context, true); // Return true to indicate changes
    });
  }

  void _selectDate(BuildContext context) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final DateFormat dateFormat = DateFormat('dd/MM/yyyy'); // Format for date

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Admission Details'),
        backgroundColor: Color(0xFF4A55F2),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildDatePicker('Date of Admission', dateFormat),
            _buildInputField(
                'Admission Weight (Kg)', _admissionWeightKgController),
            _buildInputField(
                'Admission Weight (Gms)', _admissionWeightGmsController),
            _buildInputField(
                'Admission Height (Cms)', _admissionHeightController),
            _buildInputField('WHZ Score', _whzScoreController),
            _buildInputField('MUAC (mm)', _muacController),
            _buildDropdownField('Oedema', _oedemaOptions, _selectedOedema,
                (value) {
              setState(() {
                _selectedOedema = value;
              });
            }),
            _buildDropdownField(
                'Appetite Test', _appetiteTestOptions, _selectedAppetiteTest,
                (value) {
              setState(() {
                _selectedAppetiteTest = value;
              });
            }),
            _buildInputField('Complications', _complicationsController),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _saveData,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF4A55F2),
              ),
              child: Text(
                'Save',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget _buildDatePicker(String label, DateFormat dateFormat) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: () => _selectDate(context),
        child: InputDecorator(
          decoration: InputDecoration(
            labelText: label,
            border: OutlineInputBorder(),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _selectedDate == null
                    ? 'Select a date'
                    : dateFormat
                        .format(_selectedDate!), // Format and display the date
                style: TextStyle(
                  color: _selectedDate == null ? Colors.grey : Colors.black,
                ),
              ),
              Icon(Icons.calendar_today, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownField(String label, List<String> items, String? value,
      ValueChanged<String?> onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
        value: value,
        items: items
            .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(item),
                ))
            .toList(),
        onChanged: onChanged,
      ),
    );
  }
}
