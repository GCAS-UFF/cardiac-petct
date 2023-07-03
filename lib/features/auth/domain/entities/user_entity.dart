import 'package:cardiac_petct/features/exam_settings/domain/entities/exam_settings_entity.dart';

class UserEntity {
  final String? id;
  final String name;
  final String email;
  final DateTime birthdate;
  final String gender;
  final ExamSettingsEntity? examSettings;
  UserEntity({
    this.id,
    this.examSettings,
    required this.name,
    required this.email,
    required this.birthdate,
    required this.gender,
  });
}
