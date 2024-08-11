import 'package:intl/intl.dart';

class MyHelpers {
  static convertFormatNumber(num value) {
    final formatCurrency = NumberFormat("#,###.0##", "en_US");
    if (value == 0) {
      return "0";
    }
    return formatCurrency.format(value).toString();
  }
}