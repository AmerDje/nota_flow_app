import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota_flow_app/core/utils/assets.dart';
import 'package:nota_flow_app/core/components/custom_app_bar.dart';
import 'package:nota_flow_app/features/home/models/note_model.dart';
import 'package:nota_flow_app/features/home/presentation/cubit/notes_cubit.dart';
import 'package:nota_flow_app/features/home/presentation/views/widgets/note_card_tile.dart';
import 'package:nota_flow_app/features/home/presentation/views/widgets/notes_search_field.dart';

class SearchableNoteList extends StatefulWidget {
  const SearchableNoteList({super.key, required this.notesList});
  final List<NoteModel> notesList;
  @override
  State<SearchableNoteList> createState() => _SearchableNoteListState();
}

class _SearchableNoteListState extends State<SearchableNoteList> {
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<NotesCubit>(context)
        .filteredNotesList
        ?.addAll(widget.notesList);
  }

  bool isFirst = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0, left: 10, right: 10),
          child: StatefulBuilder(builder: (context, setState) {
            return AnimatedCrossFade(
                firstChild: CustomAppBar(
                  icon: Icons.search,
                  title: Image.asset(
                    Assets.logoOnLetter,
                    height: 60,
                    width: 150,
                  ),
                  onPressed: () {
                    isFirst = !isFirst;
                    setState(() {});
                  },
                ),
                secondChild: NotesSearchField(
                  onPressed: () {
                    isFirst = !isFirst;
                    setState(() {});
                  },
                  onChanged: filterNotes,
                  controller: searchController,
                ),
                crossFadeState: !isFirst
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: const Duration(milliseconds: 200));
          }),
        ),
        Expanded(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount:
                BlocProvider.of<NotesCubit>(context).filteredNotesList?.length,
            itemBuilder: ((context, index) {
              return NoteCardTile(
                  note: BlocProvider.of<NotesCubit>(context)
                      .filteredNotesList![index]);
            }),
          ),
        ),
      ],
    );
  }

  void filterNotes(String query) {
    BlocProvider.of<NotesCubit>(context).filteredNotesList?.clear();
    if (query.isEmpty) {
      BlocProvider.of<NotesCubit>(context)
          .filteredNotesList
          ?.addAll(widget.notesList);
    } else {
      for (var note in widget.notesList) {
        if (note.noteTitle.toLowerCase().contains(query.toLowerCase())) {
          BlocProvider.of<NotesCubit>(context).filteredNotesList?.add(note);
        }
      }
    }
    setState(() {});
  }
}
