import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/notes_cubit/notes_cubit.dart';
import '../../../models/note_model.dart';
import 'note_card_tile.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel>? notesList = BlocProvider.of<NotesCubit>(context).notes;
        if (notesList!.isEmpty) {
          return const Center(
            child: Text(
              "There is no No Notes",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.normal),
            ),
          );
        } else {
          return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: notesList.length,
              itemBuilder: ((context, index) {
                return NoteCardTile(
                  note: notesList[index],
                );
              }));
        }
      },
    );
  }
}
