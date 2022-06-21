part of 'task_controller.dart';

enum TaskStatus { initial, loading, success, failure }

class TaskState extends Equatable {
  final TaskStatus status;
  final ProjectViewModel? projectViewModel;

  const TaskState._({
    required this.status,
    this.projectViewModel,
  });

  const TaskState.initial() : this._(status: TaskStatus.initial);

  TaskState copyWith({
    TaskStatus? status,
    ProjectViewModel? projectViewModel,
  }) {
    return TaskState._(
      status: status ?? this.status,
      projectViewModel: projectViewModel ?? this.projectViewModel,
    );
  }

  @override
  List<Object?> get props => [status, projectViewModel];
}
