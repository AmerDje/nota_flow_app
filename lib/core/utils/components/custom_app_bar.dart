import 'package:flutter/material.dart';
import 'package:nota_flow_app/core/utils/components/search_button.dart';

class CustomAppBar extends StatelessWidget {
  final IconData icon;

  final String title;

  final VoidCallback? onPressed;

  const CustomAppBar(
      {super.key,
      required this.icon,
      required this.title,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 25),
        ),
        SearchButton(
          icon: icon,
          onPressed: onPressed,
        ),
      ],
    );
  }
}
