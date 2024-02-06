import 'package:intl/intl.dart';

extension Price on int {
  String convertToPrice() {
    final formatter = NumberFormat("#,##0", "en_US");
    return formatter.format(this);
  }
}
