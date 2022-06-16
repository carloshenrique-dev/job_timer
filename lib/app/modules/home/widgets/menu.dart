import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/entities/project_status.dart';
import 'package:job_timer/app/modules/home/controller/home_controller.dart';

class Menu extends SliverPersistentHeaderDelegate {
  final HomeController controller;

  Menu(this.controller);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return LayoutBuilder(builder: ((context, constraints) {
      return Container(
        padding: const EdgeInsets.all(10),
        height: constraints.maxHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: constraints.maxWidth * .45,
              child: DropdownButtonFormField<ProjectStatus>(
                value: ProjectStatus.emAndamento,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(7),
                  isCollapsed: true,
                  hintText: 'Selecione',
                ),
                items: ProjectStatus.values
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(e.label),
                      ),
                    )
                    .toList(),
                onChanged: (status) {
                  if (status != null) {
                    controller.filter(status);
                  }
                },
              ),
            ),
            SizedBox(
              width: constraints.maxWidth * .45,
              child: ElevatedButton.icon(
                onPressed: () async {
                  await Modular.to.pushNamed('/project/register/');
                  controller.loadProjects();
                },
                icon: const Icon(Icons.add),
                label: const Text('Novo projeto'),
              ),
            )
          ],
        ),
      );
    }));
  }

  @override
  double get maxExtent => 80;

  @override
  double get minExtent => 80;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
