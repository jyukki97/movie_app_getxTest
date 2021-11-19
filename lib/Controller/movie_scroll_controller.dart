import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_test/Model/movie.dart';
import 'package:infinite_scroll_test/Services/movie_service.dart';

class MovieScrollController extends GetxController {
  var scrollController = ScrollController().obs;
  var data = <Movie>[].obs;
  var isLoading = false.obs;
  var hasMore = true.obs;

  static const limit = 20;
  var page = 1;

  @override
  void onInit() {
    _getData();
    this.scrollController.value.addListener(() {
      if (this.scrollController.value.position.pixels == this.scrollController.value.position.maxScrollExtent && this.hasMore.value) {
        _getData();
      }
    });
    super.onInit();
  }
  _getData() async {
    isLoading.value = true;
    var movieList = await MovieService.fetchMovie(limit, page);
    if(movieList == null) hasMore.value = false;
    else {
      data.addAll(movieList.movies);
      page++;
    }
      isLoading.value = false;
  }
  reload() async {
    isLoading.value = true;
    data.clear();
    page = 1;
    _getData();
  }
}