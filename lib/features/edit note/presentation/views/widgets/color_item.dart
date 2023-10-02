import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isSelected, required this.color});
  final bool isSelected;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: isSelected == true
          ? CircleAvatar(
              backgroundColor: color,
              radius: 30,
              child: const Icon(
                FontAwesomeIcons.check,
                color: Colors.white,
              ))
          : CircleAvatar(
              radius: 30,
              backgroundColor: color,
            ),
    );
  }
}
