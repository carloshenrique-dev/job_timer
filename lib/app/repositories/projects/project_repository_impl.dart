import 'dart:developer';
import 'package:isar/isar.dart';
import 'package:job_timer/app/core/database/database.dart';
import 'package:job_timer/app/core/exceptions/failure_exception.dart';
import 'package:job_timer/app/entities/project.dart';
import 'package:job_timer/app/entities/project_status.dart';
import 'package:job_timer/app/entities/project_task.dart';
import './project_repository.dart';

class ProjectRepositoryImpl implements ProjectRepository {
  final Database _database;

  ProjectRepositoryImpl({required Database database}) : _database = database;

  @override
  Future<void> register(Project project) async {
    try {
      final connection = await _database.openConection();

      await connection.writeTxn((isar) {
        return isar.projects.put(project);
      });
    } on IsarError catch (e, s) {
      log('erro ao cadastrar projeto', error: e, stackTrace: s);
      throw FailureException(message: 'Erro ao cadastrar o projeto');
    }
  }

  @override
  Future<List<Project>> findByStatus(ProjectStatus status) async {
    try {
      final connection = await _database.openConection();
      return connection.projects.filter().statusEqualTo(status).findAll();
    } on IsarError catch (e, s) {
      log('erro ao buscar os projetos', error: e, stackTrace: s);
      throw FailureException(message: 'Erro ao buscar os projetos');
    }
  }

  @override
  Future<Project> addTask(int id, ProjectTask task) async {
    try {
      final connection = await _database.openConection();
      final project = await findById(id);
      project.tasks.add(task);
      await connection.writeTxn(((isar) => project.tasks.save()));
      return project;
    } on IsarError catch (e, s) {
      log('erro ao adicionar a task', error: e, stackTrace: s);
      throw FailureException(message: 'erro ao adicionar a task');
    }
  }

  @override
  Future<Project> findById(int id) async {
    try {
      final connection = await _database.openConection();
      final project = await connection.projects.get(id);
      if (project == null) {
        throw FailureException(message: 'Projeto não encontrado');
      }
      return project;
    } on IsarError catch (e, s) {
      log('erro ao buscar os projetos', error: e, stackTrace: s);
      throw FailureException(message: 'Erro ao buscar os projetos');
    }
  }

  @override
  Future<void> finish(int id) async {
    try {
      final connection = await _database.openConection();
      final project = await findById(id);
      project.status = ProjectStatus.finalizado;
      await connection.writeTxn(
          (isar) => connection.projects.put(project, saveLinks: true));
    } on IsarError catch (e, s) {
      log('erro ao buscar os projetos', error: e, stackTrace: s);
      throw FailureException(message: 'Erro ao buscar os projetos');
    }
  }
}
