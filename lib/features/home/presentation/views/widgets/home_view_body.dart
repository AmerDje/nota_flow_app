import 'package:flutter/material.dart';
import 'package:nota_flow_app/features/home/presentation/views/widgets/notes_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(15.0),
      child: NotesListView(),
    );
  }
}
