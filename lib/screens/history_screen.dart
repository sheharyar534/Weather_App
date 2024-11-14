// import 'package:flutter/material.dart';
// import 'package:weather1_app/services/history_modal.dart';
// import '../services/repository.dart';

// class HistoryScreen extends StatefulWidget {
//   const HistoryScreen({super.key});

//   @override
//   State<HistoryScreen> createState() => _HistoryScreenState();
// }

// class _HistoryScreenState extends State<HistoryScreen> {
//   List<HistoryDataModel> tripHistory = [];

//   HistoryRepository historyRepository = HistoryRepository();
//   @override
//   void initState() {
//     super.initState();
//     getHistory();
//   }

//   getHistory() async {
//     tripHistory = await historyRepository.getHistory();
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
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
//       body: Container(
//         color: Colors.black12,
//         child: ListView.builder(
//           itemCount: tripHistory.length,
//           itemBuilder: (context, index) => ListTile(
//             title: Text(
//               tripHistory[index].pickupLocation,
//             ),
//             subtitle: Text(
//               tripHistory[index].dropLocation,
//             ),
//             trailing: Text(
//               tripHistory[index].farePrice.toString(),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// /*
//   @override
//   Widget build(BuildContext context) {
//     // print(tripHistory);
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
//       body: SingleChildScrollView(
//         child: Center(
//           child: Column(
//             children: [
//               const Text(
//                 "Ride History",
//                 style: TextStyle(
//                     fontSize: 40,
//                     color: Colors.black,
//                     fontWeight: FontWeight.w400),
//               ),
//               const SizedBox(
//                 height: 50,
//               ),
//               SizedBox(
//                 height: 550,
//                 child: ListView.builder(
//                     itemCount: tripHistory.length,
//                     itemBuilder: (context, int index) {
//                       return Container(
//                         height: MediaQuery.of(context).size.height * 0.1,
//                         width: MediaQuery.of(context).size.width * 0.95,
//                         margin: const EdgeInsets.symmetric(vertical: 8.0),
//                         decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius:
//                                 const BorderRadius.all(Radius.circular(10)),
//                             border: Border.all(color: Colors.black26)),
//                         child: InkWell(
//                           onTap: () {
//                             Navigator.push(context, MaterialPageRoute(
//                               builder: (context) {
//                                 return HistoryDetailScreen(
//                                   pickupLocation: tripHistory[index]
//                                       ["pickup_location"],
//                                   dropoffLocation: tripHistory[index]
//                                       ["drop_location"],
//                                   rideRating: tripHistory[index]["rating"],
//                                   rideDistance: tripHistory[index]["distance"],
//                                   farePrice: tripHistory[index]["fare_price"],
//                                 );
//                               },
//                             ));
//                           },
//                           child: ListTile(
//                             leading: tripHistory[index]['status'] == 'COMPLETED'
//                                 ? CircleAvatar(
//                                     radius: MediaQuery.of(context).size.height *
//                                         0.023,
//                                     backgroundColor: Colors.black12,
//                                     child: CircleAvatar(
//                                         radius:
//                                             MediaQuery.of(context).size.height *
//                                                 0.02,
//                                         backgroundColor: Colors.white,
//                                         child: const Icon(
//                                           Icons.check_circle_sharp,
//                                           color: Colors.green,
//                                         )),
//                                   )
//                                 : CircleAvatar(
//                                     radius: MediaQuery.of(context).size.height *
//                                         0.023,
//                                     backgroundColor: Colors.black12,
//                                     child: CircleAvatar(
//                                         radius:
//                                             MediaQuery.of(context).size.height *
//                                                 0.02,
//                                         backgroundColor: Colors.white,
//                                         child: const Icon(
//                                           Icons.cancel,
//                                           color: Colors.red,
//                                         )),
//                                   ),
//                             title: Text(
//                               tripHistory[index]['drop_location'],
//                               style: const TextStyle(color: Colors.black),
//                             ),
//                             subtitle: Row(
//                               children: [
//                                 Text("${tripHistory[index]["distance"]} km"),
//                                 const SizedBox(
//                                   width: 10,
//                                 ),
//                                 Text(
//                                     "${tripHistory[index]["driver"]?["rating"] ?? '-'}"),
//                               ],
//                             ),
//                             trailing: Column(
//                               crossAxisAlignment: CrossAxisAlignment.end,
//                               children: [
//                                 Container(
//                                   decoration: BoxDecoration(
//                                       color: tripHistory[index]['status'] ==
//                                               'COMPLETED'
//                                           ? Colors.green
//                                           : Colors.red,
//                                       borderRadius: const BorderRadius.all(
//                                           Radius.circular(10)),
//                                       border:
//                                           Border.all(color: Colors.black12)),
//                                   height: MediaQuery.of(context).size.height *
//                                       0.025,
//                                   width:
//                                       MediaQuery.of(context).size.width * 0.2,
//                                   child: Center(
//                                     child: Text(
//                                       tripHistory[index]["status"],
//                                       style: Theme.of(context)
//                                           .textTheme
//                                           .bodySmall
//                                           ?.copyWith(color: Colors.white),
//                                       textAlign: TextAlign.center,
//                                     ),
//                                   ),
//                                 ),
//                                 const Icon(
//                                   // rideHistoryVertical[index]['trailing'],
//                                   Icons.arrow_forward,
//                                   size: 33,
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                       );
//                     }),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//   */
// }
