import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/sam_chart_table_5.dart';

class Table5 extends StatefulWidget {
  //final int index;
  final SamChartTable5 table5Data;

  Table5({required this.table5Data});

  @override
  _Table5State createState() => _Table5State();
}

class _Table5State extends State<Table5> {
  late SamChartTable5 _table5Data;

  final TextEditingController _durationOfStayController =
      TextEditingController();
  final TextEditingController _dischargeWeightKgController =
      TextEditingController();
  final TextEditingController _dischargeWeightGmsController =
      TextEditingController();
  final TextEditingController _dischargeMUACController =
      TextEditingController();
  final TextEditingController _averageWeightGainController =
      TextEditingController();

  final List<String> _exitIndicators = [
    'Discharged with target weight',
    'Discharged without reaching target weight',
    'Defaulter',
    'Non-Respondent',
    'Death'
  ];
  final List<String> _sstOptions = ['Yes', 'No', 'Not Applicable'];
  final List<String> _sstOutcomes = ['Successful', 'Not Successful', 'NA'];

  String? _selectedExitIndicator;
  String? _selectedSST;
  String? _selectedSSTOutcome;
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    _table5Data = widget.table5Data;

    _selectedDate = _table5Data.dateOfDischarge;
    _selectedExitIndicator = _table5Data.exitIndicator;
    _selectedSST = _table5Data.supplementarySuckingTechnique;
    _selectedSSTOutcome = _table5Data.outcomeOfSST;
    _durationOfStayController.text =
        _table5Data.durationOfStay?.toString() ?? '';
    _dischargeWeightKgController.text =
        _table5Data.dischargeWeightKg?.toString() ?? '';
    _dischargeWeightGmsController.text =
        _table5Data.dischargeWeightGms?.toString() ?? '';
    _dischargeMUACController.text = _table5Data.dischargeMUAC?.toString() ?? '';
    _averageWeightGainController.text =
        _table5Data.averageWeightGainPerDay?.toString() ?? '';
  }

  void _saveData() {
    setState(() {
      _table5Data.dateOfDischarge = _selectedDate;
      _table5Data.exitIndicator = _selectedExitIndicator;
      _table5Data.supplementarySuckingTechnique = _selectedSST;
      _table5Data.outcomeOfSST = _selectedSSTOutcome;
      _table5Data.durationOfStay = int.tryParse(_durationOfStayController.text);
      _table5Data.dischargeWeightKg =
          double.tryParse(_dischargeWeightKgController.text);
      _table5Data.dischargeWeightGms =
          int.tryParse(_dischargeWeightGmsController.text);
      _table5Data.dischargeMUAC = int.tryParse(_dischargeMUACController.text);
      _table5Data.averageWeightGainPerDay =
          double.tryParse(_averageWeightGainController.text);

      Navigator.pop(context, true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit SAM Chart Table 5'),
        backgroundColor: Color(0xFF4A55F2),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDateField('Date of Discharge', _selectedDate, (date) {
              setState(() {
                _selectedDate = date;
              });
            }),
            _buildDropdownField(
                'Exit Indicator', _exitIndicators, _selectedExitIndicator,
                (value) {
              setState(() {
                _selectedExitIndicator = value;
              });
            }),
            _buildDropdownField(
                'Supplementary Sucking Technique', _sstOptions, _selectedSST,
                (value) {
              setState(() {
                _selectedSST = value;
              });
            }),
            _buildDropdownField(
                'Outcome of SST', _sstOutcomes, _selectedSSTOutcome, (value) {
              setState(() {
                _selectedSSTOutcome = value;
              });
            }),
            _buildTextField('Duration of Stay (in days)',
                _durationOfStayController, TextInputType.number),
            _buildTextField('Discharge Weight (Kg)',
                _dischargeWeightKgController, TextInputType.number),
            _buildTextField('Discharge Weight (gms)',
                _dischargeWeightGmsController, TextInputType.number),
            _buildTextField('Discharge WHZ Score', _averageWeightGainController,
                TextInputType.number),
            _buildTextField('Discharge Weight', _averageWeightGainController,
                TextInputType.number),
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

  Widget _buildDateField(
      String label, DateTime? date, ValueChanged<DateTime?> onDateSelected) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
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
          GestureDetector(
            onTap: () async {
              DateTime? selectedDate = await showDatePicker(
                context: context,
                initialDate: date ?? DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime.now(),
              );
              if (selectedDate != null) onDateSelected(selectedDate);
            },
            child: Text(
              date != null
                  ? DateFormat('yyyy-MM-dd').format(date)
                  : 'Select Date',
              style: TextStyle(
                color: Color(0xFF4A55F2),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
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
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          filled: true,
          fillColor: Colors.white,
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

  Widget _buildTextField(
      String label, TextEditingController controller, TextInputType inputType) {
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
