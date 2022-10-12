import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:rojje/model/model_movie.dart';

import '../screen/detail_screen.dart';

class CarouselImage extends StatefulWidget {
  final List<Movie>? movies;
  CarouselImage({this.movies});
  _CarouselImage createState() => _CarouselImage();
}

class _CarouselImage extends State<CarouselImage> {
  List<Movie>? movies;
  List<Widget>? images;
  List<String>? keywords;
  List<bool>? likes;
  int _currentPage = 0;
  String? _currentKeyword;

  @override
  void initState() {
    super.initState();
    movies = widget.movies;
    images = movies?.map((m) => Image.network(m.poster)).toList();
    keywords = movies?.map((m) => m.keyword).toList();
    likes = movies?.map((m) => m.like).toList();
    _currentKeyword = keywords?[0];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: <Widget>[
        Container(
          padding: EdgeInsets.all(20),
        ),
        CarouselSlider(
          options: CarouselOptions(
            onPageChanged: (index, reason) {
              setState(() {
                _currentPage = index;
                _currentKeyword = keywords?[_currentPage];
              });
            },
          ),
          items: images,
        ),
        Container(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 3),
          child: Text(
            _currentKeyword!,
            style: TextStyle(fontSize: 11),
          ),
        ),
        Container(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Container(
              child: Column(children: [
                likes![_currentPage]
                    ? IconButton(
                        icon: Icon(Icons.check),
                        onPressed: () {
                          setState(() {
                            likes![_currentPage] = !likes![_currentPage];
                            movies![_currentPage]
                                .reference!
                                .update({'like': likes![_currentPage]});
                          });
                        },
                      )
                    : IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            likes![_currentPage] = !likes![_currentPage];
                            movies![_currentPage]
                                .reference!
                                .update({'like': likes![_currentPage]});
                          });},
                      ),
                Text(
                  '내가 찜한 콘텐츠',
                  style: TextStyle(fontSize: 11),
                )
              ]),
            ),
            Container(
              padding: EdgeInsets.only(right: 10),
              child: TextButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white)),
                  onPressed: () {
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.play_arrow,
                        color: Colors.black,
                      ),
                      Padding(
                        padding: EdgeInsets.all(3),
                      ),
                      Text('재생', style: TextStyle(color: Colors.black))
                    ],
                  )),
            ),
            Container(
              padding: EdgeInsets.only(right: 10),
              child: Column(children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute<Null>(
                        fullscreenDialog: true,
                        builder: (BuildContext context) {
                          return DetailScreen(movie: movies![_currentPage]);
                        },
                      ));
                    },
                    icon: Icon(Icons.info)),
                Text(
                  '정보',
                  style: TextStyle(fontSize: 11),
                )
              ]),
            )
          ]),
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: makeIndicator(likes!, _currentPage),
          ),
        )
      ]),
    );
  }
}

List<Widget> makeIndicator(List list, int _currentPage) {
  List<Widget> results = [];
  for (var i = 0; i < list.length; i++) {
    results.add(Container(
      width: 8,
      height: 8,
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _currentPage == i
              ? Color.fromRGBO(255, 255, 255, 0.9)
              : Color.fromRGBO(255, 255, 255, 0.4)),
    ));
  }

  return results;
}
