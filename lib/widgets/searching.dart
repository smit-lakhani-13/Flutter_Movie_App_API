import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';

class Searching extends StatelessWidget {
  const Searching({super.key, required this.searching});
  final List searching;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          modified_text(
            text: 'Search Movies',
            color: Colors.white,
            size: 26,
          ),
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
        ],
      ),
    );
  }
}
