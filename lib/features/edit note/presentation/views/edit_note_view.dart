import 'package:flutter/material.dart';
import 'package:nota_flow_app/features/edit%20note/presentation/views/widgets/edit_note_view_body.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: EditNoteViewBody()),
    );
  }
}
