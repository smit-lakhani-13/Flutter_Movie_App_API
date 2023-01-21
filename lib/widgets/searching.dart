import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';

import '../description.dart';

class Searching extends StatelessWidget {
  const Searching({super.key, required this.searching});
  final List searching;

  void updateList(String value) {
    // setState(() {});
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
            // modified_text(
            //   text: 'Search Movies',
            //   color: Colors.white,
            //   size: 26,
            // ),
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
                itemCount: searching.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Description(
                                    name: searching[index]['title'],
                                    bannerurl:
                                        'https://image.tmdb.org/t/p/w500' +
                                            searching[index]['backdrop_path'],
                                    posterurl:
                                        'https://image.tmdb.org/t/p/w500' +
                                            searching[index]['poster_path'],
                                    description: searching[index]['overview'],
                                    vote: searching[index]['vote_average']
                                        .toString(),
                                    launch_on: searching[index]['release_date'],
                                  )));
                    },
                    child: searching[index]['title'] != null
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
                                              searching[index]['poster_path']),
                                    )),
                              ),
                              Container(
                                padding: EdgeInsets.only(bottom: 30),
                                child: modified_text(
                                  text: searching[index]['title'] != null
                                      ? searching[index]['title']
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
