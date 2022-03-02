import 'dart:convert';

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
    // get the Posts before the UI is built
  }

  late List<Widget> post;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Posts', style: TextStyle(color: Colors.black)),
          centerTitle: true,
          backgroundColor: Colors.white54,
        ),
        body: ListView(
          children: post == null ? [const Text('Loading')] : post,
        ));
  }

  getposts() async {
    //for getting the posts
    var url = Uri.parse("https://engineering.league.dev/challenge/api/posts");

    http.Response response = await http.get(url,
        headers: {'x-access-token': 'DED0F00254CC145CD11BBA6BA35552FA'});

    var results = jsonDecode(response.body);
    print(results);

    // for getting users
    var url2 = Uri.parse("https://engineering.league.dev/challenge/api/users");
    http.Response response2 = await http.get(url2,
        headers: {'x-access-token': 'DED0F00254CC145CD11BBA6BA35552FA'});

    var results2 = jsonDecode(response2.body);

    List<Widget> buildProperties() {
      List<Widget> list = [];
      for (var i = 0; i < results.length; i++) {
        list.add(PostItemd(
          title: results[i]['title'],
          body: results[i]['body'],
          img: results2[0][i]["avatar"]['medium'],
          name: results2[0][i]["name"],
        ));
      }
      return list;
    }

    post = buildProperties();
  }
}
