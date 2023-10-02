import 'package:flutter/material.dart';
import 'package:nota_flow_app/features/home/presentation/views/widgets/add_note_form.dart';

class NoteBottomSheet extends StatelessWidget {
  const NoteBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: MediaQuery.viewInsetsOf(context).bottom == 0
                ? 16.0
                : MediaQuery.viewInsetsOf(context)
                    .bottom, //this gives the keyboard height
            top: 16.0),
        child: const SingleChildScrollView(child: AddNoteForm()));
  }
}
