import 'package:flutter/material.dart';

class InforText extends StatelessWidget {
  const InforText({super.key, required this.label, required this.infor});
  final String label;
  final String infor;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '$label:  ',
        style: Theme.of(context).textTheme.labelMedium,
        children: [
          TextSpan(
            text: infor,
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ],
      ),
    );
  }
}
