import 'package:flutter/material.dart';

class ProjectDetailAppBar extends SliverAppBar {
  ProjectDetailAppBar({super.key})
      : super(
          expandedHeight: 70,
          pinned: true,
          toolbarHeight: 70,
          title: const Text('Projeto'),
          centerTitle: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(15),
            ),
          ),
          flexibleSpace: Align(
            alignment: const Alignment(0, 2.3),
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Material(
                borderRadius: BorderRadius.circular(10),
                elevation: 4,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  height: 48,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Tasks'),
                      _NewTasks(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
}

class _NewTasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Theme.of(context).primaryColor,
            child: const Icon(
              Icons.add,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
        const Text('Adicionar task'),
      ],
    );
  }
}
