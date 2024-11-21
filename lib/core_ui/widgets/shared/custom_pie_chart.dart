import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gestor_horas_extras/core/utils/date_and_hours_utils.dart';
import 'package:gestor_horas_extras/feature/statistics/domain/params/statistics.dart';

class CustomPieChart extends StatefulWidget {
  final List<StatisticsParams> listStaticsParams;
  const CustomPieChart({super.key, required this.listStaticsParams});

  @override
  State<StatefulWidget> createState() =>
      CustomPieChartState();
}

class CustomPieChartState extends State<CustomPieChart> {
  final colors = [Colors.blue, Colors.yellow, Colors.purple, Colors.green, Colors.red, Colors.orange, Colors.pink];

  int touchedIndex = -1;
  @override
  Widget build(BuildContext context) {
    int contador = 0;

    return AspectRatio(
      aspectRatio: 1.3,
      child: Row(
        children: <Widget>[
          const SizedBox(
            height: 18,
          ),
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: PieChart(
                PieChartData(
                  pieTouchData: PieTouchData(
                    touchCallback: (FlTouchEvent event, pieTouchResponse) {
                      setState(() {
                        if (!event.isInterestedForInteractions ||
                            pieTouchResponse == null ||
                            pieTouchResponse.touchedSection == null) {
                          touchedIndex = -1;
                          return;
                        }
                        touchedIndex = pieTouchResponse
                            .touchedSection!.touchedSectionIndex;
                      });
                    },
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  sectionsSpace: 0,
                  centerSpaceRadius: 40,
                  sections: showingSections(),
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ...getDays().asMap().entries.map((statics) {
                final color = colors[contador];
                contador++;
                return Text(
                  DateAndHoursUtils.getdayToString(statics.value),
                  style: TextStyle(color: color),
                );
              }),
            ],
          ),
          const SizedBox(
            width: 28,
          ),
        ],
      ),
    );
  }

  List<int> getDays() {
    List<int> listDay = [];
    if (widget.listStaticsParams.isNotEmpty) {
      widget.listStaticsParams.forEach((statistics) {
        listDay.add(statistics.month);
      });

      return listDay;
    }
    return [];
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(widget.listStaticsParams.length, (i) {
      final sectionData = widget.listStaticsParams[i];
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      final color = colors[i];
     return  PieChartSectionData(
      color: color,
      value: sectionData.countData.toDouble(), // Usa el conteo del objeto
      title: '${sectionData.countData.toInt()} horas', // Convierte el conteo en un título
      radius: radius,
      titleStyle: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        shadows: shadows,
      ),
    );
    });
  }
}
