import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/entities/project_status.dart';
import 'package:job_timer/app/modules/project/detail/controller/project_detail_controller.dart';
import 'package:job_timer/app/view_models/project_view_model.dart';

class ProjectDetailAppBar extends SliverAppBar {
  final ProjectViewModel model;
  ProjectDetailAppBar({super.key, required this.model})
      : super(
          expandedHeight: 70,
          pinned: true,
          toolbarHeight: 70,
          title: Text(model.name),
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
                      Text('${model.tasks.length} tasks'),
                      Visibility(
                        visible: model.status != ProjectStatus.finalizado,
                        replacement: const Text('Projeto finalizado'),
                        child: _NewTasks(projectViewModel: model),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
}

class _NewTasks extends StatelessWidget {
  final ProjectViewModel projectViewModel;

  const _NewTasks({required this.projectViewModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await Modular.to
            .pushNamed('/project/task/', arguments: projectViewModel);
        Modular.get<ProjectDetailController>().updateProject();
      },
      child: Row(
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
      ),
    );
  }
}
