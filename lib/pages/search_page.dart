import 'package:flutter/material.dart';
import 'package:movie_app/model/movie_model.dart';

import '../utils/text.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<SearchPage> {
  static List<MovieModel> main_movies_list = [
    MovieModel("Avatar", 2009, 7.9,
        "https://m.media-amazon.com/images/M/MV5BYjhiNjBlODctY2ZiOC00YjVlLWFlNzAtNTVhNzM1YjI1NzMxXkEyXkFqcGdeQXVyMjQxNTE1MDA@._V1_.jpg"),
    MovieModel("Mission Majnu", 2023, 8.1,
        "https://cdn.bollywoodmdb.com/fit-in/movies/largethumb/2021/mission-majnu/mission-majnu-poster-4.jpg"),
    MovieModel("Batman: The Long Halloween", 2022, 7.2,
        "https://wallpapercave.com/wp/wp10848252.jpg"),
    MovieModel("RRR", 2022, 7.9,
        "https://m.media-amazon.com/images/M/MV5BYjcyNDNkMzMtNWVjOC00ZTdjLTg1YTAtODMzMjMzZjJlNzEzXkEyXkFqcGdeQXVyMTA3MDk2NDg2._V1_.jpg"),
    MovieModel("The Avengers", 2012, 8,
        "https://terrigen-cdn-dev.marvel.com/content/prod/1x/theavengers_lob_crd_03_0.jpg"),
    MovieModel("Drishyam", 2015, 8.2,
        "https://m.media-amazon.com/images/M/MV5BYmJhZmJlYTItZmZlNy00MGY0LTg0ZGMtNWFkYWU5NTA1YTNhXkEyXkFqcGdeQXVyODE5NzE3OTE@._V1_.jpg"),
    MovieModel("Cruella", 2021, 7.3,
        "https://lumiere-a.akamaihd.net/v1/images/p_cruella_21672_ba40c762.jpeg"),
    MovieModel("K.G.F: Chapter 2", 2022, 8.3,
        "https://m.media-amazon.com/images/M/MV5BNWRlYTAyZDQtZmQ5Yi00ZTUzLTljZDMtYjcwZTgyMDIwOGRiXkEyXkFqcGdeQXVyMTUwMDg3OTQy._V1_FMjpg_UX1000_.jpg"),
    MovieModel("Avengers: Age of Ultron", 2015, 7.3,
        "https://m.media-amazon.com/images/M/MV5BMTM4OGJmNWMtOTM4Ni00NTE3LTg3MDItZmQxYjc4N2JhNmUxXkEyXkFqcGdeQXVyNTgzMDMzMTg@._V1_.jpg"),
    MovieModel("The Conjuring", 2013, 7.5,
        "https://m.media-amazon.com/images/M/MV5BMTM3NjA1NDMyMV5BMl5BanBnXkFtZTcwMDQzNDMzOQ@@._V1_.jpg"),
    MovieModel("Avatar: The Way of Water", 2022, 7.9,
        "https://m.media-amazon.com/images/M/MV5BYjhiNjBlODctY2ZiOC00YjVlLWFlNzAtNTVhNzM1YjI1NzMxXkEyXkFqcGdeQXVyMjQxNTE1MDA@._V1_.jpg"),
    MovieModel("The Kashmir Files", 2022, 8.7,
        "https://m.media-amazon.com/images/M/MV5BYzJkZDIwYTAtMGU4Mi00NzU3LWI1MWItODg0M2Q1NmIxYmNlXkEyXkFqcGdeQXVyMTIyNzY0NTMx._V1_.jpg"),
    MovieModel("Avengers: Infinity War", 2018, 8.4,
        "https://m.media-amazon.com/images/I/A10Yqp5GQKL._SY679_.jpg"),
    MovieModel("Drishyam 2", 2022, 8.4,
        "https://upload.wikimedia.org/wikipedia/en/thumb/9/9e/Drishyam_2_2022_film_poster.jpg/220px-Drishyam_2_2022_film_poster.jpg"),
    MovieModel("Avengers: Endgame", 2019, 8.4,
        "https://m.media-amazon.com/images/I/81KJ-sK0YpS._SY550_.jpg"),
  ];

  List<MovieModel> display_list = List.from(main_movies_list);

  void updateList(String value) {
    setState(() {
      display_list = main_movies_list
          .where((element) =>
              element.movie_title!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
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
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.only(
          bottom: 16,
          left: 16,
          right: 16,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (value) => updateList(value),
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                hintText: " Search a Movie",
                prefixIcon: Icon(Icons.search),
                prefixIconColor: Colors.black87,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: display_list.length == 0
                  ? Center(
                      child: modified_text(
                        text: 'No Result found',
                        color: Colors.white,
                        size: 24,
                      ),
                    )
                  : ListView.builder(
                      itemCount: display_list.length,
                      itemBuilder: (context, index) => ListTile(
                        contentPadding: EdgeInsets.all(8.0),
                        title: modified_text(
                          text: display_list[index].movie_title!,
                          color: Colors.white,
                          size: 22,
                        ),
                        subtitle: modified_text(
                          text: '${display_list[index].movie_release_year}',
                          color: Colors.white60,
                          size: 16,
                        ),
                        trailing: modified_text(
                          text: '${display_list[index].rating}',
                          color: Colors.amber,
                          size: 18,
                        ),
                        leading: Image.network(
                            display_list[index].movie_poster_url!),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
