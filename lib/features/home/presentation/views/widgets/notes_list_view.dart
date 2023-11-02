import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota_flow_app/core/components/custom_app_bar.dart';
import 'package:nota_flow_app/core/utils/assets.dart';
import 'package:nota_flow_app/features/home/models/note_model.dart';
import 'package:nota_flow_app/features/home/presentation/cubit/notes_cubit.dart';
import 'package:nota_flow_app/features/home/presentation/views/widgets/searchable_list.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel>? notesList = BlocProvider.of<NotesCubit>(context).notes;
        if (notesList!.isEmpty) {
          return Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(bottom: 8.0, left: 10, right: 10),
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
              const Center(
                child: Text(
                  "There is No Notes",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.normal),
                ),
              ),
            ],
          );
        } else {
          return SearchableNoteList(
            notesList: notesList,
          );
        }
      },
    );
  }
}
