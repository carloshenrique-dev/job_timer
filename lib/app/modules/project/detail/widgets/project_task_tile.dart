import 'package:flutter/material.dart';
import 'package:job_timer/app/view_models/project_task_view_model.dart';

class ProjectTaskTile extends StatelessWidget {
  final ProjectTaskViewModel model;
  const ProjectTaskTile({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(model.name),
          RichText(
            text: TextSpan(children: [
              const TextSpan(
                  text: 'Duração',
                  style: TextStyle(
                    color: Colors.grey,
                  )),
              const TextSpan(text: '    '),
              TextSpan(
                  text: '${model.duration} hrs',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black)),
            ]),
          ),
        ],
      ),
    );
  }
}
