import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:league/widgets/postwidgets.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'League',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();

    getposts().then((value) {
      setState(() {});
    });
    // get the weather before the UI is built
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white54,
      ),
      body: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return const PostItemd(
              img: '',
              username: '',
              description: '',
              title: '',
            );
          }),
    );
  }

  getposts() async {
    var url = Uri.parse("https://engineering.league.dev/challenge/api/posts");

    http.Response response = await http.get(url,
        headers: {'x-access-token': 'DED0F00254CC145CD11BBA6BA35552FA'});

    var results = jsonDecode(response.body);
    print(results);
    String title = results[0]['title'];
    String body = results[0]['body'];
  }
}
