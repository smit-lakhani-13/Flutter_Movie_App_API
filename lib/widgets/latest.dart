import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';

import '../description.dart';

class LatestMovies extends StatelessWidget {
  const LatestMovies({super.key, required this.latest});
  final List latest;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(
            text: 'Latest Movies',
            size: 26,
            color: Colors.white,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 270,
            child: ListView.builder(
                itemCount: latest.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Description(
                                    name: latest[index]['title'],
                                    bannerurl:
                                        'https://image.tmdb.org/t/p/w500' +
                                            latest[index]['backdrop_path'],
                                    posterurl:
                                        'https://image.tmdb.org/t/p/w500' +
                                            latest[index]['poster_path'],
                                    description: latest[index]['overview'],
                                    vote: latest[index]['vote_average']
                                        .toString(),
                                    launch_on: latest[index]['release_date'],
                                  )));
                    },
                    child: latest[index]['title'] != null
                        ? Container(
                            padding: EdgeInsets.all(5),
                            width: 140,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Container(
                                    height: 200,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          'https://image.tmdb.org/t/p/w500' +
                                              latest[index]['poster_path'],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: modified_text(
                                      text: latest[index]['title'] != null
                                          ? latest[index]['title']
                                          : latest[index]['original_name'],
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        : Container(),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
