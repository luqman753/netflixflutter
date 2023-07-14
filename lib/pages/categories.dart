// import 'package:flutter/material.dart';

// import '../size_config.dart';

// class Categories extends StatefulWidget {
//   const Categories({Key? key}) : super(key: key);

//   @override
//   _CategoriesState createState() => _CategoriesState();
// }

// class _CategoriesState extends State<Categories> {
//   @override
//   Widget build(BuildContext context) {
//     MySize().init(context);

//     return Scaffold(
//         body: Stack(
//       children: [
//         ListView.builder(
//             padding: EdgeInsets.zero,
//             itemCount: 50,
//             itemBuilder: (BuildContext context, int index) {
//               return Padding(
//                 padding: EdgeInsets.only(bottom: MySize.size12),
//                 child: Column(
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.only(
//                           left: MySize.size4,
//                           right: MySize.size4,
//                           top: MySize.size2,
//                           bottom: MySize.size12),
//                       child:
//                           Text("Genre", style: TextStyle(color: Colors.white)),
//                     ),
//                   ],
//                 ),
//               );
//             }),
//       ],
//     ));
//   }
// }
