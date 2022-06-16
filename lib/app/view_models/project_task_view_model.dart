import 'package:job_timer/app/entities/project_task.dart';

class ProjectTaskViewModel {
  int? id;
  String name;
  int duration;

  ProjectTaskViewModel({
    this.id,
    required this.name,
    required this.duration,
  });

  factory ProjectTaskViewModel.fromEntity(ProjectTask task) {
    return ProjectTaskViewModel(
      name: task.name,
      duration: task.duration,
      id: task.id,
    );
  }
}
