import 'package:flutter/material.dart';
import 'package:job_timer/app/core/ui/themes/job_timer_icons.dart';
import 'package:job_timer/app/modules/project/detail/widgets/project_detail_app_bar.dart';
import 'package:job_timer/app/modules/project/detail/widgets/project_detail_chart.dart';

import 'widgets/project_task_tile.dart';

class ProjectDetailPage extends StatelessWidget {
  const ProjectDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          ProjectDetailAppBar(),
          SliverList(
            delegate: SliverChildListDelegate([
              const Padding(
                padding: EdgeInsets.only(top: 50, bottom: 50),
                child: ProjectDetailChart(),
              ),
              const ProjectTaskTile(),
              const ProjectTaskTile(),
            ]),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(JobTimerIcons.okCircled),
                  label: const Text('Finalizar projeto'),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
