import 'package:flutter/material.dart';
import 'package:movie_app/description.dart';
import 'package:movie_app/utils/text.dart';
import '../description.dart';

class Featured extends StatelessWidget {
  const Featured({super.key, required this.featured});
  final List featured;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(
            text: 'Featured Movies',
            size: 26,
            color: Colors.white,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 270,
            child: ListView.builder(
                itemCount: featured.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Description(
                                    name: featured[index]['title'],
                                    bannerurl:
                                        'https://image.tmdb.org/t/p/w500' +
                                            featured[index]['backdrop_path'],
                                    posterurl:
                                        'https://image.tmdb.org/t/p/w500' +
                                            featured[index]['poster_path'],
                                    description: featured[index]['overview'],
                                    vote: featured[index]['vote_average']
                                        .toString(),
                                    launch_on: featured[index]['release_date'],
                                  )));
                    },
                    child: featured[index]['title'] != null
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
                                              featured[index]['poster_path'],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: modified_text(
                                      text: featured[index]['title'] != null
                                          ? featured[index]['title']
                                          : 'Loading',
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
