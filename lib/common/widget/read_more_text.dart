import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ReadMoreText extends StatelessWidget {
  ReadMoreText({
    super.key,
    required this.longText,
  });

  final String longText;

  bool readMore = false;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
      return Wrap(
        children: [
          Text(
            longText,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Theme.of(context).primaryColor,
            ),
            maxLines: readMore ? 1000 : 5,
            overflow: TextOverflow.ellipsis,
          ),
          TextButton(
            onPressed: () {
              setState(() {
                readMore = !readMore;
              });
            },
            child: Text(readMore ? 'Read less' : 'Read more'),
          ),
        ],
      );
    });
  }
}
