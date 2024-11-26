// import 'package:flutter/material.dart';
// import 'package:minor_project/models/child_data.dart';
// import 'package:minor_project/models/sam_chart_table_2.dart';

// class Table2 extends StatefulWidget {
//   @override
//   _Table2State createState() => _Table2State();
// }

// class _Table2State extends State<Table2> {
//   SamChartTable2 _samChartTable2 = SamChartTable2();

//   // TextEditingControllers for user input
//   final TextEditingController _districtController = TextEditingController();
//   final TextEditingController _blockController = TextEditingController();
//   final TextEditingController _facilityNameController = TextEditingController();
//   final TextEditingController _facilityTypeController = TextEditingController();

//   // Dropdown options for fields
//   List<String> _toiletFacilityOptions = ['Yes', 'No'];
//   List<String> _waterSources = [
//     'Pipeline',
//     'Tube well',
//     'Well',
//     'Pond',
//     'Others'
//   ];
//   List<String> _referredFromOptions = [
//     'AWW',
//     'ASHA',
//     'ANM',
//     'Self',
//     'OPD/Pediatric Ward'
//   ];
//   List<String> _referralReasons = ['Nutritional referral', 'Medical Transfer'];

//   String? _selectedToiletFacility;
//   String? _selectedWaterSource;
//   String? _selectedReferredFrom;
//   String? _selectedReferralReason;

//   @override
//   void dispose() {
//     // Dispose of the controllers when not needed
//     _districtController.dispose();
//     _blockController.dispose();
//     _facilityNameController.dispose();
//     _facilityTypeController.dispose();
//     super.dispose();
//   }

//   void _saveData() {
//     setState(() {
//       // Save user input to the SamChartTable2 object
//       _samChartTable2.district = _districtController.text;
//       _samChartTable2.block = _blockController.text;
//       _samChartTable2.facilityName = _facilityNameController.text;
//       _samChartTable2.facilityType = _facilityTypeController.text;
//       _samChartTable2.toiletFacilityAvailable = _selectedToiletFacility;
//       _samChartTable2.waterSource = _selectedWaterSource;
//       _samChartTable2.referredFrom = _selectedReferredFrom;
//       _samChartTable2.referredReason = _selectedReferralReason;

//       // Here you can process the data, e.g., send it to a backend or save it
//       print("Data saved: ${_samChartTable2.toJson()}");
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('SAM Chart Table 2 Input'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // District
//               TextField(
//                 controller: _districtController,
//                 decoration: InputDecoration(labelText: 'District'),
//               ),
//               SizedBox(height: 16),
//               // Block
//               TextField(
//                 controller: _blockController,
//                 decoration: InputDecoration(labelText: 'Block'),
//               ),
//               SizedBox(height: 16),
//               // Name of the Facility
//               TextField(
//                 controller: _facilityNameController,
//                 decoration: InputDecoration(labelText: 'Facility Name'),
//               ),
//               SizedBox(height: 16),
//               // Type of Facility
//               TextField(
//                 controller: _facilityTypeController,
//                 decoration: InputDecoration(labelText: 'Type of Facility'),
//               ),
//               SizedBox(height: 16),
//               // Toilet Facility Available Dropdown
//               DropdownButtonFormField<String>(
//                 decoration: InputDecoration(
//                     labelText: 'Toilet facility available at Child\'s home'),
//                 value: _selectedToiletFacility,
//                 items: _toiletFacilityOptions.map((option) {
//                   return DropdownMenuItem(
//                     value: option,
//                     child: Text(option),
//                   );
//                 }).toList(),
//                 onChanged: (value) {
//                   setState(() {
//                     _selectedToiletFacility = value;
//                   });
//                 },
//               ),
//               SizedBox(height: 16),
//               // Source of Drinking Water Dropdown
//               DropdownButtonFormField<String>(
//                 decoration: InputDecoration(
//                     labelText:
//                         'Source of drinking water (tick appropriate one)'),
//                 value: _selectedWaterSource,
//                 items: _waterSources.map((source) {
//                   return DropdownMenuItem(
//                     value: source,
//                     child: Text(source),
//                   );
//                 }).toList(),
//                 onChanged: (value) {
//                   setState(() {
//                     _selectedWaterSource = value;
//                   });
//                 },
//               ),
//               SizedBox(height: 16),
//               // Referred From Dropdown
//               DropdownButtonFormField<String>(
//                 decoration: InputDecoration(
//                     labelText: 'Referred from (tick appropriate one)'),
//                 value: _selectedReferredFrom,
//                 items: _referredFromOptions.map((source) {
//                   return DropdownMenuItem(
//                     value: source,
//                     child: Text(source),
//                   );
//                 }).toList(),
//                 onChanged: (value) {
//                   setState(() {
//                     _selectedReferredFrom = value;
//                   });
//                 },
//               ),
//               SizedBox(height: 16),
//               // Referral Reason Dropdown
//               DropdownButtonFormField<String>(
//                 decoration: InputDecoration(
//                     labelText: 'Reason for referral (tick appropriate one)'),
//                 value: _selectedReferralReason,
//                 items: _referralReasons.map((reason) {
//                   return DropdownMenuItem(
//                     value: reason,
//                     child: Text(reason),
//                   );
//                 }).toList(),
//                 onChanged: (value) {
//                   setState(() {
//                     _selectedReferralReason = value;
//                   });
//                 },
//               ),
//               SizedBox(height: 16),
//               // Save Button
//               ElevatedButton(
//                 onPressed: _saveData,
//                 child: Text('Save'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:minor_project/models/sam_chart_table_2.dart';
import '../models/child_data.dart';

class Table2 extends StatefulWidget {
  final int index;
  final ChildData childData;

  Table2({required this.index, required this.childData});

  @override
  _Table2State createState() => _Table2State();
}

class _Table2State extends State<Table2> {
  late SamChartTable2 _table2Data;

  final TextEditingController _districtController = TextEditingController();
  final TextEditingController _blockController = TextEditingController();
  final TextEditingController _facilityNameController = TextEditingController();
  final TextEditingController _facilityTypeController = TextEditingController();

  final List<String> _toiletFacilityOptions = ['Yes', 'No'];
  final List<String> _waterSources = [
    'Pipeline',
    'Tube well',
    'Well',
    'Pond',
    'Others'
  ];
  final List<String> _referredFromOptions = [
    'AWW',
    'ASHA',
    'ANM',
    'Self',
    'OPD/Pediatric Ward'
  ];
  final List<String> _referralReasons = [
    'Nutritional referral',
    'Medical Transfer'
  ];

  String? _selectedToiletFacility;
  String? _selectedWaterSource;
  String? _selectedReferredFrom;
  String? _selectedReferralReason;

  @override
  void initState() {
    super.initState();
    _table2Data = widget.childData.table2Data; // Initialize data from childData

    // Populate the controllers with existing data
    _districtController.text = _table2Data.district ?? '';
    _blockController.text = _table2Data.block ?? '';
    _facilityNameController.text = _table2Data.facilityName ?? '';
    _facilityTypeController.text = _table2Data.facilityType ?? '';
    _selectedToiletFacility = _table2Data.toiletFacilityAvailable;
    _selectedWaterSource = _table2Data.waterSource;
    _selectedReferredFrom = _table2Data.referredFrom;
    _selectedReferralReason = _table2Data.referredReason;
  }

  void _saveData() {
    setState(() {
      // Update the data in `table2Data`
      _table2Data.district = _districtController.text;
      _table2Data.block = _blockController.text;
      _table2Data.facilityName = _facilityNameController.text;
      _table2Data.facilityType = _facilityTypeController.text;
      _table2Data.toiletFacilityAvailable = _selectedToiletFacility;
      _table2Data.waterSource = _selectedWaterSource;
      _table2Data.referredFrom = _selectedReferredFrom;
      _table2Data.referredReason = _selectedReferralReason;

      // Save changes and navigate back
      Navigator.pop(context, true); // Return true to indicate changes
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit SAM Chart Table 2'),
        backgroundColor: Color(0xFF4A55F2),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ..._buildInputField('District', _districtController),
            ..._buildInputField('Block', _blockController),
            ..._buildInputField('Facility Name', _facilityNameController),
            ..._buildInputField('Facility Type', _facilityTypeController),
            _buildDropdownField('Toilet Facility Available',
                _toiletFacilityOptions, _selectedToiletFacility, (value) {
              setState(() {
                _selectedToiletFacility = value;
              });
            }),
            _buildDropdownField(
                'Source of Drinking Water', _waterSources, _selectedWaterSource,
                (value) {
              setState(() {
                _selectedWaterSource = value;
              });
            }),
            _buildDropdownField(
                'Referred From', _referredFromOptions, _selectedReferredFrom,
                (value) {
              setState(() {
                _selectedReferredFrom = value;
              });
            }),
            _buildDropdownField('Reason for Referral', _referralReasons,
                _selectedReferralReason, (value) {
              setState(() {
                _selectedReferralReason = value;
              });
            }),
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

  List<Widget> _buildInputField(
      String label, TextEditingController controller) {
    return [
      SizedBox(height: 16),
      TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    ];
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
