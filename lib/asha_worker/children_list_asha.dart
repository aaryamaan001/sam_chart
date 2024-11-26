import 'package:flutter/material.dart';
import 'package:minor_project/blockchain_helper.dart';
import 'package:minor_project/asha_worker/child_detail_asha.dart';
import 'package:minor_project/models/child_data.dart';
import 'package:minor_project/screens/add_child_page.dart';
import 'package:minor_project/screens/child_detail_page.dart';
import '../models/child_data.dart';
import 'package:minor_project/constants/globalVariables.dart';

class ChildrenListAsha extends StatefulWidget {
  final BlockchainHelper blockchainHelper;
  const ChildrenListAsha({Key? key, required this.blockchainHelper})
      : super(key: key);
  @override
  _ChildrenListAshaState createState() => _ChildrenListAshaState();
}

class _ChildrenListAshaState extends State<ChildrenListAsha> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Children List'),
        backgroundColor: Color(0xFF4A55F2), // AppBar color
      ),
      body: ListView.builder(
        itemCount: childrenData.length,
        itemBuilder: (context, index) {
          final child = childrenData[index];

          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xFFB6E1DC), width: 1.5),
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: ListTile(
              contentPadding: EdgeInsets.all(8.0),
              leading: CircleAvatar(
                radius: 30,
                backgroundColor: Color(0xFFB6E1DC), // Circle background color
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 30,
                ), // Placeholder icon for avatar
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Patient ID: ${index + 1}",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[700],
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Patient Name: ${child.table1Data.childName}",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              trailing: IconButton(
                icon: Icon(Icons.info, color: Color(0xFF4A55F2), size: 30),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ChildDetailAsha(index: index, childData: child),
                    ),
                  );
                },
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ChildDetailPage(index: index, childData: child),
                  ),
                );
              },
            ),
          );
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     final newChild = await Navigator.push<ChildData>(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => AddChildPage(index: childrenData.length)),
      //     );

      //     if (newChild != null) {
      //       setState(() => childrenData.add(newChild));
      //     }
      //   },
      //   backgroundColor: Color(0xFF4A55F2), // Button background color
      //   child: Icon(
      //     Icons.add,
      //     color: Colors.white, // Button icon color
      //   ),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddChildPage(
                blockchainHelper: widget.blockchainHelper, // Pass the helper
                onAddChild: (newChild) {
                  setState(() {
                    childrenData.add(newChild);
                  });
                },
              ),
            ),
          );
        },
        backgroundColor: Color(0xFF4A55F2), // Button background color
        child: const Icon(
          Icons.add,
          color: Colors.white, // Button icon color
        ),
      ),

      backgroundColor: Color(0xFFF5F7FA), // Page background color
    );
  }
}
