// import 'package:flutter/material.dart';
// import 'package:flutterudemyportfolio/project/project_view.dart';

// class ProjectItembody extends StatelessWidget {
//   const ProjectItembody({
//     Key key,
//     @required this.item,
//   }) : super(key: key);

//   final ProjectItem item;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Image.asset(item.image),
//         SizedBox(
//           height: 15,
//         ),
//         Text(
//           item.title,
//           style: Theme.of(context).textTheme.headline4,
//         ),
//         SizedBox(
//           height: 10,
//         ),
//         Text(
//           item.description,
//           style: TextStyle(fontSize: 17),
//         ),
//         SizedBox(
//           height: 20,
//         ),
//         Row(
//           children: [
//             for (final tech in item.technologies)
//               Padding(
//                 padding: const EdgeInsets.only(right: 8.0),
//                 child: Chip(label: Text(tech)),
//               )
//           ],
//         ),
//         SizedBox(
//           height: 50,
//         )
//       ],
//     );
//   }
// }
