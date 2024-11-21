import 'package:gestor_horas_extras/core/utils/constants.dart';

class DateAndHoursUtils {
  ///Metodo para obtener el mes en numero.
  static int getMonth(String date) {
    List<String> dateDivided = date.replaceAll(" ", "").split("/");

    int year = int.parse(dateDivided[0]);
    int month = int.parse(dateDivided[1]);
    int day = int.parse(dateDivided[2]);

    DateTime dateFormat = DateTime(year, month, day);
    print('mes en numero: ${dateFormat.month}');
    return dateFormat.month;
  }

  /// Metodo para obtener el mes por String.
  static String getMonthToString(int month) {
    print('mes: ${Constants.months[month-1]}');
    return Constants.months[month - 1];
  }

  static int calcularDiferenciaHoras(String horaInicio, String horaFin) {
    final horasI = convertTo24HourFormat(converterMidNight(horaInicio.toUpperCase().trim())).split(":");
    final horasF =convertTo24HourFormat(converterMidNight(horaFin.toUpperCase().trim())).split(":"); 

    return int.parse(horasF[0])  - int.parse(horasI[0]) ;
  }

  static String converterMidNight(String hora){
    if (hora == "12:00 AM") {
      return "24:00 AM";
    }
    return hora;
  }

 static String convertTo24HourFormat(String time12h) {
  // Separa la parte de la hora y el indicador de AM/PM
  final parts = time12h.split(' ');
  final time = parts[0];  // Parte de la hora (ej. "01:00")
  final period = parts[1].toUpperCase();  // "AM" o "PM"

  // Divide las horas y minutos
  final timeParts = time.split(':');
  int hour = int.parse(timeParts[0]);
  final minutes = timeParts[1];

  if (period == 'PM' && hour != 12) {
    hour += 12;
  } else if (period == 'AM' && hour == 12) {
    hour = 0;
  }

  final hourStr = hour.toString().padLeft(2, '0');
  return '$hourStr:$minutes';
  }


    ///Metodo para obtener el dia en numero.
  static int getDay(String date) {
    List<String> dateDivided = date.replaceAll(" ", "").split("/");

    int year = int.parse(dateDivided[0]);
    int month = int.parse(dateDivided[1]);
    int day = int.parse(dateDivided[2]);

    DateTime dateFormat = DateTime(year, month, day);
    print('mes en numero: ${dateFormat.weekday}');
    return dateFormat.weekday;
  }

  
  /// Metodo para obtener el dia por String.
  static String getdayToString(int day) {
    print("int before: $day");
    print('dia: ${Constants.days[day-1]} int: $day');
    return Constants.days[day-1];
  }

}
