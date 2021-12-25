// import 'package:care_plus_doctor/responses/doctor/doctor_notification_responses.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:intl/intl.dart';
//
// Widget NotificationWidget(Doctornotification notification) => Padding(
//       padding: const EdgeInsets.only(left: 10, right: 10),
//       child: Column(
//         children: [
//           Card(
//             child: Padding(
//               padding: const EdgeInsets.only(top: 15, bottom: 10, left: 10),
//               child: Row(
//                 children: [
//                   Expanded(
//                     flex: 1,
//                     child: Container(
//                       height: 45,
//                       width: 45,
//                       decoration: BoxDecoration(
//                         borderRadius: const BorderRadius.all(Radius.circular(10)),
//                         color: Colors.blue.withOpacity(0.2),
//                       ),
//                       child: Icon(
//                         Icons.notification_important_rounded,
//                         color: Colors.blue.withOpacity(0.9),
//                         size: 30,
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     flex: 6,
//                     child: Padding(
//                       padding: const EdgeInsets.only(left: 15),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Container(
//                               alignment: Alignment.centerLeft,
//                               child: Text(
//                                 notification.title,
//                                 style: const TextStyle(
//                                     fontSize: 15, fontWeight: FontWeight.bold),
//                               )),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           Container(
//                               alignment: Alignment.centerLeft,
//                               child: Text(
//                                 notification.body,
//                                 style: const TextStyle(
//                                   fontSize: 9,
//                                   //fontWeight: FontWeight.bold
//                                 ),
//                               )),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Container(
//                                   alignment: Alignment.bottomLeft,
//                                   child: Text(DateFormat("dd-MMM-yyyy")
//                                       .format(notification.createdAt))),
//                               const Text(" || "),
//                               Container(
//                                   alignment: Alignment.bottomLeft,
//                                   child: Text(DateFormat.jms().format(
//                                       DateTime.parse(
//                                           notification.createdAt.toString())))),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//
//
//           Slidable(
//             // Specify a key if the Slidable is dismissible.
//             key: const ValueKey(1),
//
//             // The start action pane is the one at the left or the top side.
//             startActionPane: const ActionPane(
//               // A motion is a widget used to control how the pane animates.
//               motion: ScrollMotion(),
//
//               // All actions are defined in the children parameter.
//               children: [
//                 // A SlidableAction can have an icon and/or a label.
//                 SlidableAction(
//                   onPressed: doNothing,
//                   backgroundColor: Color(0xFFFE4A49),
//                   foregroundColor: Colors.white,
//                   icon: Icons.delete,
//                   label: 'Delete',
//                 ),
//                 SlidableAction(
//                   onPressed: doNothing,
//                   backgroundColor: Color(0xFF21B7CA),
//                   foregroundColor: Colors.white,
//                   icon: Icons.share,
//                   label: 'Share',
//                 ),
//               ],
//             ),
//
//             // The end action pane is the one at the right or the bottom side.
//             endActionPane: ActionPane(
//               motion: const ScrollMotion(),
//               dismissible: DismissiblePane(onDismissed: () {}),
//               children: const [
//                 SlidableAction(
//                   // An action can be bigger than the others.
//                   flex: 2,
//                   onPressed: doNothing,
//                   backgroundColor: Color(0xFF7BC043),
//                   foregroundColor: Colors.white,
//                   icon: Icons.archive,
//                   label: 'Archive',
//                 ),
//                 SlidableAction(
//                   onPressed: doNothing,
//                   backgroundColor: Color(0xFF0392CF),
//                   foregroundColor: Colors.white,
//                   icon: Icons.save,
//                   label: 'Save',
//                 ),
//               ],
//             ),
//
//             // The child of the Slidable is what the user sees when the
//             // component is not dragged.
//             child: const ListTile(title: Text('Slide me')),
//           ),
//
//
//
//
//
//         ],
//
//       ),
//     );
