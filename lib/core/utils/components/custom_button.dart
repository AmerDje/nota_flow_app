import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    this.isLoading = false,
  });
  final void Function()? onPressed;
  final bool? isLoading;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: MediaQuery.sizeOf(context).width,
      child: ElevatedButton(
          onPressed: onPressed,
          child: isLoading == false
              ? const Text("Add Note")
              : const CircularProgressIndicator(
                  strokeWidth: 2.0,
                  color: Colors.white,
                )),
    );
  }
}
