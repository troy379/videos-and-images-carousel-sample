import 'package:flutter/material.dart';
import 'package:test_project/get_it.dart';
import 'package:test_project/presentation/features/feed/feed_page.dart';

void main() {
  setupDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Test Project',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FeedPage(),
    );
  }
}
