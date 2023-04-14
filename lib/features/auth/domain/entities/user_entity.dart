class UserEntity {
  final String? id;
  final String name;
  final String email;
  final DateTime birthdate;
  final String gender;
  final bool anamnesisForm;

  UserEntity({
    this.id,
    required this.name,
    required this.email,
    required this.birthdate,
    required this.gender,
    required this.anamnesisForm,
  });
}
