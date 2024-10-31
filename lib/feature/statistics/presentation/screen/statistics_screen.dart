import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gestor_horas_extras/core_ui/widgets/shared/custom_bar_chart.dart';
import 'package:gestor_horas_extras/core_ui/widgets/shared/custom_pie_chart.dart';
import 'package:gestor_horas_extras/core_ui/widgets/shared/widgets.dart';

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
          _buildBody(),
        ],
      )),
    );
  }

  _buildBody() {
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
          _buildContainerCharts(),
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

  _buildContainerCharts() {
    return Row(
      children: [
        SizedBox(
          width: 200.w,
        ),
        _buildBarChart(),
        SizedBox(
          width: 30.w,
        ),
        _buildPieChart(),
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
            _buildCardInfo(),
          ],
        )
      ],
    );
  }

  _buildBarChart() {
    return SizedBox(
      width: 700.w,
      height: 500.h,
      child: const Card(
        color: Color(0x001E4B74),
        child: CustomBarChart(),
      ),
    );
  }

  _buildPieChart() {
    return SizedBox(
      width: 600.w,
      height: 500.h,
      child: const Card(
        color: Color(0x001E4B74),
        child: CustomPieChart(),
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

  _buildCardInfo() {
    return SizedBox(
      width: 300.w,
      height: 150.h,
      child: const Card(
        color: Color(0x001E4B74),
        child: Text(
          "Cantidad de horas trabajas en este mes(Octubre): \n 80 horas",
          style: TextStyle(
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
