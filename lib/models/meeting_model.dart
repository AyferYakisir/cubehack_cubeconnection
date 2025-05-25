class MeetingModel {
  final String company;
  final String date;
  final String table;
  final String status;
  bool isFavorite;

  MeetingModel({
    required this.company,
    required this.date,
    required this.table,
    required this.status,
    this.isFavorite = false,
  });
}
