import 'package:gestor_horas_extras/core/utils/date_and_hours_utils.dart';
import 'package:gestor_horas_extras/core/utils/firestore_utils.dart';
import 'package:gestor_horas_extras/core/utils/preferences_utils.dart';
import 'package:gestor_horas_extras/feature/statistics/domain/params/report.dart';
import 'package:gestor_horas_extras/feature/statistics/domain/params/statistics.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_all_report_provider.g.dart';

final PreferencesUtils _preferencesUtils = PreferencesUtils.instance;

@riverpod
Future<List<Report>> getAllReport(GetAllReportRef ref) async {
  String cedula = await _preferencesUtils.getDocumentNumber();
  List<Report> listReport = await FirestoreUtils.getReportByUser(cedula) ?? [];
 List<Report> countHourByDay = [];
 if (listReport.isNotEmpty) {
    listReport.forEach((report) {
      int month = DateAndHoursUtils.getMonth(report.dia);
      if (month == DateTime.now().month) {
        countHourByDay.add(report);
      }
    });

    return countHourByDay;
  }

  return [];
}