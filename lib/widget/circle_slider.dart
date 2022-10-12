import 'package:flutter/material.dart';
import 'package:rojje/model/model_movie.dart';
import 'package:rojje/screen/detail_screen.dart';

class CircleSlider extends StatelessWidget {
  final List<Movie>? movies;
  CircleSlider({this.movies});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(7),
      child: Column(children: [
        Text('미리보기'),
        Container(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: makeCircleImage(context, movies!),
            ))
      ], crossAxisAlignment: CrossAxisAlignment.start),
    );
  }
}

List<Widget> makeCircleImage(BuildContext context, List<Movie> movies) {
  List<Widget> results = [];
  for (var i = 0; i < movies.length; i++) {
    results.add(InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute<Null>(
            builder: (BuildContext context) {
              return DetailScreen(movie: movies![i]);
            },
          ));
        },
        child: Container(
          padding: EdgeInsets.only(right: 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: CircleAvatar(
                backgroundImage: NetworkImage(movies[i].poster),
                radius: 40),
          ),
        )));
  }
  return results;
}
