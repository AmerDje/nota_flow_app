import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.symmetric(
          vertical: 5, horizontal: MediaQuery.sizeOf(context).width / 6),
      backgroundColor: Colors.blueGrey,
      closeIconColor: Colors.grey,
      content: Text(
        text,
      )));
}
