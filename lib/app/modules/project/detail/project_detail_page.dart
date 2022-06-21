import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_timer/app/core/ui/themes/job_timer_icons.dart';
import 'package:job_timer/app/entities/project_status.dart';
import 'package:job_timer/app/modules/project/detail/controller/project_detail_controller.dart';
import 'package:job_timer/app/modules/project/detail/widgets/project_detail_app_bar.dart';
import 'package:job_timer/app/modules/project/detail/widgets/project_detail_chart.dart';
import 'package:job_timer/app/view_models/project_view_model.dart';
import 'widgets/project_task_tile.dart';

class ProjectDetailPage extends StatelessWidget {
  final ProjectDetailController controller;
  const ProjectDetailPage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ProjectDetailController, ProjectDetailState>(
        bloc: controller,
        listener: (context, state) {
          if (state.status == ProjectDetailStatus.failure) {
            AsukaSnackbar.alert('Erro interno').show();
          }
        },
        builder: (context, state) {
          final projectViewModel = state.projectViewModel;

          switch (state.status) {
            case ProjectDetailStatus.initial:
              return const Center(
                child: Text('Carregando projetos...'),
              );
            case ProjectDetailStatus.loading:
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            case ProjectDetailStatus.complete:
              return _buildScreen(context, projectViewModel!);
            case ProjectDetailStatus.failure:
              if (projectViewModel != null) {
                return _buildScreen(context, projectViewModel);
              }
              return const Center(
                child: Text('Erro ao carregar projeto'),
              );
          }
        },
      ),
    );
  }

  Widget _buildScreen(BuildContext context, ProjectViewModel projectViewModel) {
    final totalTask = projectViewModel.tasks.fold<int>(0, (totalValue, task) {
      return totalValue += task.duration;
    });
    return CustomScrollView(
      slivers: [
        ProjectDetailAppBar(model: projectViewModel),
        SliverList(
          delegate: SliverChildListDelegate([
            Padding(
              padding: const EdgeInsets.only(top: 50, bottom: 50),
              child: ProjectDetailChart(
                projectEstimate: projectViewModel.estimate,
                totalTask: totalTask,
              ),
            ),
            ...projectViewModel.tasks
                .map((task) => ProjectTaskTile(
                      model: task,
                    ))
                .toList()
          ]),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Visibility(
                visible: projectViewModel.status != ProjectStatus.finalizado,
                child: ElevatedButton.icon(
                  onPressed: () => controller.finishProject(),
                  icon: const Icon(JobTimerIcons.okCircled),
                  label: const Text('Finalizar projeto'),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
