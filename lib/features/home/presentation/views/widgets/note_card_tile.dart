import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nota_flow_app/core/extensions/navigation_extension.dart';
import 'package:nota_flow_app/core/helpers/show_snack_bar.dart';
import 'package:nota_flow_app/features/edit%20note/presentation/views/edit_note_view.dart';
import 'package:nota_flow_app/features/home/models/note_model.dart';
import 'package:nota_flow_app/features/home/presentation/cubit/notes_cubit.dart';

class NoteCardTile extends StatelessWidget {
  const NoteCardTile({
    super.key,
    required this.note,
  });

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.go(
            const EditNoteView(), RouteSettings(name: 'note', arguments: note));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(note.color).withOpacity(0.5),
              Color(note.color).withOpacity(0.8),
              Color(note.color).withOpacity(1),
            ]),
            borderRadius: BorderRadius.circular(16)),
        padding: const EdgeInsets.only(left: 16, bottom: 16, top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(
                note.noteTitle,
                style: const TextStyle(fontSize: 30, color: Colors.black),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  note.noteBody,
                  style: TextStyle(
                      fontSize: 16, color: Colors.black.withOpacity(0.5)),
                ),
              ),
              trailing: IconButton(
                padding: EdgeInsets.zero,
                icon: const Icon(
                  FontAwesomeIcons.trash,
                  color: Colors.black,
                  size: 25,
                ),
                onPressed: () {
                  note.delete();
                  BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                  showSnackBar(context, 'Note Deleted');
                },
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24),
              child: Text(
                note.date,
                style: TextStyle(
                    fontSize: 15, color: Colors.black.withOpacity(0.5)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//StatefulBuilder Example
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:notes_app/features/home/presentation/views/edit_note_view.dart';

// // ignore: must_be_immutable
// class NoteCardTile extends StatelessWidget {
//   NoteCardTile({super.key, required this.color, required this.index});
//   Color? color;
//   int index;
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(context, MaterialPageRoute(builder: (context) {
//           return const EditNoteView();
//         }));
//       },
//       child:Container(
//           margin: const EdgeInsets.only(bottom: 8),
//           decoration: BoxDecoration(
//               color: color, borderRadius: BorderRadius.circular(16)),
//           padding: const EdgeInsets.only(left: 16, bottom: 16, top: 16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               ListTile(
//                   title: const Text(
//                     'Note One',
//                     style: TextStyle(fontSize: 30, color: Colors.black),
//                   ),
//                   subtitle: Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 16.0),
//                     child: Text(
//                       'Bla Bla Bla Bla',
//                       style: TextStyle(
//                           fontSize: 16, color: Colors.black.withOpacity(0.5)),
//                     ),
//                   ),
//                   trailing: StatefulBuilder(builder: (context, newSetState) {
//         return  IconButton(
//                     padding: EdgeInsets.zero,
//                     icon: Icon(
//                       FontAwesomeIcons.trash,
//                       color: index == 3 ? Colors.black : Colors.white,
//                       size: 25,
//                     ),
//                     onPressed: () {
//                       newSetState(() {
//                         index++;
//                         print(index);
//                       });
//                     },
//                   );})  ),
//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24),
//                 child: Text(
//                   index.toString(),
//                   style: TextStyle(
//                       fontSize: 15, color: Colors.black.withOpacity(0.5)),
//                 ),
//               ),
//             ],
//           ),
      
//       ),
//     );
//   }
// }
