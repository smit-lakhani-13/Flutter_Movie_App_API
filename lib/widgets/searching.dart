import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';

import '../description.dart';

class Searching extends StatefulWidget {
  const Searching({super.key, required this.searching});
  final List searching;

  @override
  State<Searching> createState() => _SearchingState();
}

class _SearchingState extends State<Searching> {
  List movie = [];
  List searchMovieList = [];
  bool isSearching = false;
  @override
  void initState() {
    super.initState();
    movie = widget.searching;
  }

  void searching(String movieName) {
    searchMovieList.clear();
    for (var element in movie) {
      if (element['title'].contains(movieName)) {
        searchMovieList.add(element);
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: SafeArea(
        minimum: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white54,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                hintText: "Search Movies",
                prefixIcon: Icon(Icons.search),
                prefixIconColor: Colors.grey,
              ),
              onChanged: (text) {
                if (text.isNotEmpty) {
                  setState(() {
                    isSearching = true;
                  });
                  searching(text);
                } else {
                  setState(() {
                    isSearching = false;
                  });
                }
                // print('The movie is $text: searching[index]['title']');
                // print($text: searching[index]['title'](data.results[0].title));
              },
            ),
            SizedBox(
              height: 10,
            ),
            // Expanded(
            //   child: ListView.builder(
            //       itemCount: searching.length,
            //       itemBuilder: (BuildContext context, int index) {
            //         return Scaffold(
            //           body: null,
            //         );
            //       }),
            // ),
            Container(
              height: 540,
              width: 300,
              child: ListView.builder(
                itemCount: isSearching ? searchMovieList.length : movie.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Description(
                                    name: movie[index]['title'],
                                    bannerurl:
                                        'https://image.tmdb.org/t/p/w500' +
                                            movie[index]['backdrop_path'],
                                    posterurl:
                                        'https://image.tmdb.org/t/p/w500' +
                                            movie[index]['poster_path'],
                                    description: movie[index]['overview'],
                                    vote:
                                        movie[index]['vote_average'].toString(),
                                    launch_on: movie[index]['release_date'],
                                  )));
                    },
                    child: movie[index]['title'] != null
                        ? Container(
                            width: 140,
                            child: Column(children: [
                              Container(
                                height: 400,
                                width: 260,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          'https://image.tmdb.org/t/p/w500' +
                                              movie[index]['poster_path']),
                                    )),
                              ),
                              Container(
                                padding: EdgeInsets.only(bottom: 30),
                                child: modified_text(
                                  text: movie[index]['title'] != null
                                      ? movie[index]['title']
                                      : 'Loading',
                                  color: Colors.white,
                                  size: 16,
                                ),
                              )
                            ]),
                          )
                        : Container(),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
