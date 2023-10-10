import 'package:flutter/material.dart';

class NotesSearchField extends StatefulWidget {
  const NotesSearchField(
      {super.key,
      required this.onPressed,
      required this.onChanged,
      required this.controller});
  final void Function() onPressed;
  final void Function(String) onChanged;
  final TextEditingController controller;
  @override
  State<NotesSearchField> createState() => _NotesSearchFieldState();
}

class _NotesSearchFieldState extends State<NotesSearchField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: MediaQuery.sizeOf(context).width,
      child: Center(
        child: TextField(
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
          controller: widget.controller,
          onChanged: widget.onChanged,
          decoration: InputDecoration(
            hintText: 'Search Notes',
            prefixIcon: const Icon(Icons.search),
            suffixIcon: IconButton(
                splashRadius: 25,
                padding: EdgeInsets.zero,
                onPressed: widget.onPressed,
                icon: const Icon(Icons.close)),
          ),
        ),
      ),
    );
  }
}
