import 'dart:math';

class IdServices {
  static const String symbols = "qwertyuiopasdfghjklzxcvbnm1234567890";
  static final Random random = Random();

  static String now() {
    String string = "";
    final DateTime now = DateTime.now();
    string += "${now.year}${now.month}${now.day}${now.hour}";
    string += "${now.minute}${now.second}${now.millisecond}${now.microsecond}";
    return string;
  }

  static String shortID() {
    String string = "";
    for (int i = 0; i < 8; i++) {
      string += symbols[random.nextInt(symbols.length)];
    }
    string += now();
    return string;
  }

  static String longID() {
    String string = "";
    for (int i = 0; i < 16; i++) {
      string += symbols[random.nextInt(symbols.length)];
    }
    string += now();
    return string;
  }
}
