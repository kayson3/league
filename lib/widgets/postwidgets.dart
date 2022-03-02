import 'package:flutter/material.dart';

class PostItemd extends StatefulWidget {
  final String description;
  final String img;
  final String username;
  final String title;

  const PostItemd({
    Key? key,
    required this.img,
    required this.username,
    required this.description,
    required this.title,
  }) : super(key: key);

  @override
  State<PostItemd> createState() => PostItemdState();
}

class PostItemdState extends State<PostItemd> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
