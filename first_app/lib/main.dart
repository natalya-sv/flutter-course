import 'package:flutter/material.dart';
import 'package:first_app/gradient_container.dart';

void main() {
  //add const to help to optimize: reused in memory, instead of duplications
  runApp(
    const MaterialApp(
      home: Scaffold(
          body: GradientContainer(
        Color.fromARGB(255, 56, 120, 232),
        Color.fromARGB(255, 18, 47, 97),
      )),
    ),
  );
}
