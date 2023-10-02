import 'package:flutter/material.dart';
import 'package:nota_flow_app/core/utils/components/custom_app_bar.dart';
import 'package:nota_flow_app/features/home/presentation/views/widgets/notes_list_view.dart';

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
                onPressed: () {},
              )),
          const NotesListView()
        ],
      ),
    );
  }
}
