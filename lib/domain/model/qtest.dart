// import 'package:flutter/material.dart';
// import 'package:g4c/domain/repositories/enumerations.dart';
// import 'package:g4c/presentation/components/pref_bar.dart';

// void main() {
//   runApp(const TestApp());
// }

// class TestApp extends StatelessWidget {
//   const TestApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: Home(),
//     );
//   }
// }

// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   var qset = qset1;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Column(children: qset),
//           ElevatedButton(
//             onPressed: () {
//               setState(() {
//                 qset = qset1;
//               });
//             },
//             child: const Text('Set 1'),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               setState(() {
//                 qset = qset2;
//               });
//             },
//             child: const Text('Set 2'),
//           )
//         ],
//       ),
//     );
//   }
// }
