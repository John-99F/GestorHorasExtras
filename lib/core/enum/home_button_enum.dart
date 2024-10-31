import 'package:gestor_horas_extras/core/enum/profile_enum.dart';
import 'package:gestor_horas_extras/core/utils/constants.dart';
import 'package:gestor_horas_extras/core_ui/images/images_constants.dart';
import 'package:gestor_horas_extras/feature/report/presentation/screen/report_screen.dart';
import 'package:gestor_horas_extras/feature/statistics/presentation/screen/statistics_screen.dart';

enum HomeButtonEnum {
  report(
    title: Constants.reportTitle,
    pathImage: ImagesConstants.reportIcon,
    userActive: [ProfileEnum.admin, ProfileEnum.dev, ProfileEnum.supervisor],
    linkNavigation: ReportScreen.link,
  ),
  statistics(
    title: Constants.statisticsTitle,
    pathImage: ImagesConstants.stadisticIcon,
    userActive: [ProfileEnum.admin, ProfileEnum.dev, ProfileEnum.supervisor],
    linkNavigation: StatisticsScreen.link,
  ),
  support(
    title: Constants.supportTitle,
    pathImage: ImagesConstants.supportIcon,
    userActive: [ProfileEnum.admin, ProfileEnum.dev, ProfileEnum.supervisor],
    linkNavigation: ReportScreen.link,
  );

  final String title;
  final String pathImage;
  final List<ProfileEnum> userActive;
  final String linkNavigation;

  const HomeButtonEnum({
    required this.title,
    required this.pathImage,
    required this.userActive,
    required this.linkNavigation,
  });
}
