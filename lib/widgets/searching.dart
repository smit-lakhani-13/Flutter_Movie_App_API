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
              onChanged: (value) {
                if (value.isNotEmpty) {
                  setState(() {
                    isSearching = true;
                  });
                  searching(value);
                } else {
                  setState(() {
                    isSearching = false;
                  });
                }
              },
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 540,
              width: 300,
              child: ListView.builder(
                itemCount: isSearching
                    ? searchMovieList.length
                    : widget.searching.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Description(
                                    name: widget.searching[index]['title'],
                                    bannerurl:
                                        'https://image.tmdb.org/t/p/w500' +
                                            widget.searching[index]
                                                ['backdrop_path'],
                                    posterurl:
                                        'https://image.tmdb.org/t/p/w500' +
                                            widget.searching[index]
                                                ['poster_path'],
                                    description: widget.searching[index]
                                        ['overview'],
                                    vote: widget.searching[index]
                                            ['vote_average']
                                        .toString(),
                                    launch_on: widget.searching[index]
                                        ['release_date'],
                                  )));
                    },
                    child: widget.searching[index]['title'] != null
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
                                              widget.searching[index]
                                                  ['poster_path']),
                                    )),
                              ),
                              Container(
                                padding: EdgeInsets.only(bottom: 30),
                                child: modified_text(
                                  text: widget.searching[index]['title'],
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
