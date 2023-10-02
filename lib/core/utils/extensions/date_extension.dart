import 'package:intl/intl.dart';

extension DateExtension on DateTime {
  String formatDate() {
    String date = DateFormat('MMMM dd, yyyy').format(this);
    return date;
  }
}
