import 'package:hive/hive.dart';

part 'note_model.g.dart';

@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  @HiveField(0)
  String noteTitle;
  @HiveField(1)
  String noteBody;
  @HiveField(2)
  final String date;
  @HiveField(3)
  int color;

  NoteModel(
      {required this.noteTitle,
      required this.noteBody,
      required this.date,
      required this.color});
}
