import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:netflix_flutter/Controller/popularSeries.dart';
import 'package:netflix_flutter/json/home_json.dart';
import 'package:netflix_flutter/pages/video_detail_page.dart';

import '../Controller/searchController.dart';
import '../json/search_json.dart';
import '../size_config.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final PopularController popularController = Get.put(PopularController());
  final SearchController searchController = Get.put(SearchController());

  TextEditingController searchText = TextEditingController();
  bool searchValue = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
            backgroundColor: Colors.black,
            elevation: 0,
            title: Container(
              width: size.width,
              height: 35,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey.withOpacity(0.25)),
              child: TextField(
                controller: searchText,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search",
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey.withOpacity(0.7),
                    )),
                onChanged: ((value) {
                  if (value.isEmpty) {
                    searchValue = false;
                    setState(() {});
                  }
                }),
                onSubmitted: ((value) {
                  if (value.isNotEmpty) {
                    searchController.searchString = value.toString();
                    searchController.searchSeriesData(value.toString());
                    searchValue = true;
                  }
                }),
              ),
            ),
          )),
      body: searchValue == false
          ? SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 10, left: 18, right: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Top Searches",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Obx(() {
                      if (popularController.isLoading.isTrue) {
                        return Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.4),
                          child: Center(
                              child: CircularProgressIndicator(
                                  color: Color.fromARGB(255, 175, 44, 35))),
                        );
                      }
                      return Column(
                          children: List.generate(searchJson.length, (index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => VideoDetailPage(
                                        videoUrl: searchJson[index]['video'],
                                        data: popularController
                                            .popularSeriesList[index])));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Row(
                              children: [
                                Container(
                                  width: (size.width - 36) * 0.8,
                                  child: Row(
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            height: 90,
                                            width: 90,
                                            child: ClipRRect(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(10)),
                                                child: Image.network(
                                                    popularController
                                                        .popularSeriesList[
                                                            index]
                                                        .image
                                                        .toString(),
                                                    fit: BoxFit.cover)),
                                          ),
                                          Container(
                                              height: 90,
                                              width: 120,
                                              decoration: BoxDecoration(
                                                  color: Colors.black
                                                      .withOpacity(0.2)))
                                        ],
                                      ),
                                      SizedBox(
                                        width: 02,
                                      ),
                                      SizedBox(
                                        width: (size.width - 30) * 0.4,
                                        child: Text(
                                          popularController
                                              .popularSeriesList[index].title
                                              .toString(),
                                          style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: (size.width - 36) * 0.2,
                                  child: Container(
                                    width: 35,
                                    height: 35,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            width: 2, color: Colors.white),
                                        color: Colors.black.withOpacity(0.4)),
                                    child: const Center(
                                      child: Icon(
                                        Icons.play_arrow,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }));
                    })
                  ],
                ),
              ),
            )
          : Column(
              children: [
                Obx(() {
                  if (searchController.isLoading.isTrue) {
                    return Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.4),
                      child: Center(
                          child: CircularProgressIndicator(
                              color: Color.fromARGB(255, 175, 44, 35))),
                    );
                  } else {
                    return Expanded(
                      child: GridView.builder(
                          controller: searchController.searcScroll,
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 160,
                                  childAspectRatio: 3 / 4,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10),
                          itemCount: searchController.searchList.length,
                          itemBuilder: (BuildContext ctx, index) {
                            if (index ==
                                    searchController.searchList.length - 1 &&
                                searchController.isMoreDataAvailable.value ==
                                    true) {
                              return searchController.searchList.length > 5
                                  ? Padding(
                                      padding: EdgeInsets.only(
                                        left: MySize.size40,
                                      ),
                                      child: Center(
                                          child: CircularProgressIndicator(
                                              color: Colors.red)),
                                    )
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
                                            data: searchController
                                                .searchList[index])));
                              },
                              child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      //color: Colors.amber,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(searchController
                                          .searchList[index].image
                                          .toString()))),
                            );
                          }),
                    );
                  }
                })
              ],
            ),
    );
  }
}
