import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/core/ui/themes/job_timer_icons.dart';
import 'package:job_timer/app/view_models/project_view_model.dart';

class ProjectTile extends StatelessWidget {
  final ProjectViewModel projectViewModel;
  const ProjectTile({super.key, required this.projectViewModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxHeight: 90,
      ),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey[300]!,
          width: 2,
        ),
      ),
      child: Column(
        children: [
          _ProjectName(projectViewModel: projectViewModel),
          Expanded(
            child: _ProjectProgress(projectViewModel: projectViewModel),
          ),
        ],
      ),
    );
  }
}

class _ProjectName extends StatelessWidget {
  final ProjectViewModel projectViewModel;
  const _ProjectName({required this.projectViewModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          Modular.to.pushNamed('/project/detail/', arguments: projectViewModel),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(projectViewModel.name),
            Icon(
              JobTimerIcons.angleDoubleRight,
              color: Theme.of(context).primaryColor,
              size: 20,
            )
          ],
        ),
      ),
    );
  }
}

class _ProjectProgress extends StatelessWidget {
  final ProjectViewModel projectViewModel;
  const _ProjectProgress({required this.projectViewModel});

  @override
  Widget build(BuildContext context) {
    final totalTasks = projectViewModel.tasks.fold<int>(
        0, ((previousValue, task) => previousValue += task.duration));

    double percent = 0.0;

    if (totalTasks > 0) {
      percent = totalTasks / projectViewModel.estimate;
    }

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Expanded(
            child: LinearProgressIndicator(
              value: percent,
              backgroundColor: Colors.grey[400],
              color: Theme.of(context).primaryColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text('${projectViewModel.estimate} hrs'),
          ),
        ],
      ),
    );
  }
}
