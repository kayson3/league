import 'package:flutter/material.dart';

class PostView extends StatelessWidget {
  final String body;
  final String img;
  final String name;
  final String title;

  const PostView({
    Key? key,
    required this.body,
    required this.title,
    required this.img,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          height: 50,
          decoration: BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
              image:
                  DecorationImage(image: NetworkImage(img), fit: BoxFit.fill)),
        ),
        title: Text(name, style: const TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white54,
      ),
      body: Column(
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(body)
        ],
      ),
    );
  }
}
