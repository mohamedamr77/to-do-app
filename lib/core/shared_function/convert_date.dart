import 'package:intl/intl.dart';

// ignore: non_constant_identifier_names
String ConvertDate({required String date}) {
  String dateFormat = DateFormat('dd MMM, y').format(DateTime.parse(date));
  return dateFormat;
}
