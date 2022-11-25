import 'package:flutter/material.dart';

import 'first.dart';

void main() {
  runApp(MaterialApp(
    home: first(),
    // theme: ThemeData(brightness: Brightness.dark),
    color: Colors.teal,
    debugShowCheckedModeBanner: false,
  ));
}
