import 'package:get/get.dart';
import 'package:movie_flutter/model/moviedetail_model.dart';
import 'package:movie_flutter/service/movie_service.dart';

class DetailMovieController extends GetxController {
  String? id;
  DetailMovieController.id(this.id);
  final service = MovieService();
  var isLoading = true.obs;
  var detailMovieItem = DetailMovie().obs;

  @override
  void onInit() {
    getDetailMovie(this.id);
    super.onInit();
  }

  void getDetailMovie($id) async {
    isLoading.value = true;
    var data = await service.getDetailMovie(id: $id);
    if (data != null) {
      detailMovieItem.value = data;
      isLoading.value = false;
      print("Berhasil : ${data.title}");
    } else {
      print("Error");
    }
  }
}
