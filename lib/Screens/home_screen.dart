import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_test/Screens/MoviePage/movie_page.dart';
import 'package:infinite_scroll_test/constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
            "Movies",
          style: TextStyle(
            color: mintColor
          ),
        ),
        leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu_rounded, color: Colors.grey,)
        ),
      ),
      body: MoviePage(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectIndex,
        onTap: (index){
          setState(() {
            _selectIndex = index;
          });
        },
        selectedItemColor: mintColor,
        unselectedItemColor: mintColor,
        showSelectedLabels: false,
        items: [
          BottomNavigationBarItem(
            label: "movie",
              icon: Icon(_selectIndex == 0 ? Icons.movie_creation_rounded : Icons.movie_creation_outlined)
          ),
          BottomNavigationBarItem(
              label: "download",
              icon: Icon(_selectIndex == 1 ? Icons.download_for_offline : Icons.download_for_offline_outlined)
          ),
          BottomNavigationBarItem(
              label: "home",
              icon: Icon(_selectIndex == 2 ? Icons.home : Icons.home_outlined)
          ),
          BottomNavigationBarItem(
              label: "my page",
              icon: Icon(_selectIndex == 3 ? Icons.person_sharp : Icons.person_outline_rounded)
          ),
        ],
      ),
    );
  }
}