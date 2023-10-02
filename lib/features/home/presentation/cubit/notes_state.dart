part of 'notes_cubit.dart';

abstract class NotesState {}

class NotesInitial extends NotesState {}

class NotesLoading extends NotesState {}

class NoteFetch extends NotesState {}

class NoteCreate extends NotesState {}

class NotesFailure extends NotesState {
  final String errMessage;

  NotesFailure(this.errMessage);
}
