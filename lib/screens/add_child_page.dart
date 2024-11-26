// // screens/add_child_page.dart
// import 'package:flutter/material.dart';
// import 'package:minor_project/models/sam_chart_table_1.dart';
// import 'package:minor_project/models/sam_chart_table_2.dart';
// import '../models/child_data.dart';
// import 'package:minor_project/constants/globalVariables.dart';

// class AddChildPage extends StatefulWidget {
//   int index;
//   AddChildPage({required this.index});

//   @override
//   State<AddChildPage> createState() => _AddChildPageState();
// }

// class _AddChildPageState extends State<AddChildPage> {
//   final TextEditingController _nameController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Add New Child')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _nameController,
//               decoration: InputDecoration(labelText: 'Child Name'),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 final newChild = ChildData(
//                   table1Data: SamChartTable1(childName: _nameController.text),
//                   table2Data: SamChartTable2(),
//                 );
//                 //childrenData.add(newChild);
//                 Navigator.pop(context, newChild);
//               },
//               child: Text(
//                 'Add Child',
//                 style: TextStyle(color: Colors.black),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:minor_project/models/sam_chart_table_1.dart';
import 'package:minor_project/models/sam_chart_table_2.dart';
import '../models/child_data.dart';

// class AddChildPage extends StatefulWidget {
//   final int index;
//   AddChildPage({required this.index});

//   @override
//   State<AddChildPage> createState() => _AddChildPageState();
// }

// class _AddChildPageState extends State<AddChildPage> {
//   final TextEditingController _nameController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Add New Child'),
//         backgroundColor: Color(0xFF4A55F2), // AppBar color
//       ),
//       body: Container(
//         color: Color(0xFFF5F7FA), // Page background color
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             // Page Title
//             Text(
//               "Add Child Details",
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black,
//               ),
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(height: 20),

//             // Child Name Input
//             Container(
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(10),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.withOpacity(0.2),
//                     blurRadius: 8,
//                     spreadRadius: 2,
//                     offset: Offset(0, 4),
//                   ),
//                 ],
//               ),
//               child: TextField(
//                 controller: _nameController,
//                 decoration: InputDecoration(
//                   labelText: 'Child Name',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   filled: true,
//                   fillColor: Colors.white,
//                   contentPadding: EdgeInsets.symmetric(
//                     horizontal: 16,
//                     vertical: 12,
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 30),

//             // Add Child Button
//             ElevatedButton(
//               onPressed: () {
//                 final newChild = ChildData(
//                   table1Data: SamChartTable1(childName: _nameController.text),
//                   table2Data: SamChartTable2(),
//                 );
//                 Navigator.pop(context, newChild);
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Color(0xFF4A55F2), // Button color
//                 padding: EdgeInsets.symmetric(vertical: 15),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 elevation: 5, // Add shadow to the button
//               ),
//               child: Text(
//                 'Add Child',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:minor_project/blockchain_helper.dart';

class AddChildPage extends StatefulWidget {
  final BlockchainHelper blockchainHelper; // Accept BlockchainHelper
  final Function(ChildData) onAddChild; // Callback to handle adding new child

  const AddChildPage({
    Key? key,
    required this.blockchainHelper,
    required this.onAddChild,
  }) : super(key: key);

  @override
  State<AddChildPage> createState() => _AddChildPageState();
}

class _AddChildPageState extends State<AddChildPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _admissionWeightController =
      TextEditingController();
  final TextEditingController _dischargeWeightController =
      TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _admissionWeightController.dispose();
    _dischargeWeightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Child')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Child Name'),
            ),
            TextField(
              controller: _admissionWeightController,
              keyboardType: TextInputType.number,
              decoration:
                  const InputDecoration(labelText: 'Weight on Admission'),
            ),
            TextField(
              controller: _dischargeWeightController,
              keyboardType: TextInputType.number,
              decoration:
                  const InputDecoration(labelText: 'Weight on Discharge'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                final newChild = ChildData(
                  table1Data: SamChartTable1(
                    childName: _nameController.text,
                  ),
                  table2Data: SamChartTable2(),
                );

                // Call BlockchainHelper to add child data to blockchain
                await widget.blockchainHelper.addChild(
                  _nameController.text,
                  int.parse(_admissionWeightController.text),
                  int.parse(_dischargeWeightController.text),
                );

                // Pass new child data back to parent
                widget.onAddChild(newChild);

                // Close the page
                Navigator.pop(context);
              },
              child: const Text('Add Child to Blockchain'),
            ),
          ],
        ),
      ),
    );
  }
}
