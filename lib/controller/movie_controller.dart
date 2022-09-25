import 'package:get/get.dart';
import 'package:movie_flutter/model/movie_model.dart';
import 'package:movie_flutter/service/movie_service.dart';

class MovieController extends GetxController {
  var isLoading = true.obs;
  final service = MovieService();

  var nowPlayingList = Movie().obs;
  var topRatedList = Movie().obs;
  var popularList = Movie().obs;

  @override
  void onInit() {
    getNowPlaying();
    getTopRated();
    getPopular();
    super.onInit();
  }

  void getNowPlaying() async {
    isLoading.value = true;
    var data = await service.getNowPlaying();
    if (data != null) {
      nowPlayingList.value = data;
      isLoading.value = false;
      print("Berhasil");
    } else {
      print("Error");
    }
  }

  void getTopRated() async {
    isLoading.value = true;
    var data = await service.getTopRated();
    if (data != null) {
      topRatedList.value = data;
      isLoading.value = false;
      print(data);
    } else {
      print("Error");
    }
  }

  void getPopular() async {
    isLoading.value = true;
    var data = await service.getPopular();
    if (data != null) {
      popularList.value = data;
      isLoading.value = false;
      print(data);
    } else {
      print("error");
    }
  }
}
