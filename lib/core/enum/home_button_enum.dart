import 'package:gestor_horas_extras/core/enum/profile_enum.dart';
import 'package:gestor_horas_extras/core/utils/constants.dart';
import 'package:gestor_horas_extras/core_ui/images/images_constants.dart';
import 'package:gestor_horas_extras/feature/report/presentation/screen/report_screen.dart';
import 'package:gestor_horas_extras/feature/rules/presentation/screen/rules_screen.dart';
import 'package:gestor_horas_extras/feature/statistics/presentation/screen/statistics_screen.dart';
import 'package:gestor_horas_extras/feature/support/presentation/screen/support_screen.dart';
import 'package:gestor_horas_extras/feature/users/presentation/screen/user_screen.dart';

enum HomeButtonEnum {
  report(
    title: Constants.reportTitle,
    pathImage: ImagesConstants.reportIcon,
    userActive: [1, 2, 3],
    linkNavigation: ReportScreen.link,
  ),
  statistics(
    title: Constants.statisticsTitle,
    pathImage: ImagesConstants.stadisticIcon,
    userActive: [1, 2, 3],
    linkNavigation: StatisticsScreen.link,
  ),
  generateAllReport(
    title: Constants.generateAllReport,
    pathImage: ImagesConstants.stadisticIcon,
    userActive: [1,],
    linkNavigation: "",
  ),
  support(
    title: Constants.supportTitle,
    pathImage: ImagesConstants.supportIcon,
    userActive: [1, 2, 3],
    linkNavigation: SupportScreen.link,
  ),
  users(
    title: "Usuarios",
    pathImage: ImagesConstants.reportIcon,
    userActive: [1],
    linkNavigation: UserScreen.link,
  ),
  rules(
    title: "Reglas",
    pathImage: ImagesConstants.supportIcon,
    userActive: [1],
    linkNavigation: RulesScreen.link,
  );

  final String title;
  final String pathImage;
  final List<int> userActive;
  final String linkNavigation;

  const HomeButtonEnum({
    required this.title,
    required this.pathImage,
    required this.userActive,
    required this.linkNavigation,
  });
}
