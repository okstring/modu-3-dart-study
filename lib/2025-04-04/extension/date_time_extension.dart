

import 'package:intl/intl.dart';

extension DateTimeExtension on String? {
  DateTime? toDateTime() {
    return DateFormat('yyyy/MM/dd HH:mm:ss').tryParse(this ?? '');
  }
}