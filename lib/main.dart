import 'package:billapp/Homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes:
      {
        '/': (contex) => Homepage(),

      }
    )
  );
}

