import 'package:shared_preferences/shared_preferences.dart';

class PreferencesUtils extends KeyValueStorageService {
  PreferencesUtils._privateContructor();

  String clearString = '';

  static final PreferencesUtils _instance =
      PreferencesUtils._privateContructor();

  ///Metodo para obtener la preferencia acorde a su tipo de dato
  @override
  Future<T?> getValue<T>(String key, {bool isEncrypted = false}) async {
    final pref = await getSharedPreferences();
    switch (T) {
      case int:
        return await pref.getInt(key) as T;
      case String:
        return await pref.getString(key) as T;
      case double:
        return await pref.getDouble(key) as T;
      case bool:
        return await pref.getBool(key) as T;
      default:
        throw UnimplementedError("No se puede obtener la preferencia ");
    }
  }

  ///Metodo para setear la preferencia acorde a su tipo de dato
  @override
  Future<void> setKeyValue<T>(String key, T value,
      {bool isEncrypted = false}) async {
    final pref = await getSharedPreferences();
    switch (T) {
      case int:
        await pref.setInt(key, value as int);
        break;
      case String:
        await pref.setString(key, value as String);
        break;
      case double:
        await pref.setDouble(
          key,
          value as double,
        );
        break;
      case bool:
        await pref.setBool(
          key,
          value as bool,
        );
        break;
      default:
        throw UnimplementedError("No se puede guardar la preferencia ");
    }
  }

  static PreferencesUtils get instance => _instance;

  Future<SharedPreferences> getSharedPreferences() async {
    return await SharedPreferences.getInstance();
  }

  ///Metodo para setear la preferencia de userName
  Future<void> setUserName(String value) async {
    await setKeyValue<String>(KeyPreference.userName.toString(), value);
  }

  ///Metodo para obtener el valor de la preferencia de userName
  Future<String> getUserName() async {
    return (await getValue<String>(KeyPreference.userName.toString())) ??
        clearString;
  }

  ///Metodo para limpiar la preferencia de userName
  Future<void> clearUserName() async {
    await setKeyValue<String>(KeyPreference.userName.toString(), clearString);
  }

  ///Metodo para setear la preferencia de documentNumber
  Future<void> setDocumentNumber(String value) async {
    await setKeyValue<String>(KeyPreference.documentNumber.toString(), value);
  }

  ///Metodo para obtener el valor de la preferencia de documentNumber
  Future<String> getDocumentNumber() async {
    return (await getValue<String>(KeyPreference.documentNumber.toString())) ??
        "12";
  }

  ///Metodo para limpiar la preferencia de documentNumber
  Future<void> clearDocumentNumber() async {
    await setKeyValue<String>(
        KeyPreference.documentNumber.toString(), clearString);
  }

  ///Metodo para setear la preferencia del rol del usuario
  Future<void> setRole(String value) async {
    await setKeyValue<String>(KeyPreference.roleUser.toString(), value);
  }

  ///Metodo para obtener el valor de la preferencia del rol del usuario
  Future<String> getRoleUser() async {
    return (await getValue<String>(KeyPreference.roleUser.toString())) ??
        clearString;
  }

  ///Metodo para limpiar la preferencia del rol del usuario
  Future<void> clearRoleUser() async {
    await setKeyValue<String>(KeyPreference.roleUser.toString(), clearString);
  }
  ///Metodo para setear la preferencia del responsable
  Future<void> setResponsible(String value) async {
    await setKeyValue<String>(KeyPreference.responsible.toString(), value);
  }

  ///Metodo para obtener el valor de la preferencia del responsable
  Future<String> getResponsible() async {
    return (await getValue<String>(KeyPreference.responsible.toString())) ??
        clearString;
  }

  ///Metodo para limpiar la preferencia del del responsable
  Future<void> clearResponsible() async {
    await setKeyValue<String>(KeyPreference.responsible.toString(), clearString);
  }
   ///Metodo para setear la preferencia del jefe inmediato
  Future<void> setImmediateBoss(String value) async {
    await setKeyValue<String>(KeyPreference.immediateBoss.toString(), value);
  }

  ///Metodo para obtener el valor de la preferencia del jefe inmediato
  Future<String> getImmediateBoss() async {
    return (await getValue<String>(KeyPreference.immediateBoss.toString())) ??
        clearString;
  }

  ///Metodo para limpiar la preferencia del del jefe inmediato
  Future<void> clearImmediateBoss() async {
    await setKeyValue<String>(KeyPreference.immediateBoss.toString(), clearString);
  }
   ///Metodo para setear la preferencia del proyecto
  Future<void> setProject(String value) async {
    await setKeyValue<String>(KeyPreference.project.toString(), value);
  }

  ///Metodo para obtener el valor de la preferencia del proyecto
  Future<String> getProject() async {
    return (await getValue<String>(KeyPreference.project.toString())) ??
        clearString;
  }

  ///Metodo para limpiar la preferencia del proyecto
  Future<void> clearProject() async {
    await setKeyValue<String>(KeyPreference.project.toString(), clearString);
  }
}

enum KeyPreference {
  userName,
  documentNumber,
  roleUser,
  responsible, 
  immediateBoss,
  project,
}

abstract class KeyValueStorageService {
  Future<void> setKeyValue<T>(String key, T value);

  Future<T?> getValue<T>(String key);
}
