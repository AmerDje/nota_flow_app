import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';
import 'package:nota_flow_app/core/utils/components/custom_button.dart';
import 'package:nota_flow_app/core/utils/components/custom_text_field.dart';
import 'package:nota_flow_app/core/utils/helpers/show_snack_bar.dart';
import 'package:nota_flow_app/features/home/models/note_model.dart';
import 'package:nota_flow_app/features/home/presentation/cubit/notes_cubit.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? noteTitle, noteBody;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotesCubit, NotesState>(listener: (context, state) {
      if (state is NotesFailure) {
        showSnackBar(context, state.errMessage);
      }
      if (state is NoteCreate) {
        showSnackBar(context, 'Note Added');
        Navigator.pop(context);
      }
    }, builder: (context, state) {
      return AbsorbPointer(
        absorbing: state is NotesLoading ? true : false,
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              CustomTextField(
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Field is required';
                  } else {
                    return null;
                  }
                },
                text: 'Note Title',
                onSaved: (value) {
                  noteTitle = value;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Field is required';
                  } else {
                    return null;
                  }
                },
                text: 'Note Body',
                maxLines: 5,
                onSaved: (value) {
                  noteBody = value;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                text: 'Note Color',
                maxLines: 1,
                suffixIcon: Icon(
                  Icons.rectangle,
                  color: currentColor,
                ),
                readOnly: true,
                onTap: () => colorPickerDialog(),
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: CustomButton(
                  isLoading: state is NotesLoading ? true : false,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();

                      NoteModel note = NoteModel(
                          noteTitle: noteTitle!,
                          noteBody: noteBody!,
                          date: DateFormat('MMMM dd, yyyy')
                              .format(DateTime.now()),
                          color: currentColor.value);
                      BlocProvider.of<NotesCubit>(context).addNote(note);

                      BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Color pickerColor = const Color(0xff443a49);
  Color currentColor = const Color.fromARGB(0, 0, 0, 0);

  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  void colorPickerDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape:
            ContinuousRectangleBorder(borderRadius: BorderRadius.circular(18)),
        title: const Text('Pick Note color!'),
        content: SingleChildScrollView(
          child: BlockPicker(
            pickerColor: currentColor,
            onColorChanged: changeColor,
          ),
        ),
        actions: <Widget>[
          ElevatedButton(
            child: const Text('Select Color'),
            onPressed: () {
              setState(() => currentColor = pickerColor);
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
