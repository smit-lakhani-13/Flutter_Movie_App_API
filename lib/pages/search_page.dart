// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Search Page'),
      // ),
      body: SingleChildScrollView(
          child: SafeArea(
        child: Column(children: [
          Container(
            height: 60,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Color(0xFF292B37),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(children: [
              Icon(Icons.search, color: Colors.white54, size: 30),
              Container(
                width: 300,
                margin: EdgeInsets.only(left: 5),
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search",
                      hintStyle: TextStyle(color: Colors.white54)),
                ),
              ),
              SizedBox(height: 30),
              // UpcomingWidget(),
            ]),
          )
        ]),
      )),
    );
  }
}
