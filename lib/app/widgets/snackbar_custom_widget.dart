import 'package:flutter/material.dart';

class SnackbarCustomWidget extends StatelessWidget {
  final String contentText;
  const SnackbarCustomWidget({Key? key, required this.contentText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SnackBar(behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.black,
          duration: const Duration(seconds: 3),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          content: Text(
            contentText,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        );
  }
}


