import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:job_timer/app/services/projects/project_service.dart';
import 'package:job_timer/app/view_models/project_view_model.dart';
part 'project_details_state.dart';

class ProjectDetailController extends Cubit<ProjectDetailState> {
  final ProjectService _projectService;

  ProjectDetailController({required ProjectService projectService})
      : _projectService = projectService,
        super(const ProjectDetailState.initial());

  void setProject(ProjectViewModel projectViewModel) {
    emit(state.copyWith(
        projectViewModel: projectViewModel,
        status: ProjectDetailStatus.complete));
  }

  void updateProject() async {
    final project = await _projectService.findById(state.projectViewModel!.id!);
    emit(state.copyWith(
        projectViewModel: project, status: ProjectDetailStatus.complete));
  }

  Future<void> finishProject() async {
    try {
      emit(state.copyWith(status: ProjectDetailStatus.loading));
      final projectId = state.projectViewModel!.id!;
      await _projectService.finish(projectId);
      updateProject();
    } catch (e, s) {
      log('erro ao finalizar o projeto', error: e, stackTrace: s);
      emit(state.copyWith(status: ProjectDetailStatus.failure));
    }
  }
}
