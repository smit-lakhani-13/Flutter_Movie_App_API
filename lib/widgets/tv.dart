import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';
import 'package:tmdb_api/tmdb_api.dart';

import '../description.dart';

class TV extends StatelessWidget {
  const TV({super.key, required this.tv});
  final List tv;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(
            text: 'Popular TV Shows',
            size: 26,
            color: Colors.white,
          ),
          SizedBox(
            height: 10,
          ),
          CarouselSlider(
            items: List.generate(tv.length, (index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Description(
                                name: tv[index]['original_name'].toString(),
                                bannerurl: 'https://image.tmdb.org/t/p/w500' +
                                    tv[index]['backdrop_path'],
                                posterurl: 'https://image.tmdb.org/t/p/w500' +
                                    tv[index]['poster_path'],
                                description: tv[index]['overview'],
                                vote: tv[index]['vote_average'].toString(),
                                launch_on:
                                    tv[index]['first_air_date'].toString(),
                              )));
                },
                child: Container(
                  width: 280,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        tv[index]['original_name'] != null
                            ? Container(
                                width: 280,
                                height: 160,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500' +
                                          tv[index]['backdrop_path'],
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )
                            : Container(),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: modified_text(
                            text: tv[index]['original_name'] != null
                                ? tv[index]['original_name']
                                : 'Loading',
                            color: Colors.white,
                            size: 16,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }),
            options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.zoom,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
            ),
          ),
        ],
      ),
    );
  }
}
