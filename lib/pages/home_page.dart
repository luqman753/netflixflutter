import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:netflix_flutter/Controller/genre.dart';

import 'package:netflix_flutter/pages/search_page.dart';
import 'package:netflix_flutter/pages/video_detail_page.dart';

import '../Controller/genreSeries.dart';
import '../Controller/popularSeries.dart';
import '../Controller/series.dart';
import '../Controller/showRandom.dart';
import '../size_config.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GenreController genreData = Get.put(GenreController());
  final PopularController popularController = Get.put(PopularController());
  final ShowRandomController showRandom = Get.put(ShowRandomController());
  final SeriesController seriesData = Get.put(SeriesController());
  final GenreSeriesController genreSeries = Get.put(GenreSeriesController());
  var idVal;
  List<BoxShadow> shadowList = [
    BoxShadow(color: Colors.grey[300]!, blurRadius: 30, offset: Offset(0, 10))
  ];

  var indexValue;
  bool genreValue = false;
  bool categoryValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    MySize().init(context);
    ThemeData themeData = Theme.of(context);

    return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                width: size.height - 80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Obx(() {
                          if (showRandom.isLoading.isTrue) {
                            return Padding(
                              padding: EdgeInsets.only(
                                  top:
                                      MediaQuery.of(context).size.height * 0.3),
                              child: const Center(
                                child: CircularProgressIndicator(
                                    color: Colors.red),
                              ),
                            );
                          } else {
                            return Container(
                              height: MySize.size1 * 450,
                              width: MediaQuery.of(context).size.width * 1,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [
                                    Colors.black.withOpacity(0.85),
                                    Colors.black.withOpacity(0.0),
                                  ],
                                      end: Alignment.topCenter,
                                      begin: Alignment.bottomCenter)),
                              child: Image.network(
                                  showRandom.showRandomList[0].image.toString(),
                                  fit: BoxFit.cover),
                            );
                          }
                        }),
                        Container(
                          height: MySize.size1 * 450,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                Colors.black.withOpacity(0.85),
                                Colors.black.withOpacity(0.0),
                              ],
                                  end: Alignment.topCenter,
                                  begin: Alignment.bottomCenter)),
                        ),
                        Obx(() {
                          if (showRandom.isLoading.isTrue) {
                            return
                                // CircularProgressIndicator();
                                SizedBox(
                              height: MySize.size1 * 100,
                              child: SizedBox(),
                            );
                          }
                          return Container(
                            height: MySize.size1 * 450,
                            width: size.width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                    showRandom.showRandomList[0].title
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w900)),
                                SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  showRandom
                                      .showRandomList.value[0].genres![0].name
                                      .toString(),
                                  style: TextStyle(
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),
                          );
                        })
                      ],
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [],
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => VideoDetailPage(
                                          videoUrl: "assets/videos/video_1.mp4",
                                          data: showRandom
                                              .showRandomList.value[0],
                                        )));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  right: 13, left: 8, top: 2, bottom: 2),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.play_arrow,
                                    color: Colors.black,
                                    size: 30,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Play",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              backgroundColor:
                                  const Color.fromARGB(221, 51, 51, 51),
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20))),
                              isScrollControlled: true,
                              context: context,
                              builder: (context) {
                                return SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.93 /
                                      3.4,
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Obx(() {
                                                if (showRandom
                                                    .isLoading.isTrue) {
                                                  return Padding(
                                                    padding: EdgeInsets.only(
                                                        left: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.3),
                                                    child: const Center(
                                                      child:
                                                          CircularProgressIndicator(
                                                              color:
                                                                  Colors.red),
                                                    ),
                                                  );
                                                  // listViewWithLeadingPictureWithExpandedSkeleton(
                                                  // context);
                                                } else {
                                                  return Image.network(
                                                    showRandom.showRandomList
                                                        .value[0].image
                                                        .toString(),
                                                    height: MySize.size140,
                                                    // width: MySize.size160,
                                                  );
                                                }
                                              }),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                left: MySize.size10,
                                              ),
                                              child: Column(
                                                // mainAxisAlignment: MainAxisAlignment.end,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    showRandom.showRandomList
                                                        .value[0].title
                                                        .toString(),
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                  SizedBox(
                                                    height: MySize.size100,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            1,
                                                    child: Padding(
                                                      padding: EdgeInsets.only(
                                                          top: MySize.size10),
                                                      child: ListView.builder(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          itemCount: 1,
                                                          itemBuilder:
                                                              (BuildContext
                                                                      context,
                                                                  int index) {
                                                            return Padding(
                                                                padding: EdgeInsets.only(
                                                                    bottom: MediaQuery.of(context)
                                                                            .size
                                                                            .height *
                                                                        0.1 /
                                                                        3.4
                                                                    // MySize.size12
                                                                    ),
                                                                child: Column(
                                                                    children: [
                                                                      Text(
                                                                        showRandom
                                                                            .showRandomList
                                                                            .value[0]
                                                                            .storyline
                                                                            .toString(),
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.white),
                                                                      ),
                                                                    ]));
                                                          }),
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        "Ratings:${showRandom.showRandomList.value[0].rating}`",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      Image.asset(
                                                        "assets/images/imdb.png",
                                                        height: MySize.size30,
                                                        // width: MySize.size50,
                                                      ),
                                                      SizedBox(
                                                        width: MySize.size4,
                                                      ),
                                                      const Text(
                                                          " Available Seasons: 5",
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .white)),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Divider(
                                        color: Colors.white,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) =>
                                                      VideoDetailPage(
                                                        videoUrl:
                                                            "assets/videos/video_1.mp4",
                                                        data: showRandom
                                                            .showRandomList
                                                            .value[0],
                                                      )));
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            const Icon(
                                                Icons.info_outline_rounded),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            const Text("Episodes & info"),
                                            Expanded(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: const [
                                                  Icon(Icons
                                                      .navigate_next_outlined),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          child: Column(
                            children: const [
                              Icon(
                                Icons.info_outline,
                                size: 25,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Info",
                                style: TextStyle(fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Text(
                            "Popular on Discovery +",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: MySize.size1 * 10,
                        ),
                        Obx(() {
                          if (popularController.isLoading.isTrue) {
                            return SizedBox(
                              height: MySize.size1 * 140,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width *
                                        0.000001),
                                child: const Center(
                                  child: CircularProgressIndicator(
                                      color: Colors.red),
                                ),
                              ),
                            );
                          } else {
                            return Container(
                              height: MySize.size1 * 180,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)),
                              child: ListView.builder(
                                  controller: popularController.controller,
                                  scrollDirection: Axis.horizontal,
                                  padding: const EdgeInsets.only(left: 10),
                                  itemCount: popularController
                                      .popularSeriesList.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) => VideoDetailPage(
                                                    videoUrl:
                                                        "assets/videos/video_2.mp4",
                                                    data: popularController
                                                            .popularSeriesList[
                                                        index])));
                                      },
                                      child: Container(
                                          margin:
                                              const EdgeInsets.only(right: 8),
                                          width: 110,
                                          height: 160,
                                          child: ClipRRect(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(15)),
                                              child: Image.network(
                                                  popularController
                                                      .popularSeriesList[index]
                                                      .image
                                                      .toString()))),
                                    );
                                  }),
                            );
                          }
                        }),
                        const SizedBox(
                          height: 30,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 15, right: 15),
                          child: Text(
                            "Trending Now",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        genreValue == false
                            ? Obx(() {
                                if (seriesData.isLoading.isTrue) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                        left:
                                            MediaQuery.of(context).size.width *
                                                0.000001),
                                    child: const Center(
                                      child: CircularProgressIndicator(
                                          color: Colors.red),
                                    ),
                                  );
                                  // listViewWithLeadingPictureWithExpandedSkeleton(
                                  //     context);
                                } else {
                                  return SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Row(
                                        children: List.generate(
                                            seriesData.seriesList[0].data!
                                                .length, (index) {
                                          return InkWell(
                                            onTap: () {
                                              indexValue = index;
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (_) => VideoDetailPage(
                                                          videoUrl:
                                                              "assets/videos/video_1.mp4",
                                                          data: seriesData
                                                              .seriesList[0]
                                                              .data![index])));
                                            },
                                            child: Container(
                                                margin:
                                                    EdgeInsets.only(right: 8),
                                                width: 110,
                                                height: 160,
                                                child: ClipRRect(
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                10)),
                                                    child: Image.network(
                                                        seriesData.seriesList[0]
                                                            .data![index].image
                                                            .toString()))),
                                          );
                                        }),
                                      ),
                                    ),
                                  );
                                }
                              })
                            :
                            //////// CategoriesSeries Data....
                            Obx(() {
                                if (genreSeries.isLoading.isTrue) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                        left:
                                            MediaQuery.of(context).size.width *
                                                0.000001),
                                    child: const Center(
                                      child: CircularProgressIndicator(
                                          color: Colors.red),
                                    ),
                                  );
                                } else {
                                  return Container(
                                    height: MySize.size1 * 180,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: ListView.builder(
                                        controller:
                                            genreSeries.genreSeriesScroll,
                                        scrollDirection: Axis.horizontal,
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        itemCount:
                                            genreSeries.genreSeriesList.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          if (index ==
                                                  genreSeries.genreSeriesList
                                                          .length -
                                                      1 &&
                                              genreSeries.isMoreDataAvailable
                                                      .value ==
                                                  true) {
                                            return genreSeries.genreSeriesList
                                                        .length >
                                                    5
                                                ? const Center(
                                                    child:
                                                        CircularProgressIndicator(
                                                            color: Colors.red))
                                                : const SizedBox();
                                          }
                                          return InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (_) => VideoDetailPage(
                                                          videoUrl:
                                                              "assets/videos/video_2.mp4",
                                                          data: genreSeries
                                                                  .genreSeriesList[
                                                              index])));
                                            },
                                            child: Container(
                                                margin: const EdgeInsets.only(
                                                    right: 8),
                                                width: 110,
                                                height: 160,
                                                child: ClipRRect(
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                15)),
                                                    child: Image.network(
                                                        genreSeries
                                                            .genreSeriesList[
                                                                index]
                                                            .image
                                                            .toString()))),
                                          );
                                        }),
                                  );
                                }
                              }),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SafeArea(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/images/4.png",
                                width: MySize.size50,
                                fit: BoxFit.cover,
                              )
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                                icon: const Icon(
                                  Icons.search,
                                  size: 28,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => SearchPage()));
                                }),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            if (categoryValue == false) {
                              categoryValue = true;

                              setState(() {});
                            }
                          },
                          child: Row(
                            children: [
                              SizedBox(
                                width: MySize.size10,
                              ),
                              const Text(
                                "Categories",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                width: 3,
                              ),
                              const Icon(Icons.keyboard_arrow_down)
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),

              //
              categoryValue == true
                  ? Container(
                      height: MediaQuery.of(context).size.height * 1,
                      color: Colors.transparent.withOpacity(0.85),
                    )
                  : const SizedBox(),

              categoryValue == true
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height * 0.78,
                      child: Padding(
                          padding: EdgeInsets.only(top: MySize.size40),
                          child: Obx(() {
                            if (genreData.isLoading.isTrue) {
                              return SizedBox();
                              // listViewWithLeadingPictureWithExpandedSkeleton(
                              //     context);
                            } else {
                              return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  itemCount:
                                      genreData.genreList.value[0].data!.length,
                                  // genreData.genreList.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Padding(
                                      padding: EdgeInsets.only(
                                          bottom: MySize.size16),
                                      child: Column(
                                        children: [
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: MySize.size4,
                                                  right: MySize.size4,
                                                  top: MySize.size2,
                                                  bottom: MySize.size12),
                                              child: Obx(() {
                                                if (genreData.isLoading.value) {
                                                  return Padding(
                                                    padding: EdgeInsets.only(
                                                        top: MySize.size40),
                                                    child:
                                                        CircularProgressIndicator(
                                                            color: Colors.red),
                                                  );
                                                  // listViewWithLeadingPictureWithExpandedSkeleton(
                                                  //     context);
                                                } else {
                                                  return InkWell(
                                                    onTap: () {
                                                      genreSeries.PaginateTask(
                                                          genreData
                                                              .genreList
                                                              .value[0]
                                                              .data![index]
                                                              .id);
                                                      idVal = genreData
                                                          .genreList
                                                          .value[0]
                                                          .data![index]
                                                          .id;

                                                      categoryValue = false;
                                                      genreValue = true;
                                                      setState(() {});
                                                    },
                                                    child: Text(
                                                        genreData.genreList[0]
                                                            .data![index].name
                                                            .toString(),
                                                        style: const TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.w300,
                                                            fontSize: 20)),
                                                  );
                                                }
                                              })),
                                        ],
                                      ),
                                    );
                                  });
                            }
                          })),
                    )
                  : const SizedBox(),

              categoryValue == true
                  ? Positioned(
                      top: MySize.size140 * 4.6,
                      width: MediaQuery.of(context).size.width * 1,
                      child: InkWell(
                        onTap: () {
                          categoryValue = false;
                          setState(() {});
                        },
                        child: SizedBox(
                            height: MySize.size100,
                            width: MySize.size100,
                            child: Image.asset("assets/images/min.png")),
                      ))
                  : const SizedBox()
            ],
          ),
        ));
  }
}
