
import 'package:flutter/foundation.dart' show kIsWeb;


class PlatformUtils {
    static bool isAndroid() {
      if (kIsWeb) {
        return false;
      } 
       return true;
    }
}