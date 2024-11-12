import 'package:flutter/foundation.dart';

class PrintUtils {
  static print(String message) {
    if (kDebugMode) {
      print(message);
    }
  }
}
