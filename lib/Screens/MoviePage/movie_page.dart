import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_test/Controller/movie_scroll_controller.dart';
import 'package:infinite_scroll_test/Model/movie.dart';
import 'package:infinite_scroll_test/Screens/MoviePage/MovieDetail/movie_detail_screen.dart';
import 'package:infinite_scroll_test/constants.dart';

class MoviePage extends GetView<MovieScrollController> {
  @override
  Widget build(context) {
    return Obx(
          () =>
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Stack(
              children: [
                RefreshIndicator(
                  color: mintColor,
                  onRefresh: () async => controller.reload(),
                  child: ListView.separated(
                    controller: controller.scrollController.value,
                    itemBuilder: (_, index) {
                      if (index < controller.data.length) {
                        var movie = controller.data[index];
                        return MovieCard(movie: movie);
                      }
                      if (controller.hasMore.value ||
                          controller.isLoading.value) {
                        return Center(
                            child: RefreshProgressIndicator(color: mintColor,));
                      }
                      return Container(
                        padding: const EdgeInsets.all(10.0),
                        child: Center(
                          child: Column(
                            children: [
                              Text('데이터의 마지막 입니다'),
                              IconButton(
                                onPressed: () {
                                  controller.reload();
                                },
                                icon: Icon(Icons.refresh_outlined),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (_, index) => SizedBox(height: 15,),
                    itemCount: controller.data.length + 1,
                  ),
                ),
                Positioned(
                    right: 10,
                    bottom: 10,
                    child: InkWell(
                      onTap: () {
                        controller.scrollController.value.jumpTo(0.0);
                      },
                      child: Icon(
                        Icons.arrow_circle_up, color: mintColor, size: 30,),
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                    )
                )
              ],
            ),
          ),
    );
  }
}

class MovieCard extends StatelessWidget {
  MovieCard ({required this.movie});
  
  final Movie movie;
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => MovieDetailScreen(movie: movie)),
      child: Container(
        height: 200,
        child: Stack(
          children: [
            Positioned(
                bottom: 0,
                child: Container(
                  height: 180,
                  width: context.width,
                  color: Colors.white,
                )
            ),
            Positioned(
                left: 10,
                child: Container(
                  height: 190,
                  width: 150,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(blurRadius: 5, color: Colors.grey, spreadRadius: 2, offset: Offset(-5, 5))
                      ],
                    ),
                  child: Image.network(
                    movie.largeCoverImage,
                    fit: BoxFit.fill,
                    errorBuilder: (context, url, error) =>
                        Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black)
                            ),
                            child: Text(
                              "이미지가\n 존재하지 않습니다.",
                              textAlign: TextAlign.center,
                            )
                        ),
                  ),
                )
            ),
            Positioned(
              bottom: 0,
              left: 170,
              child: Container(
                height: 180,
                width: context.width - 190,
                padding: EdgeInsets.all(10),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 5,),
                    Text(
                      movie.genres.join(", "),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 15,
                          color: greyColor
                      ),
                    ),
                    SizedBox(height: 5,),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                          color: orangeColor,
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      child: Text(
                        "${movie.runtime} min",
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.white
                        ),
                      ),
                    ),
                    SizedBox(height: 5,),
                    Text(
                      movie.summary,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: greyColor
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 140,
              bottom: 15,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(blurRadius: 10, color: Colors.grey, spreadRadius: 1)
                  ],
                ),
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: mintColor,
                  child: Text(
                    movie.rating.toString(),
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
                right: 10,
                bottom: 10,
                child: Row(
                  children: [
                    Icon(Icons.download_for_offline_outlined, color: greyColor,),
                    SizedBox(width: 5,),
                    Icon(Icons.star_border_outlined, color: greyColor)
                  ],
                )
            )
          ],
        ),
      ),
    );
  }
}