// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:movie_app/widgets/searching.dart';
import 'package:tmdb_api/tmdb_api.dart';

import '../utils/text.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<SearchPage> {
  List searchmovies = [];
  final String apikey = '9883df1fd1160de45eca0ce384a9d437';
  final readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5ODgzZGYxZmQxMTYwZGU0NWVjYTBjZTM4NGE5ZDQzNyIsInN1YiI6IjYzYzgwMjU1MTQyZWYxMDBhMDRhNDlhNiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.6ZsaTh2ykBspSOnpl3OXzT6x9gfdQN6hFmwdHU6O8lA';

  @override
  void initState() {
    loadsearchmovies();
    super.initState();
  }

  loadsearchmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apikey, readaccesstoken),
        logConfig: ConfigLogger(showLogs: true, showErrorLogs: true));
    Map searchresult =
        await tmdbWithCustomLogs.v3.search.queryMovies('Sony Pictures');

    setState(() {
      searchmovies = searchresult['results'];
    });
    print(searchresult);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: modified_text(
          text: 'Search Page',
          color: Colors.yellow,
          size: 20,
        ),
      ),
      body: ListView(
        children: [Searching(searching: searchmovies)],
      ),
    );
  }
}

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     backgroundColor: Colors.black,
  //     // appBar: AppBar(
  //     //   title: const Text('Search Page'),
  //     // ),
  //     body: SingleChildScrollView(
  //         child: SafeArea(
  //       child: Column(children: [
  //         Container(
  //           height: 60,
  //           padding: EdgeInsets.all(10),
  //           margin: EdgeInsets.symmetric(horizontal: 10),
  //           decoration: BoxDecoration(
  //             color: Color(0xFF292B37),
  //             borderRadius: BorderRadius.circular(10),
  //           ),
  //           child: Row(children: [
  //             Icon(Icons.search, color: Colors.white54, size: 30),
  //             Container(
  //               width: 300,
  //               margin: EdgeInsets.only(left: 5),
  //               child: TextFormField(
  //                 style: TextStyle(color: Colors.white),
  //                 decoration: InputDecoration(
  //                     border: InputBorder.none,
  //                     hintText: "Search",
  //                     hintStyle: TextStyle(color: Colors.white54)),
  //               ),
  //             ),
  //             SizedBox(height: 30),
  //             // UpcomingWidget(),
  //           ]),
  //         )
  //       ]),
  //     )),
  //   );
  // }


  // @override
  // _SearchState createState() => _SearchState();
  // }

  // class _SearchState extends State<SearchPage> {
  // @override
  // Widget build(BuildContext context) {
  //   // TODO: implement build
  //   throw UnimplementedError();
  // }

