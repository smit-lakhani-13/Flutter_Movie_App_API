// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:movie_app/main.dart';
import 'package:movie_app/utils/text.dart';
import 'package:movie_app/widgets/featured.dart';
import 'package:movie_app/widgets/latest.dart';
import 'package:movie_app/widgets/tv.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main() {
  runApp(MyApp());
}

class HomePage extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  List latestmovies = [];
  List featuredmovies = [];
  List tv = [];
  final String apikey = '9883df1fd1160de45eca0ce384a9d437';
  final readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5ODgzZGYxZmQxMTYwZGU0NWVjYTBjZTM4NGE5ZDQzNyIsInN1YiI6IjYzYzgwMjU1MTQyZWYxMDBhMDRhNDlhNiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.6ZsaTh2ykBspSOnpl3OXzT6x9gfdQN6hFmwdHU6O8lA';

  @override
  void initState() {
    loadmovies();
    super.initState();
  }

  loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apikey, readaccesstoken),
        logConfig: ConfigLogger(showLogs: true, showErrorLogs: true));
    Map latestresult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map featuredresult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvresult = await tmdbWithCustomLogs.v3.tv.getTopRated();

    setState(() {
      latestmovies = latestresult['results'];
      featuredmovies = featuredresult['results'];
      tv = tvresult['results'];
    });
    print(tv);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        // centerTitle: true,
        backgroundColor: Colors.transparent,
        title: modified_text(
          text: 'App like IMDB',
          color: Colors.yellow,
          size: 20,
        ),
      ),
      body: ListView(
        children: [
          TV(tv: tv),
          LatestMovies(latest: latestmovies),
          Featured(featured: featuredmovies),
        ],
      ),
    );
  }
}
