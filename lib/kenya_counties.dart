library kenya_counties;

import 'package:flutter/material.dart';
export 'src/county_search_field.dart';
export 'src/counties.dart';

import 'package:kenya_counties/src/county_search_field.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: CountySearchField(),
      ),
    );
  }
}
