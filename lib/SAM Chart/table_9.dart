import 'package:flutter/material.dart';
import '../models/sam_chart_table_9.dart';

class Table9 extends StatefulWidget {
  final SamChartTable9 table9Data;

  Table9({required this.table9Data});

  @override
  _Table9State createState() => _Table9State();
}

class _Table9State extends State<Table9> {
  late SamChartTable9 _table9Data;

  final TextEditingController _alteredSensoriumController =
      TextEditingController();
  final TextEditingController _hairChangesDescriptionController =
      TextEditingController();
  final TextEditingController _skinChangesDescriptionController =
      TextEditingController();
  final TextEditingController _vitaminADeficiencyDescriptionController =
      TextEditingController();
  final TextEditingController _otherObservationsController =
      TextEditingController();

  final List<String> _consciousnessOptions = [
    'Alert',
    'Irritable',
    'Lethargic'
  ];
  final List<String> _yesNoOptions = ['Yes', 'No'];
  final List<String> _dehydrationOptions = [
    'No Dehydration',
    'Some Dehydration',
    'Severe Dehydration'
  ];

  String? _selectedConsciousness;
  String? _hairChanges;
  String? _skinChanges;
  String? _vitaminADeficiency;
  String? _palmarPallor;
  String? _pallorSeverity;
  String? _dehydration;

  @override
  void initState() {
    super.initState();
    _table9Data = widget.table9Data;

    _alteredSensoriumController.text = _table9Data.alteredSensorium ?? '';
    _hairChangesDescriptionController.text =
        _table9Data.hairChangesDescription ?? '';
    _skinChangesDescriptionController.text =
        _table9Data.skinChangesDescription ?? '';
    _vitaminADeficiencyDescriptionController.text =
        _table9Data.vitaminADeficiencyDescription ?? '';
    _otherObservationsController.text = _table9Data.otherObservations ?? '';

    _selectedConsciousness = _table9Data.consciousness;
    _hairChanges = _table9Data.hairChanges;
    _skinChanges = _table9Data.skinChanges;
    _vitaminADeficiency = _table9Data.vitaminADeficiency;
    _palmarPallor = _table9Data.palmarPallor;
    _pallorSeverity = _table9Data.pallorSeverity;
    _dehydration = _table9Data.dehydration;
  }

  void _saveData() {
    setState(() {
      _table9Data.alteredSensorium = _alteredSensoriumController.text;
      _table9Data.hairChangesDescription =
          _hairChangesDescriptionController.text;
      _table9Data.skinChangesDescription =
          _skinChangesDescriptionController.text;
      _table9Data.vitaminADeficiencyDescription =
          _vitaminADeficiencyDescriptionController.text;
      _table9Data.otherObservations = _otherObservationsController.text;

      _table9Data.consciousness = _selectedConsciousness;
      _table9Data.hairChanges = _hairChanges;
      _table9Data.skinChanges = _skinChanges;
      _table9Data.vitaminADeficiency = _vitaminADeficiency;
      _table9Data.palmarPallor = _palmarPallor;
      _table9Data.pallorSeverity = _pallorSeverity;
      _table9Data.dehydration = _dehydration;

      Navigator.pop(context, true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit SAM Chart Table 9'),
        backgroundColor: Color(0xFF4A55F2),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTextField('Altered Sensorium', _alteredSensoriumController),
            _buildDropdownField(
                'Consciousness', _consciousnessOptions, _selectedConsciousness,
                (value) {
              setState(() {
                _selectedConsciousness = value;
              });
            }),
            _buildDropdownField('Hair Changes', _yesNoOptions, _hairChanges,
                (value) {
              setState(() {
                _hairChanges = value;
              });
            }),
            _buildTextField(
                'Hair Changes Description', _hairChangesDescriptionController),
            _buildDropdownField('Skin Changes', _yesNoOptions, _skinChanges,
                (value) {
              setState(() {
                _skinChanges = value;
              });
            }),
            _buildTextField(
                'Skin Changes Description', _skinChangesDescriptionController),
            _buildDropdownField('Eye—Signs of Vitamin-A Deficiency',
                _yesNoOptions, _vitaminADeficiency, (value) {
              setState(() {
                _vitaminADeficiency = value;
              });
            }),
            _buildTextField('Vitamin A Deficiency Description',
                _vitaminADeficiencyDescriptionController),
            _buildDropdownField('Palmar Pallor', _yesNoOptions, _palmarPallor,
                (value) {
              setState(() {
                _palmarPallor = value;
              });
            }),
            _buildDropdownField(
                'Pallor Severity', ['Some', 'Severe'], _pallorSeverity,
                (value) {
              setState(() {
                _pallorSeverity = value;
              });
            }),
            _buildDropdownField(
                'Dehydration', _dehydrationOptions, _dehydration, (value) {
              setState(() {
                _dehydration = value;
              });
            }),
            _buildTextField('Other Observations', _otherObservationsController),
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
}
