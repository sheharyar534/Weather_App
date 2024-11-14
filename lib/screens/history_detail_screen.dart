// import 'package:flutter/material.dart';

// class HistoryDetailScreen extends StatefulWidget {
//   final String? pickupLocation;
//   final String? dropoffLocation;
//   final double? rideRating;
//   final double? farePrice;
//   final double? rideDistance;

//   const HistoryDetailScreen(
//       {super.key,
//      required this.pickupLocation,
//      required this.dropoffLocation,
//      required this.rideRating,
//      required this.farePrice,
//      required this.rideDistance});

//   @override
//   State<HistoryDetailScreen> createState() => _HistoryDetailScreenState();
// }

// class _HistoryDetailScreenState extends State<HistoryDetailScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         automaticallyImplyLeading: false,
//         title: InkWell(
//           onTap: () {
//             Navigator.pop(context);
//           },
//           child: const Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Icon(
//                 Icons.arrow_back_ios_new,
//                 color: Colors.black,
//               ),
//               Text(
//                 "Back",
//                 style: TextStyle(fontSize: 20, color: Colors.black),
//               )
//             ],
//           ),
//         ),
//         actions: [
//           CircleAvatar(
//             backgroundColor: Colors.green,
//             child: IconButton(
//               onPressed: () {},
//               icon: const Icon(
//                 Icons.settings,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//           const SizedBox(
//             width: 10,
//           ),
//           CircleAvatar(
//             backgroundColor: Colors.amber,
//             child: IconButton(
//               onPressed: () {
//                 Scaffold.of(context).openDrawer();
//               },
//               icon: const Icon(
//                 Icons.menu,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//           const SizedBox(
//             width: 10,
//           ),
//         ],
//       ),
//       body:  Center(
//         child: Column(
//           children: [
//            const  Text("Your History",
//                 style: TextStyle(
//                     fontSize: 40,
//                     color: Colors.black,
//                     fontWeight: FontWeight.w400)),
//                     Text("pickup location : ${widget.pickupLocation}", style:const TextStyle(fontSize: 15,color: Colors.black),),
//                     Text("Dropp Off location : ${widget.dropoffLocation}", style:const TextStyle(fontSize: 15,color: Colors.black),),
//                     Text(" Fare Price : ${widget.farePrice}", style:const TextStyle(fontSize: 15,color: Colors.black),),
//                     Text("Rating :  ${widget.rideRating}", style:const TextStyle(fontSize: 15,color: Colors.black),),
//                     Text("Ride Distance :  ${widget.rideDistance} KM", style:const TextStyle(fontSize: 15,color: Colors.black),),
//           ],
//         ),         
//       ),
//     );
//   }
// }
