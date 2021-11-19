import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_test/Model/movie.dart';
import 'package:infinite_scroll_test/constants.dart';

import 'Components/diagonal_clipper.dart';

class MovieDetailScreen extends StatelessWidget {
  MovieDetailScreen({required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    var boxHeight = MediaQuery
        .of(context)
        .size
        .height * 0.4;
    List<Widget> stars = [];
    for (var i =0;i<movie.rating.toInt();i+=2) stars.add(Icon(Icons.star, color: orangeColor, size: 30,));
    while(stars.length != 5) stars.add(Icon(Icons.star, color: greyColor, size: 30,));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(icon: Icon(
          Icons.arrow_back_ios_rounded, color: Colors.white.withOpacity(0.9),),
          onPressed: () => Get.back(),
        ),
        actions: [
          Icon(Icons.save_alt_rounded, color: Colors.white.withOpacity(0.9),),
          SizedBox(width: 15,)
        ],
        elevation: 0.0,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          ClipPath(
            clipper: DiagonalClipper(),
            child: Container(
              height: boxHeight,
              child: Image.network(movie.backgroundImage, fit: BoxFit.cover,),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: MediaQuery
                .of(context)
                .padding
                .top + 56, left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 135,
                  height: boxHeight - (MediaQuery
                      .of(context)
                      .padding
                      .top + 56),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10, color: Colors.black, spreadRadius: 2)
                    ],
                  ),
                  child: Image.network(
                    movie.largeCoverImage, fit: BoxFit.fill,),
                ),
                SizedBox(height: 15,),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        movie.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    SizedBox(width: 15,),
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
                    SizedBox(width: 15,)
                  ],
                ),
                SizedBox(height: 5,),
                Text(
                  movie.genres.join(", "),
                  style: TextStyle(
                      color: greyColor
                  ),
                ),
                SizedBox(height: 5,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ...stars,
                    SizedBox(width: 15),
                    Text(
                      movie.rating.toString(),
                      style: TextStyle(
                          fontSize: 25,
                        fontWeight: FontWeight.bold,
                          color: orangeColor,
                      ),
                    ),
                    Text(
                      " /10",
                      style: TextStyle(
                        color: greyColor,
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.download_for_offline_outlined, color: greyColor,),
                    SizedBox(width: 15,),
                    Icon(Icons.star_border_outlined, color: greyColor),
                    SizedBox(width: 15,),
                  ],
                ),
                SizedBox(height: 5,),
                Text(
                  movie.summary,
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.6),
                    height: 1.5
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: boxHeight - 70,
            right: 80,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(blurRadius: 10, color: Colors.grey, spreadRadius: 5)
                ],
              ),
              child: CircleAvatar(
                radius: 35,
                backgroundColor: mintColor,
                child: Icon(
                  Icons.play_arrow_outlined, size: 50, color: Colors.white,),
              ),
            ),
          )
        ],
      ),
    );
  }
}