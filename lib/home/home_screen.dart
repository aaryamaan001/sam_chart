import 'package:flutter/material.dart';
import 'package:minor_project/asha_worker/children_list_asha.dart';
import 'package:minor_project/home/dummy_screen.dart';
import 'package:minor_project/screens/children_list_page.dart';

// class HomeScreen extends StatelessWidget {
//   final String userName; // Dynamic user's name
//   final String email; // Dynamic user's email

//   HomeScreen({required this.userName, required this.email});

//   @override
//   Widget build(BuildContext context) {
//     // Helper method to create drawer items
//     Widget _buildDrawerItem({
//       required IconData icon,
//       required String title,
//       required VoidCallback onTap,
//     }) {
//       return ListTile(
//         leading: CircleAvatar(
//           backgroundColor: Color(0xFF4A55F2), // Icon background color
//           child: Icon(icon, color: Colors.white),
//         ),
//         title: Text(title),
//         trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
//         onTap: onTap, // Navigate to respective page
//       );
//     }

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color(0xFF4A55F2), // AppBar color
//         title: Text("Home Page"),
//       ),
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: [
//             DrawerHeader(
//               decoration: BoxDecoration(
//                 color: Color(0xFFB6E1DC), // Header background color
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   CircleAvatar(
//                     radius: 40,
//                     child: Icon(Icons.person, size: 40, color: Colors.white),
//                     backgroundColor:
//                         Colors.grey[300], // Background color for the avatar
//                   ),
//                   SizedBox(height: 10),
//                   Text(
//                     userName, // Dynamic username
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 16,
//                     ),
//                   ),
//                   Text(
//                     email, // Dynamic email
//                     style: TextStyle(
//                       color: Colors.grey[700],
//                       fontSize: 14,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             // Drawer menu items
//             _buildDrawerItem(
//               icon: Icons.person,
//               title: "Patient List",
//               onTap: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => ChildrenListPage(),
//                     ));
//               },
//             ),
//             _buildDrawerItem(
//               icon: Icons.assignment,
//               title: "Daily Instruction",
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) =>
//                           DummyPage(title: "Daily Instruction")),
//                 );
//               },
//             ),
//             _buildDrawerItem(
//               icon: Icons.restaurant,
//               title: "Daily Feeding",
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => DummyPage(title: "Daily Feeding")),
//                 );
//               },
//             ),
//             _buildDrawerItem(
//               icon: Icons.check_circle,
//               title: "Follow Up",
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => DummyPage(title: "Follow Up")),
//                 );
//               },
//             ),
//             _buildDrawerItem(
//               icon: Icons.history,
//               title: "History",
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => ChildrenListAsha()),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//       body: Center(child: Text("Home Page Content")), // Empty body
//     );
//   }
// }

import 'package:minor_project/blockchain_helper.dart';

class HomeScreen extends StatelessWidget {
  final BlockchainHelper blockchainHelper;

  const HomeScreen({Key? key, required this.blockchainHelper})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            // Example usage of blockchainHelper
            await blockchainHelper.addChild("John Doe", 50, 60);
            print("Child added to blockchain");
          },
          child: const Text("Add Child to Blockchain"),
        ),
      ),
    );
  }
}
