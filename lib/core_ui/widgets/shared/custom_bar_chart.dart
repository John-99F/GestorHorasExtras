import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gestor_horas_extras/core/utils/date_and_hours_utils.dart';
import 'package:gestor_horas_extras/feature/statistics/domain/params/statistics.dart';

class _BarChart extends StatelessWidget {
  final List<StatisticsParams> listStaticsParams;

  _BarChart({
    required this.listStaticsParams,
  });

  int contador = 0;

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        barTouchData: barTouchData,
        titlesData: titlesData,
        borderData: borderData,
        barGroups: barGroups,
        gridData: const FlGridData(show: false),
        alignment: BarChartAlignment.spaceAround,
        maxY: _getAllHours(),
      ),
    );
  }


double _getAllHours() {
  int count = 0; 
  listStaticsParams.forEach((element) {
    if (element.countData > count) {
    count = element.countData;
    }
  });
  return count + 5;
  }

  BarTouchData get barTouchData => BarTouchData(
        enabled: false,
        touchTooltipData: BarTouchTooltipData(
          getTooltipColor: (group) => Colors.transparent,
          tooltipPadding: EdgeInsets.zero,
          tooltipMargin: 8,
          getTooltipItem: (
            BarChartGroupData group,
            int groupIndex,
            BarChartRodData rod,
            int rodIndex,
          ) {
            return BarTooltipItem(
              rod.toY.round().toString(),
              const TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      );

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.blue,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    List<int> listMonth = [];

    listStaticsParams.forEach((value) {
      listMonth.add(value.month);
    });


    Widget title = Text( listMonth.isNotEmpty ? DateAndHoursUtils.getMonthToString(listMonth[contador]) : "",
        style: style);
    contador++;

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 2,
      child: title,
    );
  }

  FlTitlesData get titlesData => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 35,
            getTitlesWidget: getTitles,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      );

  FlBorderData get borderData => FlBorderData(
        show: false,
      );

  LinearGradient get _barsGradient => const LinearGradient(
        colors: [
          Colors.blue,
          Colors.blueGrey,
        ],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      );

  List<BarChartGroupData> get barGroups => _generateBarGroups();

  List<BarChartGroupData> _generateBarGroups() {
    return listStaticsParams.asMap().entries.map((statics) {
      int x = listStaticsParams.indexOf(statics.value);
      int toY = statics.value.countData;

      return BarChartGroupData(
        x: x,
        barRods: [
          BarChartRodData(
            toY: toY.toDouble(),
            gradient: _barsGradient,
          ),
        ],
        showingTooltipIndicators: [0],
      );
    }).toList();
  }
}

class CustomBarChart extends StatefulWidget {
  final List<StatisticsParams> listStaticsParams;

  const CustomBarChart({super.key, required this.listStaticsParams});

  @override
  State<StatefulWidget> createState() => CustomBarChartState();
}

class CustomBarChartState extends State<CustomBarChart> {
  int contador = 0;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.6,
      child: _BarChart(
        listStaticsParams: widget.listStaticsParams,
      ),
    );
  }
}
