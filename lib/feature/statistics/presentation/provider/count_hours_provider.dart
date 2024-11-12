import 'package:gestor_horas_extras/core/utils/date_and_hours_utils.dart';
import 'package:gestor_horas_extras/core/utils/firestore_utils.dart';
import 'package:gestor_horas_extras/core/utils/preferences_utils.dart';
import 'package:gestor_horas_extras/feature/statistics/domain/params/report.dart';
import 'package:gestor_horas_extras/feature/statistics/domain/params/statistics.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'count_hours_provider.g.dart';

final PreferencesUtils _preferencesUtils = PreferencesUtils.instance;

@riverpod
Future<List<StatisticsParams>> countHour(CountHourRef ref) async {
  String cedula = await _preferencesUtils.getDocumentNumber();
  List<Report> listReport = await FirestoreUtils.getReportByUser(cedula) ?? [];
 Map<int, int> reportesPorDay = {};
  int contador = 0;
  if (listReport.isNotEmpty) {
    listReport.forEach((report) {

      int month = DateAndHoursUtils.getMonth(report.dia);
      if (month == DateTime.now().month) {
           contador = DateAndHoursUtils.calcularDiferenciaHoras(
          report.horaInicio, report.horaFinal);
      reportesPorDay[month] = reportesPorDay[month] != null
          ? reportesPorDay[month]! + contador
          : contador;
      }
    });

    List<StatisticsParams> countHourByDay = reportesPorDay.entries.map((entry) {
      return StatisticsParams(month: entry.key, countData: entry.value);
    }).toList();

    return countHourByDay;
  }

  return [];
}
