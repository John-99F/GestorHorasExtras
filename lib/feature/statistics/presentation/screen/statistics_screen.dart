import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gestor_horas_extras/core/utils/date_and_hours_utils.dart';
import 'package:gestor_horas_extras/core/utils/firestore_utils.dart';
import 'package:gestor_horas_extras/core_ui/widgets/shared/custom_bar_chart.dart';
import 'package:gestor_horas_extras/core_ui/widgets/shared/custom_pie_chart.dart';
import 'package:gestor_horas_extras/core_ui/widgets/shared/widgets.dart';
import 'package:gestor_horas_extras/feature/statistics/domain/params/statistics.dart';
import 'package:gestor_horas_extras/feature/statistics/presentation/provider/count_hours_provider.dart';
import 'package:gestor_horas_extras/feature/statistics/presentation/provider/statistics_day_provider.dart';
import 'package:gestor_horas_extras/feature/statistics/presentation/provider/statistics_provider.dart';

class StatisticsScreen extends ConsumerWidget {
  static const String name = "StatisticsScreen";
  static const String link = "/$name";

  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          const CustomBackground(),
          _buildBody(ref),
        ],
      )),
    );
  }

  _buildBody(WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 80.h,
          ),
          _buildTitle(),
          SizedBox(
            height: 80.h,
          ),
          _buildContainerCharts(ref),
        ],
      ),
    );
  }

  _buildTitle() {
    return const Text(
      "Estadisticas",
      style: TextStyle(fontSize: 70, color: Colors.blueAccent),
    );
  }

  _buildContainerCharts(WidgetRef ref) {
    final listStatics = ref.watch(statisticsProvider);
    final listDay = ref.watch(statisticsDaysProvider);
    final ListHourMonth = ref.watch(countHourProvider);
    return Row(
      children: [
        SizedBox(
          width: 200.w,
        ),
        listStatics.when(
          data: (data) {
            return _buildBarChart(data);
          },
          loading: () => const CircularProgressIndicator(),
          error: (error, stackTrace) => Text('Error: $error'),
        ),
        SizedBox(
          width: 30.w,
        ),
        listDay.when(
          data: (data) {
            return _buildPieChart(data);
          },
          loading: () => const CircularProgressIndicator(),
          error: (error, stackTrace) => Text('Error: $error'),
        ),
        SizedBox(
          width: 10.w,
        ),
        Column(
          children: [
            _buildButton("Generar reporte", () {}),
            SizedBox(
              height: 50.h,
            ),
            _buildButton("Visualizar reporte", () {}),
            SizedBox(
              height: 50.h,
            ),
            ListHourMonth.when(
              data: (data) {
                return _buildCardInfo(data);
              },
              loading: () => const CircularProgressIndicator(),
              error: (error, stackTrace) => Text('Error: $error'),
            ),
          ],
        )
      ],
    );
  }

  _buildBarChart(List<StatisticsParams> listStaticsParams) {
    print("Entre aqui");
    return listStaticsParams.isNotEmpty
        ? SizedBox(
            width: 700.w,
            height: 500.h,
            child: Card(
              color: const Color(0x001E4B74),
              child: CustomBarChart(
                listStaticsParams: listStaticsParams,
              ),
            ),
          )
        : _buildEmpty();
  }

  _buildPieChart(List<StatisticsParams> listStaticsParams) {
    return listStaticsParams.isNotEmpty
        ? SizedBox(
            width: 600.w,
            height: 500.h,
            child: Card(
              color: const Color(0x001E4B74),
              child: CustomPieChart(
                listStaticsParams: listStaticsParams,
              ),
            ),
          )
        : _buildEmpty();
  }

  _buildEmpty() {
    return SizedBox(
      width: 600.w,
      height: 500.h,
      child: const Card(
        color: Color(0x001E4B74),
        child: Center(
          child: Text(
            "En estos momentos no tenemos graficas para mostrar\n realiza tu primer reporte ",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  _buildButton(String name, VoidCallback onTap) {
    return CustomButton(
        buttonName: name,
        colorTextButton: Colors.white,
        backgroundColor: const Color(0x001E4B74),
        onTap: onTap);
  }

  _buildCardInfo(List<StatisticsParams> listStaticsParams) {
    return listStaticsParams.isNotEmpty ?  SizedBox(
      width: 300.w,
      height: 150.h,
      child:  Card(
        color: const Color(0x001E4B74),
        child: Text(
          "Cantidad de horas trabajas en este mes(${DateAndHoursUtils.getMonthToString(listStaticsParams[0].month)}): \n ${listStaticsParams[0].countData} horas",
          style:  const TextStyle(
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    ): const SizedBox();
  }
}
