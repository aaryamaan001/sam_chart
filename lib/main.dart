import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:minor_project/SAM%20Chart/table_1.dart';
import 'package:minor_project/SAM%20Chart/table_2.dart';
import 'package:minor_project/SAM%20Chart/table_3.dart';
import 'package:minor_project/SAM%20Chart/table_4.dart';
import 'package:minor_project/auth/login_screen.dart';
import 'package:minor_project/auth/signup_screen.dart';
import 'package:minor_project/constants/globalVariables.dart';
import 'package:minor_project/home/home_screen.dart';
import 'package:minor_project/models/sam_chart_table_10.dart';
import 'package:minor_project/models/sam_chart_table_4.dart';
import 'package:minor_project/models/sam_chart_table_5.dart';
import 'package:minor_project/models/sam_chart_table_7.dart';
import 'package:minor_project/models/sam_chart_table_8.dart';
import 'package:minor_project/models/sam_chart_table_9.dart';
import 'package:minor_project/router.dart';
import 'package:minor_project/screens/children_list_page.dart';
import 'package:minor_project/screens/table10_page.dart';
import 'package:minor_project/screens/table4_page.dart';
import 'package:minor_project/screens/table5_page.dart';
import 'package:minor_project/screens/table7_page.dart';
import 'package:minor_project/screens/table8_page.dart';
import 'package:minor_project/screens/table9_page.dart';

// void main() {
//   // runApp(MultiProvider(
//   //     providers: [ChangeNotifierProvider(create: (context) => UserProvider())],
//   //     child: const MyApp()));
//   runApp(const MyApp());
// }
// void main() {
//   // Initialize the BlockchainHelper
//   final blockchainHelper = BlockchainHelper(
//     'lib/assets/ChildData.json', // Path to your ABI file
//     '0x0A2BDe6B378A09954218275DC3Da54524e5a00e5'        // Replace with your contract address
//   );

//   runApp(MyApp(blockchainHelper: blockchainHelper));
// }

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Minor-Project',
//       theme: ThemeData(
//         //scaffoldBackgroundColor: const Color.fromARGB(255, 210, 210, 209),
//         primarySwatch: Colors.blue,
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: Table10Page(index: 0, table10Data: new SamChartTable10()),
//       //home: LoginScreen(),
//       routes: {
//         '/signup': (context) => SignUpScreen(),
//         '/login': (context) => LoginScreen(),
//         '/childrenListPage': (context) => ChildrenListPage(),
//       },
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:minor_project/blockchain_helper.dart';
import 'package:minor_project/home/home_screen.dart'; // Adjust based on your folder structure
import 'dart:convert';
// void main() {
//   // Initialize the BlockchainHelper
//   final blockchainHelper = BlockchainHelper(
//       'lib/assets/ChildData.json', // Path to your ABI file
//       '0x0A2BDe6B378A09954218275DC3Da54524e5a00e5' // Replace with your deployed contract address
//       );

//   runApp(MyApp(blockchainHelper: blockchainHelper));
// }

// class MyApp extends StatelessWidget {
//   final BlockchainHelper blockchainHelper;

//   const MyApp({Key? key, required this.blockchainHelper}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Blockchain App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       // home: HomeScreen(blockchainHelper: blockchainHelper),
//       home: loginScreen(blockchainHelper: blockchainHelper),
//     );
//   }
// }

Future<void> loadContract() async {
  try {
    // Load the ABI file as a string
    final abiCode = await rootBundle.loadString('lib/assets/ChildData.json');
    final contractABI = jsonDecode(abiCode)["abi"];
    print("ABI Loaded Successfully: $contractABI");
  } catch (e) {
    print("Error loading ABI: $e");
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Required for async in main()

  // Load ABI before starting the app
  await loadContract();

  // Initialize the BlockchainHelper
  final blockchainHelper = BlockchainHelper(
    'lib/assets/ChildData.json', // Path to your ABI file
    '0x0A2BDe6B378A09954218275DC3Da54524e5a00e5', // Replace with your deployed contract address
  );

  runApp(MyApp(blockchainHelper: blockchainHelper));
}

class MyApp extends StatelessWidget {
  final BlockchainHelper blockchainHelper;

  const MyApp({Key? key, required this.blockchainHelper}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blockchain App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Choose between HomeScreen or loginScreen
      home: loginScreen(blockchainHelper: blockchainHelper),
    );
  }
}
