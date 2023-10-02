import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final int maxLines;
  final String text;
  final void Function(String?)? onSaved;

  final String? initialValue;
  final Icon? suffixIcon;
  final bool? readOnly;
  final VoidCallback? onTap;

  final String? Function(String?)? validator;
  const CustomTextField(
      {super.key,
      required this.text,
      this.maxLines = 1,
      this.onSaved,
      this.initialValue,
      this.suffixIcon,
      this.readOnly,
      this.onTap,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly ?? false,
      onTap: onTap,
      initialValue: initialValue,
      onSaved: onSaved,
      maxLines: maxLines,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      onEditingComplete: () {
        FocusScope.of(context).nextFocus();
      },
      validator: validator,
      decoration: InputDecoration(
          suffixIcon: suffixIcon,
          hintText: text,
          border: buildBorder(Colors.blue),
          enabledBorder: buildBorder()),
    );
  }

  OutlineInputBorder buildBorder([Color? color]) {
    return OutlineInputBorder(
        borderSide: BorderSide(color: color ?? Colors.white),
        borderRadius: BorderRadius.circular(8));
  }
}
