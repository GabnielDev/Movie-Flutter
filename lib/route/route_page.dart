import 'package:get/get.dart';
import 'package:movie_flutter/pages/detailmovie_page.dart';
import 'package:movie_flutter/pages/listmovie_page.dart';
import 'package:movie_flutter/route/route_name.dart';

class RoutePage {
  static final pages = [
    GetPage(
      name: RouteName.listmoviePage,
      page: () => ListMoviePage(),
    ),
    GetPage(
      name: RouteName.detailmoviePage,
      page: () => DetailMoviePage(),
    )
  ];
}
