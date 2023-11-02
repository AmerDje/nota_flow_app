import 'package:flutter/material.dart';
import 'package:nota_flow_app/core/components/custom_app_bar.dart';
import 'package:nota_flow_app/core/utils/assets.dart';

class EmptyNotesList extends StatelessWidget {
  const EmptyNotesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0, left: 10, right: 10),
          child: CustomAppBar(
            icon: Icons.search,
            title: Image.asset(
              Assets.logoOnLetter,
              height: 60,
              width: 150,
            ),
            onPressed: null,
          ),
        ),
        const Spacer(),
        const Text(
          "There is No Notes",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.normal),
        ),
        const Spacer()
      ],
    );
  }
}
