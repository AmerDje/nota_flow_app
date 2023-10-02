import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota_flow_app/core/utils/assets.dart';
import 'package:nota_flow_app/core/utils/components/custom_app_bar.dart';
import 'package:nota_flow_app/features/home/models/note_model.dart';
import 'package:nota_flow_app/features/home/presentation/cubit/notes_cubit.dart';
import 'package:nota_flow_app/features/home/presentation/views/widgets/note_card_tile.dart';

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
          return YourWidget(
            notesList: notesList,
          );
        }
      },
    );
  }
}

class YourWidget extends StatefulWidget {
  const YourWidget({super.key, required this.notesList});
  final List<NoteModel> notesList;
  @override
  _YourWidgetState createState() => _YourWidgetState();
}

class _YourWidgetState extends State<YourWidget> {
  List<NoteModel> filteredNotesList = [];

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredNotesList.addAll(widget.notesList);
  }

  void filterNotes(String query) {
    filteredNotesList.clear();
    if (query.isEmpty) {
      filteredNotesList.addAll(widget.notesList);
    } else {
      for (var note in widget.notesList) {
        if (note.noteTitle.toLowerCase().contains(query.toLowerCase())) {
          filteredNotesList.add(note);
        }
      }
    }
    setState(() {});
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
                  title: Assets.logoOnLetter,
                  onPressed: () {
                    isFirst = !isFirst;
                    setState(() {});
                  },
                ),
                secondChild: SizedBox(
                  height: 60,
                  width: MediaQuery.sizeOf(context).width,
                  child: Center(
                    child: TextField(
                      controller: searchController,
                      onChanged: filterNotes,
                      decoration: InputDecoration(
                        hintText: 'Search Notes',
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon: IconButton(
                            splashRadius: 25,
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              isFirst = !isFirst;
                              setState(() {});
                            },
                            icon: const Icon(Icons.close)),
                      ),
                    ),
                  ),
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
            itemCount: filteredNotesList.length,
            itemBuilder: ((context, index) {
              return NoteCardTile(note: filteredNotesList[index]);
            }),
          ),
        ),
      ],
    );
  }
}
