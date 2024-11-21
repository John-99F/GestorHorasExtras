import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gestor_horas_extras/core/utils/preferences_utils.dart';
import 'package:gestor_horas_extras/feature/statistics/domain/params/report.dart';

class FirestoreUtils {
  static final CollectionReference _users =
      FirebaseFirestore.instance.collection('usuario');
  static final CollectionReference _reglas =
      FirebaseFirestore.instance.collection('reglas');
  static final CollectionReference _horas =
      FirebaseFirestore.instance.collection('horas');
  static final PreferencesUtils _preferencesUtils = PreferencesUtils.instance;

// ------------------------------------- CRUD USUARIO -------------------------------------
  /// Metodo para crear usuarios por firebase
  static Future<void> createUser({
    required String documentNumber,
    required String name,
    required String secondName,
    required String rol,
    required String password,
  }) async {
    try {
      await _users.add({
        "cedula": documentNumber,
        "nombre": name,
        "apellido": secondName,
        "password": password,
        "id_rol": rol,
      });
    } catch (e) {
      print("Error al guardar usuario: $e");
    }
  }

  static Future<bool>? getUser(String cedula, String password) async {
    try {
      QuerySnapshot queryUser = await _users
          .where('cedula', isEqualTo: cedula)
          .where('password', isEqualTo: password)
          .get();

      if (queryUser.docs.isNotEmpty) {
        Map<String, dynamic> user =
            queryUser.docs.first.data() as Map<String, dynamic>;
        await _preferencesUtils
            .setUserName("${user['nombre']} ${user['apellido']}");
        await _preferencesUtils.setDocumentNumber(user['cedula']);
        await _preferencesUtils.setRole(user['id_rol']);

        return true;
      } else {
        print(
            'No se encontró un usuario con la cédula y contraseña especificadas.');
        return false;
      }
    } catch (e) {
      print("Error al buscar usuarios: $e");
      return false;
    }
  }

  static Future<Map<String, String>> getAllUsers() async {
    try {
      QuerySnapshot queryUser = await _users.get();

      if (queryUser.docs.isNotEmpty) {
        Map<String, String> users = {};
        queryUser.docs.forEach((user) {
          Map<String, dynamic> userMap = user.data() as Map<String, dynamic>;
          users[userMap['cedula']] = "${userMap['nombre']} ${userMap['apellido']}"
        ;
        });
        return users;
      } else {
        print(
            'No se encontró un usuario con la cédula y contraseña especificadas.');
        return {};
      }
    } catch (e) {
      print("Error al buscar usuarios: $e");
      return {};
    }
  }

// ------------------------------------- CRUD HORAS -------------------------------------
  /// Metodo para crear usuarios por firebase
  static Future<void> createReport({
    required String documentNumber,
    required String dia,
    required String horaInicio,
    required String horaFinal,
    required String descripcion,
    required String jefeInmediato,
    required String responsable,
    required String proyecto,
  }) async {
    try {
      await _horas.add({
        "cedula_usuario": documentNumber,
        "dia": dia,
        "horaInicio": horaInicio,
        "horaFinal": horaFinal,
        "descripcion": descripcion,
        "jefeInmediato": jefeInmediato,
        "responsable": responsable,
        "proyecto": proyecto,
      });
    } catch (e) {
      print("Error al guardar usuario: $e");
    }
  }

  /// Metodo para actualizar usuarios por firebase
  Future<void> updateReport({
    required String id,
    required String documentNumber,
    required String dia,
    required String horaInicio,
    required String horaFinal,
    required String descripcion,
    required String jefeInmediato,
    required String responsable,
    required String proyecto,
  }) async {
    try {
      await _horas.doc(id).update({
        "cedula_usuario": documentNumber,
        "dia": dia,
        "horaInicio": horaInicio,
        "horaFinal": horaFinal,
        "descripcion": descripcion,
        "jefeInmediato": jefeInmediato,
        "responsable": responsable,
        "proyecto": proyecto,
      });
    } catch (e) {
      print("Error al actualizar usuario: $e");
    }
  }

  static Future<List<Report>>? getReportByUser(
    String cedula,
  ) async {
    try {
      List<Report> hoursReport = [];

      QuerySnapshot queryHours =
          await _horas.where('cedula_usuario', isEqualTo: cedula).get();

      if (queryHours.docs.isNotEmpty) {
        queryHours.docs.forEach((horas) {
          Map<String, dynamic> horaMapper =
              horas.data() as Map<String, dynamic>;

          hoursReport.add(Report(
            cedula: cedula,
            descripcion: horaMapper["descripcion"],
            dia: horaMapper["dia"],
            horaInicio: horaMapper["horaInicio"],
            horaFinal: horaMapper["horaFinal"],
            jefeInmediato: horaMapper["jefeInmediato"],
            proyecto: horaMapper["proyecto"],
            responsable: horaMapper["responsable"],
          ));
        });

        return hoursReport;
      } else {
        print(
            'No se encontró un usuario con la cédula y contraseña especificadas.');
        return [];
      }
    } catch (e) {
      print("Error al buscar usuarios: $e");
      return [];
    }
  }

  static Future<List<Report>>? getAllReport() async {
    try {
      List<Report> hoursReport = [];

      QuerySnapshot queryHours = await _horas.get();

      if (queryHours.docs.isNotEmpty) {
        queryHours.docs.forEach((horas) {
          Map<String, dynamic> horaMapper =
              horas.data() as Map<String, dynamic>;

          hoursReport.add(Report(
            cedula: horaMapper["cedula_usuario"],
            descripcion: horaMapper["descripcion"],
            dia: horaMapper["dia"],
            horaInicio: horaMapper["horaInicio"],
            horaFinal: horaMapper["horaFinal"],
            jefeInmediato: horaMapper["jefeInmediato"],
            proyecto: horaMapper["proyecto"],
            responsable: horaMapper["responsable"],
          ));
        });

        return hoursReport;
      } else {
        print(
            'No se encontró un usuario con la cédula y contraseña especificadas.');
        return [];
      }
    } catch (e) {
      print("Error al buscar usuarios: $e");
      return [];
    }
  }

// ------------------------------------- CRUD REGLAS -------------------------------------
  static Future<void> createRule({
    required String documentNumber,
    required String jefeInmediato,
    required String responsable,
    required String descripcion,
    required String project,
  }) async {
    try {
      await _reglas.add({
        "descripcion": descripcion,
        "jefeInmediato": jefeInmediato,
        "responsable": responsable,
        "project": project,
        "cedula_usuario": documentNumber,
      });
    } catch (e) {
      print("Error al guardar usuario: $e");
    }
  }

  /// Metodo para actualizar usuarios por firebase
  Future<void> updateRule({
    required String idRegla,
    required String documentNumber,
    required String descripcion,
    required String dias,
    required String horas,
  }) async {
    try {
      await _reglas.doc(idRegla).update({
        "descripcion": descripcion,
        "dias": dias,
        "horas": horas,
        "cedula_usuario": documentNumber,
      });
    } catch (e) {
      print("Error al actualizar usuario: $e");
    }
  }

  /// Metodo para eliminar usuarios por firebase
  Future<void> deleteRule({required String idRegla}) async {
    try {
      await _reglas.doc(idRegla).delete();
    } catch (e) {
      print("Error al eliminar usuario: $e");
    }
  }

  static Future<bool>? getRule() async {
    try {
      QuerySnapshot queryRule = await _reglas.get();

      if (queryRule.docs.isNotEmpty) {
        Map<String, dynamic> rule =
            queryRule.docs.last.data() as Map<String, dynamic>;

        await _preferencesUtils.setResponsible(rule['responsable']);
        await _preferencesUtils.setImmediateBoss(rule['jefeInmediato']);
        await _preferencesUtils.setProject(rule['project']);

        return true;
      } else {
        print('No se encontraron reglas existentes');
        return false;
      }
    } catch (e) {
      print("Error al buscar regla: $e");
      return false;
    }
  }
}
