//import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nota_flow_app/constant.dart';
import 'package:nota_flow_app/features/home/models/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  Color? noteColor;
  List<NoteModel>? filteredNotesList = [];
  void addNote(NoteModel note) async {
    emit(NotesLoading());
    try {
      // note.color ??= noteColor.value ;
      final Box<NoteModel> notesBox = Hive.box<NoteModel>(kNotesBox);
      await notesBox.add(note);
      emit(NoteCreate());
    } catch (e) {
      emit(NotesFailure(e.toString()));
    }
  }

  List<NoteModel>? notes;
  void fetchAllNotes() {
    final Box<NoteModel> notesBox = Hive.box<NoteModel>(kNotesBox);
    notes = notesBox.values.toList();
    emit(NoteFetch());
  }
}
