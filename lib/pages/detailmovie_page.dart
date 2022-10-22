import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_flutter/controller/detailmovie_controller.dart';
import 'package:movie_flutter/utils/contants.dart';

class DetailMoviePage extends StatelessWidget {
  DetailMoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    var data = Get.arguments;
    var controller = Get.put(DetailMovieController.id(data[0]["id"]));
    
    // final item = controller.detailMovieItem.value;
    
    return Scaffold(
      body: Obx(() => controller.isLoading.value
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(BASE_URL_BACKPOSTER +
                              controller.detailMovieItem.value.backdropPath
                                  .toString()),
                          fit: BoxFit.cover)),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: Container(
                      decoration:
                          BoxDecoration(color: Colors.white.withOpacity(0.0)),
                    ),
                  ),
                ),
                Expanded(
                    child: Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(16, 125, 16, 16),
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          color: Colors.white70,
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 120),
                                child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller.detailMovieItem.value.title
                                            .toString(),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(5),
                                        child: Row(
                                          children: [
                                            const Icon(
                                              Icons.star,
                                              color: Colors.red,
                                            ),
                                            Text(controller.detailMovieItem
                                                .value.voteAverage
                                                .toString())
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                  child: SingleChildScrollView(
                                padding: const EdgeInsets.only(top: 30),
                                physics: const BouncingScrollPhysics(),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 30,
                                      child: ListView.separated(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: controller.detailMovieItem
                                            .value.genres.length,
                                        separatorBuilder: (context, index) =>
                                            const SizedBox(
                                          height: 10,
                                        ),
                                        itemBuilder: (context, index) {
                                          final item = controller
                                              .detailMovieItem
                                              .value
                                              .genres[index];
                                          return _titleGenre(
                                              name: item.name.toString());
                                        },
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        const Padding(
                                          padding:
                                              EdgeInsets.only(left: 8, top: 20),
                                          child: Text(
                                            "Overview",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(8),
                                          child: Text(controller
                                              .detailMovieItem.value.overview
                                              .toString()),
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0, bottom: 4.0),
                                                  
                                              child: Text(
                                                  "Release Date : ${controller.detailMovieItem.value.releaseDate}"),
                                              
                                             
                                            ),
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ))
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        top: 55,
                        left: 40,
                        child: Hero(
                            tag: "",
                            child: Container(
                              width: 100,
                              height: 150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 2.0,
                                        offset: Offset(0, 2.0),
                                        spreadRadius: 0.5)
                                  ],
                                  image: DecorationImage(
                                      image: NetworkImage(BASE_URL_POSTER +
                                          controller
                                              .detailMovieItem.value.posterPath
                                              .toString()),
                                      fit: BoxFit.cover)),
                            )))
                  ],
                ))
              ],
            )),
    );
  }
}

Widget _titleGenre({required String name}) {
  return Container(
    margin: const EdgeInsets.only(left: 10),
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
        color: Colors.transparent),
    child: Text(name),
  );
}
