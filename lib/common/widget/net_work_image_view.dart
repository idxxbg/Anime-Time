import 'package:flutter/material.dart';

class NetWorkImageView extends StatelessWidget {
  const NetWorkImageView(
      {super.key, required this.imageUrl, required this.index});
  final int index;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (AppBar(
        backgroundColor: Colors.transparent,
      )),
      body: Center(
        child: Hero(
          tag: '$imageUrl + $index',
          child: InteractiveViewer(
            panEnabled: false,
            minScale: 0.1,
            maxScale: 2,
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
