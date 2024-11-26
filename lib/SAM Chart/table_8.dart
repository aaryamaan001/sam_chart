import 'package:flutter/material.dart';
import '../models/sam_chart_table_8.dart';

class Table8 extends StatefulWidget {
  final SamChartTable8 table8Data;

  Table8({required this.table8Data});

  @override
  _Table8State createState() => _Table8State();
}

class _Table8State extends State<Table8> {
  late SamChartTable8 _table8Data;

  final TextEditingController _whichMilkController = TextEditingController();
  final TextEditingController _ageOfIntroductionController =
      TextEditingController();
  final TextEditingController _frequencyController = TextEditingController();
  final TextEditingController _dietaryDiversityController =
      TextEditingController();

  final List<String> _yesNoOptions = ['Yes', 'No'];

  String? _selectedBreastFeeding;
  String? _selectedAnyOtherMilk;
  String? _selectedComplementaryFeeds;

  @override
  void initState() {
    super.initState();
    _table8Data = widget.table8Data;

    _selectedBreastFeeding = _table8Data.breastFeedingAtPresent;
    _selectedAnyOtherMilk = _table8Data.anyOtherMilk;
    _selectedComplementaryFeeds = _table8Data.complementaryFeeds;
    _whichMilkController.text = _table8Data.whichMilk ?? '';
    _ageOfIntroductionController.text = _table8Data.ageOfIntroduction ?? '';
    _frequencyController.text =
        _table8Data.frequencyOfComplementaryFeeding ?? '';
    _dietaryDiversityController.text = _table8Data.dietaryDiversity ?? '';
  }

  void _saveData() {
    setState(() {
      _table8Data.breastFeedingAtPresent = _selectedBreastFeeding;
      _table8Data.anyOtherMilk = _selectedAnyOtherMilk;
      _table8Data.whichMilk = _whichMilkController.text;
      _table8Data.complementaryFeeds = _selectedComplementaryFeeds;
      _table8Data.ageOfIntroduction = _ageOfIntroductionController.text;
      _table8Data.frequencyOfComplementaryFeeding = _frequencyController.text;
      _table8Data.dietaryDiversity = _dietaryDiversityController.text;

      Navigator.pop(context, true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit SAM Chart Table 8'),
        backgroundColor: Color(0xFF4A55F2),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDropdownField('Breast Feeding At Present', _yesNoOptions,
                _selectedBreastFeeding, (value) {
              setState(() {
                _selectedBreastFeeding = value;
              });
            }),
            _buildDropdownField(
                'Any Other Milk', _yesNoOptions, _selectedAnyOtherMilk,
                (value) {
              setState(() {
                _selectedAnyOtherMilk = value;
              });
            }),
            if (_selectedAnyOtherMilk == 'Yes')
              _buildTextField('If Yes, Which Milk', _whichMilkController,
                  TextInputType.text),
            _buildDropdownField('Complementary Feeds', _yesNoOptions,
                _selectedComplementaryFeeds, (value) {
              setState(() {
                _selectedComplementaryFeeds = value;
              });
            }),
            if (_selectedComplementaryFeeds == 'Yes')
              _buildTextField('If Yes, Age of Introduction',
                  _ageOfIntroductionController, TextInputType.number),
            _buildTextField('Frequency of Complementary Feeding',
                _frequencyController, TextInputType.text),
            _buildTextField('Dietary Diversity', _dietaryDiversityController,
                TextInputType.text),
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
