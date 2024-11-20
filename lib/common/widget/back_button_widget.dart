import 'package:flutter/material.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 30,
      left: 10,
      child: Builder(
        builder: (context) {
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
            ),
            onPressed: () => Navigator.of(context).pop(),
            child: const Icon(Icons.arrow_back_ios_new),
          );
        },
      ),
    );
  }
}
