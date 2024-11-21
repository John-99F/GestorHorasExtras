import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:gestor_horas_extras/core/utils/date_and_hours_utils.dart';

void main() {
  group('Test utils date and hours', () {
    test('calculate differents between hours', () {
      int diferencia = DateAndHoursUtils.calcularDiferenciaHoras("01:00 pm", "08:00 pm");
      expect(diferencia, 7);
    });

    test('get Month by int', () {
      String month = DateAndHoursUtils.getMonthToString(11);
      expect(month.toLowerCase(), "noviembre");
    });

    test('get month by String', () {
      int month = DateAndHoursUtils.getMonth("2024/10 /11");
      expect(month, 10);
    });
  });


}