// import 'package:flutter/material.dart';
// import 'package:netflix_flutter/pages/webview.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// import '../json/video_detail_json.dart';
// import '../size_config.dart';

// class DetailScreen extends StatefulWidget {
//   final String? videoUrl;
//   final data;

//   const DetailScreen({Key? key, this.videoUrl, this.data}) : super(key: key);
//   @override
//   _DetailScreenState createState() => _DetailScreenState();
// }

// class _DetailScreenState extends State<DetailScreen> {
//   int activeEpisode = 0;

//   // for video player
//   YoutubePlayerController? videoController;
//   YoutubeMetaData? videoMetaData;
//   YoutubePlayerValue? videoValue;

//   @override
//   void initState() {
//     super.initState();
//     videoMetaData = const YoutubeMetaData();
//     videoValue = YoutubePlayerValue();
//     videoController = YoutubePlayerController(
//         initialVideoId: '2BBU93EbCpQ',
//         flags: const YoutubePlayerFlags(
//           autoPlay: true,
//           hideControls: true,
//           disableDragSeek: false,
//           loop: true,
//           isLive: false,
//           forceHD: false,
//           enableCaption: false,
//           // endAt: 29,
//         ));
//     videoController!.play();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     videoController!.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: PreferredSize(
//         preferredSize: const Size.fromHeight(40),
//         child: getAppBar(),
//       ),
//       body: getBody(),
//     );
//   }

//   Widget getAppBar() {
//     return AppBar(
//       backgroundColor: Colors.black,
//       // elevation: 0,
//       leading: IconButton(
//           icon: Icon(
//             Icons.arrow_back_ios,
//             color: Colors.white,
//             size: 20,
//           ),
//           onPressed: () {
//             Navigator.pop(context);
//           }),
//     );
//   }

//   Widget getBody() {
//     var size = MediaQuery.of(context).size;
//     return Container(
//       // width: size.width,
//       // height: size.height,
//       child: Column(
//         children: [
//           YoutubePlayer(
//             showVideoProgressIndicator: true,
//             aspectRatio: 16 / 9,
//             controller: videoController!,
//           ),
//           Container(
//             height: size.height - 320,
//             child: SingleChildScrollView(
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       widget.data.title.toString(),
//                       style: TextStyle(
//                           height: 1.4,
//                           fontSize: 28,
//                           color: Colors.white.withOpacity(0.9),
//                           fontWeight: FontWeight.bold),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Row(
//                       children: [
//                         Text(
//                           "New",
//                           style: TextStyle(
//                               color: Colors.green,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 15),
//                         ),
//                         SizedBox(
//                           width: 15,
//                         ),
//                         SizedBox(
//                           width: 15,
//                         ),
//                         Row(
//                           children: [
//                             Image.asset(
//                               "assets/images/imdb.png",
//                               height: MySize.size30,
//                               // width: MySize.size50,
//                             ),
//                             Container(
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(2),
//                                   color: Colors.white.withOpacity(0.2)),
//                               child: Padding(
//                                 padding: const EdgeInsets.only(
//                                     left: 6, right: 6, top: 4, bottom: 4),
//                                 child: Text(
//                                   widget.data.rating.toString(),
//                                   style: TextStyle(
//                                       color: Colors.white,
//                                       fontWeight: FontWeight.w500,
//                                       fontSize: 12),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           width: 15,
//                         ),
//                         Text(
//                           "Available Seasons: " +
//                               widget.data.seasons.length.toString(),
//                           style: TextStyle(
//                               color: Colors.white.withOpacity(0.5),
//                               fontWeight: FontWeight.w500,
//                               fontSize: 15),
//                         ),
//                         SizedBox(
//                           width: 15,
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Text(
//                       "Watch Season 1 Now",
//                       style: TextStyle(
//                           color: Colors.white.withOpacity(0.9),
//                           fontWeight: FontWeight.bold,
//                           fontSize: 17),
//                     ),
//                     SizedBox(
//                       height: 12,
//                     ),
//                     InkWell(
//                       onTap: () {
//                         videoController!.pause();
//                         Navigator.push(context,
//                             MaterialPageRoute(builder: (_) => WebView()));
//                       },
//                       child: Container(
//                         width: size.width,
//                         height: 38,
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(4),
//                             color: Colors.white),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Icon(
//                               Icons.play_arrow,
//                               color: Colors.black,
//                             ),
//                             SizedBox(
//                               width: 5,
//                             ),
//                             Text(
//                               "Play",
//                               style: TextStyle(
//                                   color: Colors.black,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 16),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 12,
//                     ),

//                     SizedBox(
//                       height: 10,
//                     ),

//                     // Row(
//                     //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     //   children: [
//                     //     Container(
//                     //       width: (size.width - 30) * 0.75,
//                     //       child: Stack(
//                     //         children: [
//                     //           Container(
//                     //             width: (size.width - 30) * 0.75,
//                     //             height: 2.5,
//                     //             decoration: BoxDecoration(
//                     //                 borderRadius: BorderRadius.circular(5),
//                     //                 color: Colors.grey.withOpacity(0.5)),
//                     //           ),
//                     //           Container(
//                     //             width: (size.width - 30) * 0.2,
//                     //             height: 2.5,
//                     //             decoration: BoxDecoration(
//                     //                 borderRadius: BorderRadius.circular(5),
//                     //                 color: Colors.red.withOpacity(0.8)),
//                     //           ),
//                     //         ],
//                     //       ),
//                     //     ),
//                     //     Text(
//                     //       "35m remaining",
//                     //       style: TextStyle(color: Colors.grey, fontSize: 10),
//                     //     )
//                     //   ],
//                     // ),

//                     Text(
//                       widget.data.storyline.toString(),
//                       style: TextStyle(
//                           height: 1.4, color: Colors.white.withOpacity(0.9)),
//                     ),
//                     // SizedBox(
//                     //   height: 8,
//                     // ),
//                     Text(
//                       "", // widget.data.casts[0].detail.toString(),,
//                       style: TextStyle(
//                           fontSize: 13,
//                           height: 1.4,
//                           color: Colors.grey.withOpacity(0.9)),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     // Padding(
//                     //   padding: const EdgeInsets.only(left: 30),
//                     //   child: Row(
//                     //     children: List.generate(likesList.length, (index) {
//                     //       return Padding(
//                     //         padding: const EdgeInsets.only(right: 50),
//                     //         child: Column(
//                     //           children: [
//                     //             Icon(
//                     //               likesList[index]['icon'],
//                     //               size: 25,
//                     //               color: Colors.white.withOpacity(0.9),
//                     //             ),
//                     //             SizedBox(
//                     //               height: 5,
//                     //             ),
//                     //             Text(likesList[index]['text'],
//                     //                 style: TextStyle(
//                     //                     fontSize: 12,
//                     //                     height: 1.4,
//                     //                     color: Colors.grey.withOpacity(0.9)))
//                     //           ],
//                     //         ),
//                     //       );
//                     //     }),
//                     //   ),
//                     // ),

//                     // SizedBox(
//                     //   height: 20,
//                     // ),
//                     SingleChildScrollView(
//                       scrollDirection: Axis.horizontal,
//                       child: Row(
//                         children: List.generate(1, (index) {
//                           return GestureDetector(
//                             onTap: () {
//                               setState(() {
//                                 activeEpisode = index;
//                               });
//                             },
//                             child: Padding(
//                               padding: const EdgeInsets.only(right: 25),
//                               child: Column(
//                                 children: [
//                                   Container(
//                                     decoration: BoxDecoration(
//                                         border: Border(
//                                             top: BorderSide(
//                                                 width: 4,
//                                                 color: activeEpisode == index
//                                                     ? Colors.red
//                                                         .withOpacity(0.8)
//                                                     : Colors.transparent))),
//                                     child: Padding(
//                                       padding: const EdgeInsets.only(top: 12),
//                                       child: Text(
//                                         episodesList[index],
//                                         style: TextStyle(
//                                             fontSize: 16,
//                                             color: activeEpisode == index
//                                                 ? Colors.white.withOpacity(0.9)
//                                                 : Colors.white.withOpacity(0.5),
//                                             fontWeight: FontWeight.bold),
//                                       ),
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           );
//                         }),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 30,
//                     ),
//                     Text(
//                       "Season 1",
//                       style: TextStyle(
//                           fontSize: 17,
//                           color: Colors.white.withOpacity(0.5),
//                           fontWeight: FontWeight.w500),
//                     ),
//                     SizedBox(
//                       height: 15,
//                     ),

//                     ///episode
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: List.generate(
//                           widget.data.seasons[0].epsiodes.length, (index) {
//                         return InkWell(
//                           onTap: () {
//                             videoController!.pause();
//                             Navigator.push(context,
//                                 MaterialPageRoute(builder: (_) => WebView()));
//                           },
//                           child: Padding(
//                             padding: const EdgeInsets.only(bottom: 20),
//                             child: Column(
//                               children: [
//                                 Row(
//                                   children: [
//                                     Container(
//                                       width: (size.width - 30) * 0.85,
//                                       height: 100,
//                                       child: Row(
//                                         children: [
//                                           Container(
//                                             width: 150,
//                                             child: Stack(
//                                               children: [
//                                                 Container(
//                                                     width: 150,
//                                                     height: 90,
//                                                     child: ClipRRect(
//                                                         borderRadius:
//                                                             const BorderRadius
//                                                                     .all(
//                                                                 Radius.circular(
//                                                                     10)),
//                                                         child: Image.network(
//                                                             widget.data.image
//                                                                 .toString(),
//                                                             fit:
//                                                                 BoxFit.cover))),
//                                                 Container(
//                                                   width: 150,
//                                                   height: 90,
//                                                   decoration: BoxDecoration(
//                                                       color: Colors.black
//                                                           .withOpacity(0.3)),
//                                                 ),
//                                                 Positioned(
//                                                   top: 30,
//                                                   left: 57,
//                                                   child: Container(
//                                                     width: 38,
//                                                     height: 38,
//                                                     decoration: BoxDecoration(
//                                                         shape: BoxShape.circle,
//                                                         border: Border.all(
//                                                             width: 2,
//                                                             color:
//                                                                 Colors.white),
//                                                         color: Colors.black
//                                                             .withOpacity(0.4)),
//                                                     child: Center(
//                                                       child: Icon(
//                                                         Icons.play_arrow,
//                                                         color: Colors.white,
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 )
//                                               ],
//                                             ),
//                                           ),
//                                           Container(
//                                             width: (size.width) * 0.35,
//                                             child: Padding(
//                                               padding: const EdgeInsets.only(
//                                                   left: 10),
//                                               child: Column(
//                                                 crossAxisAlignment:
//                                                     CrossAxisAlignment.start,
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment.center,
//                                                 children: [
//                                                   Text(
//                                                     // "abcvj",
//                                                     widget.data.seasons[0]
//                                                         .epsiodes[index].title
//                                                         .toString(),
//                                                     style: TextStyle(
//                                                         fontSize: 15,
//                                                         height: 1.3,
//                                                         fontWeight:
//                                                             FontWeight.w400,
//                                                         color: Colors.white
//                                                             .withOpacity(0.9)),
//                                                   ),
//                                                   SizedBox(
//                                                     height: 3,
//                                                   ),
//                                                   // Text(
//                                                   //   movieList[index]['duration'],
//                                                   //   style: TextStyle(
//                                                   //       fontSize: 12,
//                                                   //       color: Colors.white
//                                                   //           .withOpacity(0.5)),
//                                                   // )
//                                                 ],
//                                               ),
//                                             ),
//                                           )
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 SizedBox(
//                                   height: 5,
//                                 ),
//                                 Text(
//                                   widget.data.seasons[0].epsiodes[index]
//                                       .description
//                                       .toString(),
//                                   style: TextStyle(
//                                       height: 1.4,
//                                       color: Colors.white.withOpacity(0.5)),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         );
//                       }),
//                     ),
//                     // SizedBox(
//                     //   height: 20,
//                     // )
//                   ],
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
