import 'package:flutter/material.dart';
import 'package:notes_app/utils/page_animation_transition.dart';
import 'package:notes_app/views/home/widgets/notes_list_view.dart';

import '../../../components/custom_app_bar.dart';
import 'hooks_form.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.only(bottom: 8.0, left: 10, right: 10),
              child: CustomAppBar(
                icon: Icons.search,
                title: 'Notes List',
                onPressed: () {
                  Navigator.push(context,
                      PageTransitionAnimation(widget: const HooksForm()));
                },
              )),
          const Expanded(child: NotesListView())
        ],
      ),
    );
  }
}
