import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota_flow_app/core/components/custom_app_bar.dart';
import 'package:nota_flow_app/core/components/custom_text_field.dart';
import 'package:nota_flow_app/features/edit%20note/presentation/views/widgets/colors_list_view.dart';
import 'package:nota_flow_app/features/home/models/note_model.dart';
import 'package:nota_flow_app/features/home/presentation/cubit/notes_cubit.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key});

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? noteTitle, noteBody;
  @override
  Widget build(BuildContext context) {
    NoteModel oldNote = ModalRoute.of(context)?.settings.arguments as NoteModel;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              CustomAppBar(
                icon: Icons.check,
                title: const Text(
                  'Edit Note',
                  style: TextStyle(fontSize: 25),
                ),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    Color? noteColor =
                        BlocProvider.of<NotesCubit>(context).noteColor;
                    oldNote.noteTitle = noteTitle!;
                    oldNote.noteBody = noteBody!;
                    oldNote.color = noteColor?.value ?? oldNote.color;
                    oldNote.save();
                    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                    Navigator.pop(context);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              ),
              const SizedBox(
                height: 30,
              ),
              CustomTextField(
                initialValue: oldNote.noteTitle,
                maxLines: 1,
                text: 'Note Title',
                onSaved: (value) {
                  noteTitle = value;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                initialValue: oldNote.noteBody,
                maxLines: 5,
                text: 'Note Body',
                onSaved: (value) {
                  noteBody = value;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              const ColorsListView(),
            ],
          ),
        ),
      ),
    );
  }
}
