import 'package:flutter/material.dart';
import 'package:minor_project/constants/globalVariables.dart';
import 'package:minor_project/models/child_data.dart';
import 'package:minor_project/models/sam_chart_table_1.dart';
import 'dart:ui';
import 'package:intl_utils/intl_utils.dart';
import 'package:intl/intl.dart';

// class Table1 extends StatefulWidget {
//   // Changed the class name to Table1
//   @override
//   _Table1State createState() => _Table1State();
// }

// class _Table1State extends State<Table1> {
//   final _formKey = GlobalKey<FormState>();
//   SamChartTable1? _childInfoTable1;

//   TextEditingController _dobController = TextEditingController();

//   // Sample data for dropdowns
//   List<String> _genders = ['Male', 'Female'];
//   List<String> _castes = ['General', 'SC', 'ST', 'Others'];
//   List<String> _economicStatuses = ['BPL', 'APL', 'Others'];

//   @override
//   void initState() {
//     super.initState();
//     _childInfoTable1 = SamChartTable1(childName: '');
//   }

//   @override
//   void dispose() {
//     _dobController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('SAM Chart Table 1'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: ListView(
//             children: [
//               // SAM Number
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'SAM No.'),
//                 onSaved: (value) {
//                   _childInfoTable1!.samNumber = value;
//                 },
//               ),
//               // Child's Name (Required)
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Child\'s Name'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Child\'s Name is required';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) {
//                   _childInfoTable1!.childName = value!;
//                 },
//               ),
//               // Father's Name
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Father\'s Name'),
//                 onSaved: (value) {
//                   _childInfoTable1!.fatherName = value;
//                 },
//               ),
//               // Mother's Name
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Mother\'s Name'),
//                 onSaved: (value) {
//                   _childInfoTable1!.motherName = value;
//                 },
//               ),
//               // Date of Birth
//               TextFormField(
//                 controller: _dobController,
//                 decoration:
//                     InputDecoration(labelText: 'Date of Birth (DD/MM/YYYY)'),
//                 keyboardType: TextInputType.datetime,
//                 onTap: () async {
//                   DateTime? pickedDate = await showDatePicker(
//                     context: context,
//                     initialDate: DateTime.now(),
//                     firstDate: DateTime(2000),
//                     lastDate: DateTime(2101),
//                   );
//                   if (pickedDate != null) {
//                     setState(() {
//                       _dobController.text =
//                           "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
//                       _childInfoTable1!.setDateOfBirth(pickedDate);
//                     });
//                   }
//                 },
//               ),
//               // Age in Years and Months (Automatically calculated)
//               Text(
//                   'Age: ${_childInfoTable1!.ageYears ?? 'N/A'} years, ${_childInfoTable1!.ageMonths ?? 'N/A'} months'),
//               // Gender Dropdown
//               DropdownButtonFormField<String>(
//                 decoration: InputDecoration(labelText: 'Gender'),
//                 items: _genders.map((gender) {
//                   return DropdownMenuItem(
//                     value: gender,
//                     child: Text(gender),
//                   );
//                 }).toList(),
//                 onChanged: (value) {
//                   setState(() {
//                     _childInfoTable1!.gender = value;
//                   });
//                 },
//               ),
//               // Caste Dropdown
//               DropdownButtonFormField<String>(
//                 decoration: InputDecoration(labelText: 'Caste'),
//                 items: _castes.map((caste) {
//                   return DropdownMenuItem(
//                     value: caste,
//                     child: Text(caste),
//                   );
//                 }).toList(),
//                 onChanged: (value) {
//                   setState(() {
//                     _childInfoTable1!.caste = value;
//                   });
//                 },
//               ),
//               // Socio-Economic Status Dropdown
//               DropdownButtonFormField<String>(
//                 decoration: InputDecoration(labelText: 'Socio-Economic Status'),
//                 items: _economicStatuses.map((status) {
//                   return DropdownMenuItem(
//                     value: status,
//                     child: Text(status),
//                   );
//                 }).toList(),
//                 onChanged: (value) {
//                   setState(() {
//                     _childInfoTable1!.socioEconomicStatus = value;
//                   });
//                 },
//               ),
//               // Address
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Address'),
//                 onSaved: (value) {
//                   _childInfoTable1!.address = value;
//                 },
//               ),
//               // Contact Number
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Contact Number'),
//                 keyboardType: TextInputType.phone,
//                 onSaved: (value) {
//                   _childInfoTable1!.contactNumber = value;
//                 },
//               ),
//               // Save Button
//               ElevatedButton(
//                 onPressed: () {
//                   if (_formKey.currentState!.validate()) {
//                     _formKey.currentState!.save();
//                     // Process the saved form
//                     print("Child Info Saved: ${_childInfoTable1!.childName}");
//                     // You can proceed with saving the data into blockchain here
//                   }
//                 },
//                 child: Text('Save'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class Table1 extends StatefulWidget {
//   @override
//   _Table1State createState() => _Table1State();
// }

// class _Table1State extends State<Table1> {
//   final _formKey = GlobalKey<FormState>();
//   SamChartTable1? _childInfoTable1;

//   TextEditingController _dobController = TextEditingController();

//   // Sample data for dropdowns
//   List<String> _genders = ['Male', 'Female'];
//   List<String> _castes = ['General', 'SC', 'ST', 'Others'];
//   List<String> _economicStatuses = ['BPL', 'APL', 'Others'];

//   @override
//   void initState() {
//     super.initState();
//     _childInfoTable1 = SamChartTable1(childName: '');
//   }

//   @override
//   void dispose() {
//     _dobController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('SAM Chart Table 1'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // SAM Number
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'SAM No.'),
//                 onSaved: (value) {
//                   _childInfoTable1!.samNumber = value;
//                 },
//               ),
//               SizedBox(height: 16), // Adding space between fields

//               // Child's Name (Required)
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Child\'s Name'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Child\'s Name is required';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) {
//                   _childInfoTable1!.childName = value!;
//                 },
//               ),
//               SizedBox(height: 16),

//               // Father's Name
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Father\'s Name'),
//                 onSaved: (value) {
//                   _childInfoTable1!.fatherName = value;
//                 },
//               ),
//               SizedBox(height: 16),

//               // Mother's Name
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Mother\'s Name'),
//                 onSaved: (value) {
//                   _childInfoTable1!.motherName = value;
//                 },
//               ),
//               SizedBox(height: 16),

//               // Date of Birth
//               TextFormField(
//                 controller: _dobController,
//                 decoration:
//                     InputDecoration(labelText: 'Date of Birth (DD/MM/YYYY)'),
//                 keyboardType: TextInputType.datetime,
//                 onTap: () async {
//                   DateTime? pickedDate = await showDatePicker(
//                     context: context,
//                     initialDate: DateTime.now(),
//                     firstDate: DateTime(2000),
//                     lastDate: DateTime(2101),
//                   );
//                   if (pickedDate != null) {
//                     setState(() {
//                       _dobController.text =
//                           "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
//                       _childInfoTable1!.setDateOfBirth(pickedDate);
//                     });
//                   }
//                 },
//               ),
//               SizedBox(height: 16),

//               // Age in Years and Months (Automatically calculated)
//               Text(
//                   'Age: ${_childInfoTable1!.ageYears ?? 'N/A'} years, ${_childInfoTable1!.ageMonths ?? 'N/A'} months'),
//               SizedBox(height: 16),

//               // Gender Dropdown
//               DropdownButtonFormField<String>(
//                 decoration: InputDecoration(labelText: 'Gender'),
//                 items: _genders.map((gender) {
//                   return DropdownMenuItem(
//                     value: gender,
//                     child: Text(gender),
//                   );
//                 }).toList(),
//                 onChanged: (value) {
//                   setState(() {
//                     _childInfoTable1!.gender = value;
//                   });
//                 },
//               ),
//               SizedBox(height: 16),

//               // Caste Dropdown
//               DropdownButtonFormField<String>(
//                 decoration: InputDecoration(labelText: 'Caste'),
//                 items: _castes.map((caste) {
//                   return DropdownMenuItem(
//                     value: caste,
//                     child: Text(caste),
//                   );
//                 }).toList(),
//                 onChanged: (value) {
//                   setState(() {
//                     _childInfoTable1!.caste = value;
//                   });
//                 },
//               ),
//               SizedBox(height: 16),

//               // Socio-Economic Status Dropdown
//               DropdownButtonFormField<String>(
//                 decoration: InputDecoration(labelText: 'Socio-Economic Status'),
//                 items: _economicStatuses.map((status) {
//                   return DropdownMenuItem(
//                     value: status,
//                     child: Text(status),
//                   );
//                 }).toList(),
//                 onChanged: (value) {
//                   setState(() {
//                     _childInfoTable1!.socioEconomicStatus = value;
//                   });
//                 },
//               ),
//               SizedBox(height: 16),

//               // Address
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Address'),
//                 onSaved: (value) {
//                   _childInfoTable1!.address = value;
//                 },
//               ),
//               SizedBox(height: 16),

//               // Contact Number
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Contact Number'),
//                 keyboardType: TextInputType.phone,
//                 onSaved: (value) {
//                   _childInfoTable1!.contactNumber = value;
//                 },
//               ),
//               SizedBox(height: 16),

//               // Save Button
//               ElevatedButton(
//                 onPressed: () {
//                   if (_formKey.currentState!.validate()) {
//                     _formKey.currentState!.save();
//                     print("Child Info Saved: ${_childInfoTable1!.childName}");
//                     // You can proceed with saving the data into blockchain here
//                   }
//                 },
//                 child: Text(
//                   'Save',
//                   style: TextStyle(color: Colors.black),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:minor_project/models/sam_chart_table_1.dart';

// class Table1 extends StatefulWidget {
//   final int index;
//   final ChildData childData;
//   Table1({required this.index, required this.childData});
//   @override
//   _Table1State createState() => _Table1State();
// }

// class _Table1State extends State<Table1> {
//   late SamChartTable1 _childInfoTable1;

//   final TextEditingController _dobController = TextEditingController();
//   DateTime? _selectedDate;
//   final DateFormat formatter = DateFormat('dd-MM-yyyy');

//   final List<String> _genders = ['Male', 'Female'];
//   final List<String> _castes = ['General', 'SC', 'ST', 'Others'];
//   final List<String> _economicStatuses = ['BPL', 'APL', 'Others'];

//   @override
//   void initState() {
//     super.initState();
//     _childInfoTable1 = widget.childData.table1Data;
//   }

//   @override
//   void dispose() {
//     _dobController.dispose();
//     super.dispose();
//   }

//   void _presentDatePicker() async {
//     final now = DateTime.now();
//     final firstDate = DateTime(now.year - 50, now.month, now.day);
//     print("hello1");
//     final pickedDate = await showDatePicker(
//         context: context,
//         initialDate: now,
//         firstDate: firstDate,
//         lastDate: now);

//     if (pickedDate != null) {
//       setState(() {
//         _selectedDate = pickedDate;
//         _childInfoTable1?.dateOfBirth = _selectedDate;
//         print("Selected date: $_selectedDate");
//       });
//     } else {
//       print("No date was selected.");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('SAM Chart Table 1'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // SAM Number
//               Row(
//                 children: [
//                   Expanded(
//                     child: TextField(
//                       decoration: InputDecoration(labelText: 'SAM No.'),
//                       onChanged: (value) {
//                         _childInfoTable1!.samNumber = value;
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 16),

//               // Child's Name
//               Row(
//                 children: [
//                   Expanded(
//                     child: TextField(
//                       decoration: InputDecoration(labelText: 'Child\'s Name'),
//                       onChanged: (value) {
//                         _childInfoTable1!.childName = value;
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 16),

//               // Father's Name
//               Row(
//                 children: [
//                   Expanded(
//                     child: TextField(
//                       decoration: InputDecoration(labelText: 'Father\'s Name'),
//                       onChanged: (value) {
//                         _childInfoTable1!.fatherName = value;
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 16),

//               // Mother's Name
//               Row(
//                 children: [
//                   Expanded(
//                     child: TextField(
//                       decoration: InputDecoration(labelText: 'Mother\'s Name'),
//                       onChanged: (value) {
//                         _childInfoTable1!.motherName = value;
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 16),

//               // Date of Birth
//               Row(
//                 children: [
//                   // Expanded(
//                   //   child: TextField(
//                   //     controller: _dobController,
//                   //     decoration: InputDecoration(
//                   //         labelText: 'Date of Birth (DD/MM/YYYY)'),
//                   //     keyboardType: TextInputType.datetime,
//                   //     onTap: () async {
//                   //       DateTime? pickedDate = await showDatePicker(
//                   //         context: context,
//                   //         initialDate: DateTime.now(),
//                   //         firstDate: DateTime(2000),
//                   //         lastDate: DateTime(2101),
//                   //       );
//                   //       if (pickedDate != null) {
//                   //         setState(() {
//                   //           _dobController.text =
//                   //               "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
//                   //           _childInfoTable1!.setDateOfBirth(pickedDate);
//                   //           print(_dobController.text);
//                   //         });
//                   //       }
//                   //     },
//                   //   ),
//                   // ),
//                   Expanded(
//                       child: Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Text(_selectedDate == null
//                           ? 'No date selected'
//                           : formatter.format(_selectedDate!)),
//                       IconButton(
//                         onPressed: _presentDatePicker,
//                         icon: const Icon(Icons.calendar_month),
//                       ),
//                     ],
//                   ))
//                 ],
//               ),
//               SizedBox(height: 16),

//               // Age Display
//               Row(
//                 children: [
//                   Text(
//                     'Age: ${_childInfoTable1!.ageYears ?? 'N/A'} years, ${_childInfoTable1!.ageMonths ?? 'N/A'} months',
//                   ),
//                 ],
//               ),
//               SizedBox(height: 16),

//               // Gender Dropdown
//               Row(
//                 children: [
//                   Expanded(
//                     child: DropdownButtonFormField<String>(
//                       decoration: InputDecoration(labelText: 'Gender'),
//                       items: _genders.map((gender) {
//                         return DropdownMenuItem(
//                           value: gender,
//                           child: Text(gender),
//                         );
//                       }).toList(),
//                       onChanged: (value) {
//                         setState(() {
//                           _childInfoTable1!.gender = value;
//                         });
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 16),

//               // Caste Dropdown
//               Row(
//                 children: [
//                   Expanded(
//                     child: DropdownButtonFormField<String>(
//                       decoration: InputDecoration(labelText: 'Caste'),
//                       items: _castes.map((caste) {
//                         return DropdownMenuItem(
//                           value: caste,
//                           child: Text(caste),
//                         );
//                       }).toList(),
//                       onChanged: (value) {
//                         setState(() {
//                           _childInfoTable1!.caste = value;
//                         });
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 16),

//               // Socio-Economic Status Dropdown
//               Row(
//                 children: [
//                   Expanded(
//                     child: DropdownButtonFormField<String>(
//                       decoration:
//                           InputDecoration(labelText: 'Socio-Economic Status'),
//                       items: _economicStatuses.map((status) {
//                         return DropdownMenuItem(
//                           value: status,
//                           child: Text(status),
//                         );
//                       }).toList(),
//                       onChanged: (value) {
//                         setState(() {
//                           _childInfoTable1!.socioEconomicStatus = value;
//                         });
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 16),

//               // Address
//               Row(
//                 children: [
//                   Expanded(
//                     child: TextField(
//                       decoration: InputDecoration(labelText: 'Address'),
//                       onChanged: (value) {
//                         _childInfoTable1!.address = value;
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 16),

//               // Contact Number
//               Row(
//                 children: [
//                   Expanded(
//                     child: TextField(
//                       decoration: InputDecoration(labelText: 'Contact Number'),
//                       keyboardType: TextInputType.phone,
//                       onChanged: (value) {
//                         _childInfoTable1!.contactNumber = value;
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 16),

//               // Save Button
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   ElevatedButton(
//                     onPressed: () {
//                       childrenData[widget.index].table1Data = _childInfoTable1;
//                       // Saving data logic here
//                       // Pop back to table1Page and pass 'true' to indicate that data was updated
//                       Navigator.pop(context, true);
//                     },
//                     child: Text('Save', style: TextStyle(color: Colors.black)),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:minor_project/models/sam_chart_table_1.dart';

class Table1 extends StatefulWidget {
  final int index;
  final ChildData childData;

  Table1({required this.index, required this.childData});

  @override
  _Table1State createState() => _Table1State();
}

class _Table1State extends State<Table1> {
  late SamChartTable1 _childInfoTable1;

  final TextEditingController _dobController = TextEditingController();
  DateTime? _selectedDate;
  final List<String> _genders = ['Male', 'Female'];
  final List<String> _castes = ['General', 'SC', 'ST', 'Others'];
  final List<String> _economicStatuses = ['BPL', 'APL', 'Others'];

  @override
  void initState() {
    super.initState();
    _childInfoTable1 = widget.childData.table1Data;

    // Set the selected date and calculate the age if `dateOfBirth` exists
    if (_childInfoTable1.dateOfBirth != null) {
      _selectedDate = _childInfoTable1.dateOfBirth;
      _calculateAge(_selectedDate!);
    }
  }

  @override
  void dispose() {
    _dobController.dispose();
    super.dispose();
  }

  // Method to calculate age based on dateOfBirth
  void _calculateAge(DateTime dob) {
    final now = DateTime.now();
    int years = now.year - dob.year;
    int months = now.month - dob.month;

    if (months < 0) {
      years -= 1;
      months += 12;
    }

    setState(() {
      _childInfoTable1.ageYears = years;
      _childInfoTable1.ageMonths = months;
    });
  }

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 50, now.month, now.day);
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
        _childInfoTable1.dateOfBirth = pickedDate;
        _calculateAge(pickedDate); // Recalculate age when the date is picked
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SAM Chart Table 1'),
        backgroundColor: Color(0xFF4A55F2),
      ),
      body: Container(
        color: Color(0xFFF5F7FA), // Page background color
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Page Header
              Container(
                padding: EdgeInsets.all(16),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Edit Table 1 Data",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Child Name: ${_childInfoTable1.childName ?? 'Not Available'}",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Input Fields
              ..._buildInputField('SAM No.', _childInfoTable1.samNumber,
                  (value) => _childInfoTable1.samNumber = value),
              ..._buildInputField('Child\'s Name', _childInfoTable1.childName,
                  (value) => _childInfoTable1.childName = value),
              ..._buildInputField('Father\'s Name', _childInfoTable1.fatherName,
                  (value) => _childInfoTable1.fatherName = value),
              ..._buildInputField('Mother\'s Name', _childInfoTable1.motherName,
                  (value) => _childInfoTable1.motherName = value),
              _buildDatePicker(),
              _buildInfoText(
                  'Age: ${_childInfoTable1.ageYears ?? 'N/A'} years, ${_childInfoTable1.ageMonths ?? 'N/A'} months'),
              _buildDropdownField('Gender', _genders, _childInfoTable1.gender,
                  (value) {
                setState(() {
                  _childInfoTable1.gender = value;
                });
              }),
              _buildDropdownField('Caste', _castes, _childInfoTable1.caste,
                  (value) {
                setState(() {
                  _childInfoTable1.caste = value;
                });
              }),
              _buildDropdownField('Socio-Economic Status', _economicStatuses,
                  _childInfoTable1.socioEconomicStatus, (value) {
                setState(() {
                  _childInfoTable1.socioEconomicStatus = value;
                });
              }),
              ..._buildInputField('Address', _childInfoTable1.address, (value) {
                _childInfoTable1.address = value;
              }),
              ..._buildInputField(
                  'Contact Number', _childInfoTable1.contactNumber, (value) {
                _childInfoTable1.contactNumber = value;
              }),

              SizedBox(height: 16),

              // Save Button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
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
      ),
    );
  }

  // Helper methods for input fields
  List<Widget> _buildInputField(
      String label, String? value, ValueChanged<String> onChanged) {
    return [
      SizedBox(height: 16),
      TextField(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          filled: true,
          fillColor: Colors.white,
        ),
        controller: TextEditingController(text: value),
        onChanged: onChanged,
      ),
    ];
  }

  Widget _buildDatePicker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16),
        Text(
          'Date of Birth',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _selectedDate == null
                  ? 'No date selected'
                  : "${_selectedDate?.day}/${_selectedDate?.month}/${_selectedDate?.year}",
            ),
            IconButton(
              onPressed: _presentDatePicker,
              icon: Icon(Icons.calendar_today),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildInfoText(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black,
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
