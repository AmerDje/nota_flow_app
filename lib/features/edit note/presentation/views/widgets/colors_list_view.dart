import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota_flow_app/features/edit%20note/presentation/views/widgets/color_item.dart';
import 'package:nota_flow_app/features/home/presentation/cubit/notes_cubit.dart';

class ColorsListView extends StatefulWidget {
  const ColorsListView({super.key});

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  final List<Color> colors = [
    const Color.fromARGB(255, 255, 17, 0),
    const Color.fromARGB(255, 255, 94, 0),
    const Color.fromARGB(255, 255, 174, 0),
    const Color.fromARGB(255, 208, 255, 0),
    const Color.fromARGB(255, 51, 255, 0),
    const Color.fromARGB(255, 0, 255, 115),
    const Color.fromARGB(255, 0, 255, 221),
    const Color.fromARGB(255, 0, 110, 255),
    const Color.fromARGB(255, 17, 0, 255),
    const Color.fromARGB(255, 140, 0, 255),
    const Color.fromARGB(255, 255, 0, 242),
  ];
  bool? isSelected = false;
  int? currentIndex;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: colors.length,
          itemBuilder: (context, index) {
            return InkWell(
              borderRadius: BorderRadius.circular(30),
              onTap: () {
                currentIndex = index;
                BlocProvider.of<NotesCubit>(context).noteColor =
                    colors[currentIndex!];
                setState(() {});
              },
              child: ColorItem(
                isSelected: currentIndex == index,
                color: colors[index],
              ),
            );
          }),
    );
  }
}
