import 'package:flutter_modular/flutter_modular.dart';

import 'project_detail_page.dart';

class ProjectDetailModule extends Module {
  @override
  List<ModularRoute> get routes =>
      [ChildRoute('/', child: ((context, args) => const ProjectDetailPage()))];
}
