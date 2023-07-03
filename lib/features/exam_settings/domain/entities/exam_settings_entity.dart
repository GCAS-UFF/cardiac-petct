class ExameSettingsEntity {
  final DateTime examDateTime;
  final String examAddress;
  final DateTime breakfastsHour;
  final DateTime morningSnacksHour;
  final DateTime lunchsHour;
  final DateTime afternoonSnacksHour;
  final DateTime dinnersHour;
  final DateTime suppersHour;

  ExameSettingsEntity({
    required this.examDateTime,
    required this.examAddress,
    required this.breakfastsHour,
    required this.morningSnacksHour,
    required this.lunchsHour,
    required this.afternoonSnacksHour,
    required this.dinnersHour,
    required this.suppersHour,
  });
}
