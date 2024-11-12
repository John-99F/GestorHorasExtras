
class Report {
  final String cedula;
  final String descripcion;
  final String dia;
  final String horaInicio;
  final String horaFinal;
  final String jefeInmediato;
  final String proyecto;
  final String responsable;

  Report({
    required this.cedula,
    required this.descripcion,
    required this.dia,
    required this.horaInicio,
    required this.horaFinal,
    required this.jefeInmediato,
    required this.proyecto,
    required this.responsable,
  });

   Map<String, dynamic> toMap() {
    return {
      "cedula_usuario": cedula,
      "descripcion": descripcion,
      "dia":dia,
      "horaInicio":horaInicio,
      "horaFinal":horaFinal,
      "jefeInmediato": jefeInmediato,
      "proyecto": proyecto,
      "responsable":responsable,
    };
  }

}
