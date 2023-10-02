import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset:
            false, //to fix the floating action button when the keyboard opened
        floatingActionButton: FloatingActionButton(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))),
          onPressed: () {
            showModalBottomSheet<void>(
                isScrollControlled:
                    true, // sets the bottom sheet to full height
                isDismissible: true, //to dismiss when hold and drag to button
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16))),
                context: context,
                builder: (BuildContext context) {
                  return const Scaffold();
                });
          },
          child: const Icon(Icons.add),
        ),
        body: const SafeArea(child: Scaffold()));
  }
}
