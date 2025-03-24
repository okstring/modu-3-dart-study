import 'package:intl/intl.dart';

void main() {
  final now = DateTime.now();

  print(now.toString());
  print(now.toIso8601String());
  print(now.toUtc());
  print(now.toLocal());

  String formattedDateTimeString = DateFormat('yy-MM-dd').format(now);
  print(formattedDateTimeString);

  DateTime birthDay = DateTime.parse('2024-01-01');
  print(birthDay);
}