

import 'package:intl/intl.dart';

extension DateTimeExtension on String? {
  DateTime? toDateTime({required String format}) {
    return DateFormat(format).tryParse(this ?? '');
  }
}