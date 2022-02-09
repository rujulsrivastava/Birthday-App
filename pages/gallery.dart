import 'package:flutter/material.dart';

class Gallery extends StatefulWidget {
  const Gallery({Key? key}) : super(key: key);

  @override
  _GalleryState createState() => _GalleryState();
}

final img = ["images/image1.jfif", "images/image2.jfif", "images/image3.jfif"];

class _GalleryState extends State<Gallery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Moments'),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext ctx, int index) {
          return Image.asset(img[index]);
        },
        itemCount: img.length,
      ),
    );
  }}