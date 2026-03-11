import 'dart:developer';

import 'package:flutter/foundation.dart';

class AppLogger {
  static appPrint(message) {
    if (kDebugMode) {
      debugPrint("🚀[PRINT] [FEELING BLESSED] => $message");
    }
  }

  static appLog(message) {
    if (kDebugMode) {
      log("🚀[LOG] [FEELING BLESSED] => $message");
    }
  }
}
