import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  final IconData icon;

  final VoidCallback? onPressed;

  const SearchButton({super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.grey.withOpacity(.05),
      ),
      child: IconButton(
          splashRadius: 24,
          onPressed: onPressed,
          icon: Icon(
            icon,
            size: 30,
          )),
    );
  }
}
