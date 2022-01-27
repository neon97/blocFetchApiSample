import 'package:flutter/material.dart';
import 'package:ftips_bloc_fetch_api/pages/mountainersBlog.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MountainersPage(),
    );
  }
}
