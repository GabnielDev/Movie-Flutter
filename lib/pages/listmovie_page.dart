import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_flutter/controller/movie_controller.dart';
import 'package:movie_flutter/route/route_name.dart';
import 'package:movie_flutter/utils/contants.dart';

class ListMoviePage extends StatelessWidget {
  ListMoviePage({super.key});
  final MovieController controller = Get.put(MovieController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Obx(
          () => controller.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _titlePoster(title: "Now Playing"),
                    SizedBox(
                        height: 170,
                        // padding: EdgeInsets.symmetric(vertical: 10),
                        // margin: EdgeInsets.symmetric(vertical: 10),
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (context, index) => const SizedBox(
                              // height: 30,
                              ),
                          itemCount:
                              controller.nowPlayingList.value.results!.length,
                          itemBuilder: (context, index) {
                            final item =
                                controller.nowPlayingList.value.results?[index];
                            return InkWell(
                              onTap: () {
                                Get.toNamed(RouteName.detailmoviePage,
                                    arguments: [
                                      {
                                        "id": item.id.toString(),
                                      }
                                    ]);
                              },
                              child: _cardPoster(
                                image: item!.posterPath.toString(),
                              ),
                            );
                          },
                        )),
                    _titlePoster(title: "Top Rated"),
                    Container(
                        height: 170,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 30,
                          ),
                          itemCount:
                              controller.topRatedList.value.results!.length,
                          itemBuilder: (context, index) {
                            final item =
                                controller.topRatedList.value.results?[index];
                            return InkWell(
                              onTap: () {
                                Get.toNamed(RouteName.detailmoviePage,
                                    arguments: [
                                      {
                                        "id": item.id.toString(),
                                      }
                                    ]);
                              },
                              child: _cardPoster(
                                image: item!.posterPath.toString(),
                              ),
                            );
                          },
                        )),
                    _titlePoster(title: "Popular"),
                    Container(
                      height: 170,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 10,
                        ),
                        itemCount: controller.popularList.value.results!.length,
                        itemBuilder: (context, index) {
                          final item =
                              controller.popularList.value.results![index];
                          return InkWell(
                            onTap: () {
                              Get.toNamed(RouteName.detailmoviePage,
                                  arguments: [
                                    {
                                      "id": item.id.toString(),
                                    }
                                  ]);
                            },
                            child:
                                _cardPoster(image: item.posterPath.toString()),
                          );
                        },
                      ),
                    )
                  ],
                ),
        ));
  }
}

Widget _titlePoster({required String title}) {
  return Padding(
    padding: const EdgeInsets.only(left: 10, bottom: 5, top: 10),
    child: Text(
      title,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      textAlign: TextAlign.start,
    ),
  );
}

Widget _cardPoster({required String image}) {
  return Container(
    width: 115,
    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(BASE_URL_POSTER + image), fit: BoxFit.fill),
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
              color: Colors.grey,
              blurRadius: 2.0,
              offset: Offset(0, 2.0),
              spreadRadius: 0.5)
        ]),
  );
}
