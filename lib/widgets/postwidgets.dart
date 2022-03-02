import 'package:flutter/material.dart';
import 'package:league/widgets/posts.dart';

class PostItemd extends StatefulWidget {
  final String body;
  final String img;
  final String name;
  final String title;

  const PostItemd({
    Key? key,
    required this.body,
    required this.title,
    required this.img,
    required this.name,
  }) : super(key: key);

  @override
  State<PostItemd> createState() => PostItemdState();
}

class PostItemdState extends State<PostItemd> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PostView(
                    title: widget.title,
                    name: widget.name,
                    img: widget.img,
                    body: widget.body,
                  )),
        );
      },
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(widget.img), fit: BoxFit.fill)),
              ),
              const SizedBox(width: 10),
              Text(widget.name),
            ],
          ),
          const SizedBox(height: 10),
          Text(widget.title),
          Text(widget.body),
          const Divider(),
        ],
      ),
    );
  }
}
