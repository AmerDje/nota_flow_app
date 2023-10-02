import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(25),
      height: 240,
      width: 400,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 203, 59),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Note X",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
              IconButton(
                padding: const EdgeInsets.only(top: 40),
                onPressed: () {},
                icon: const Icon(FontAwesomeIcons.trash, color: Colors.black),
                iconSize: 30,
              )
            ],
          ),
          const Spacer(
            flex: 2,
          ),
          const Text(
            "This is Your Note X",
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
          const Spacer(),
          const Text(
            "This is The Explanation of The Note",
            style: TextStyle(color: Colors.black),
          ),
          const Spacer(
            flex: 3,
          ),
          const Align(
            alignment: Alignment.bottomRight,
            child: Text(
              "21/01/2023",
              style: TextStyle(color: Colors.black),
            ),
          )
        ],
      ),
    );
  }
}
