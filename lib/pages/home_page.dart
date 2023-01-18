// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:movie_app/main.dart';

void main() => runApp(MyApp());

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Movie App'),
      ),
    );
  }
}
