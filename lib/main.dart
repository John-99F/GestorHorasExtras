import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gestor_horas_extras/app/main_app.dart';

void main() {
  runApp(const ProviderScope(
    child: MainApp(),
  ));
}
