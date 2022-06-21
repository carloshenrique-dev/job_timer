import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/modules/project/detail/controller/project_detail_controller.dart';
import 'package:job_timer/app/view_models/project_view_model.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';
import 'project_detail_page.dart';

class ProjectDetailModule extends Module {
  @override
  List<Bind> get binds => [
        BlocBind.lazySingleton(
            (i) => ProjectDetailController(projectService: i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: ((context, args) {
          final ProjectViewModel projectViewModel = args.data;
          return ProjectDetailPage(
              controller: Modular.get()..setProject(projectViewModel));
        }))
      ];
}
