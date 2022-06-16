part of 'home_controller.dart';

enum HomeStatus {
  initial,
  loading,
  completed,
  failure;
}

class HomeState extends Equatable {
  final List<ProjectViewModel> projects;
  final HomeStatus status;
  final ProjectStatus projectFilter;

  const HomeState._({
    required this.projectFilter,
    required this.status,
    required this.projects,
  });

  HomeState.initial()
      : this._(
            projectFilter: ProjectStatus.emAndamento,
            status: HomeStatus.initial,
            projects: []);

  @override
  List<Object?> get props => [projectFilter, projects, status];

  HomeState copyWith({
    List<ProjectViewModel>? projects,
    HomeStatus? status,
    ProjectStatus? projectFilter,
  }) {
    return HomeState._(
      projects: projects ?? this.projects,
      status: status ?? this.status,
      projectFilter: projectFilter ?? this.projectFilter,
    );
  }
}
