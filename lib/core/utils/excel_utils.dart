import 'dart:io';

import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:gestor_horas_extras/core/utils/date_and_hours_utils.dart';
import 'package:gestor_horas_extras/feature/statistics/domain/params/report.dart';

class ExcelUtils {
  static createExcel(
    List<Report> listReport,
    String nombre,
    String proyecto,
    String responsable,
    String jefeInmediato,
  ) {
    var excel = Excel.createExcel();
    //Crear hoja - dinamyc
    Sheet sheetObject = excel['Noviembre'];
    excel.delete('Sheet1');

    CellStyle headerStyle = CellStyle(
      fontFamily: getFontFamily(FontFamily.Calibri),
      fontSize: 10,
      rotation: 0,
      backgroundColorHex: ExcelColor.fromHexString("#083763"),
      fontColorHex: ExcelColor.fromInt(0xfffffff),
      numberFormat: NumFormat.defaultNumeric,
    );

    CellStyle cellContainer = CellStyle(
      numberFormat: NumFormat.defaultNumeric,
    );
    // Agregar encabezados a la primera fila
    List<String> headers = [
      "DOCUMENTO",
      "NOMBRE",
      "FECHA",
      "DIA",
      "HORA",
      "CANTIDAD DE HORAS",
      "ACTIVIDAD REALIZADA",
      "CELULA",
      "QUIEN SUPERVISA",
      "QUIEN AUTORIZA",
      "OBSERVACIONES",
    ];
    for (int i = 0; i < headers.length; i++) {
      var cell = sheetObject
          .cell(CellIndex.indexByColumnRow(columnIndex: i, rowIndex: 0));
      cell.value = TextCellValue(headers[i]);
      cell.cellStyle = headerStyle;
    }

    // Agregar datos de cada objeto en las filas siguientes
    for (int i = 0; i < listReport.length; i++) {
      Report persona = listReport[i];
      var cellDocumentNumber = sheetObject
          .cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: i + 1));
      cellDocumentNumber.value = TextCellValue(persona.cedula);
      cellDocumentNumber.cellStyle = cellContainer;
      sheetObject
          .cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: i + 1))
          .value = TextCellValue(nombre);
      sheetObject
          .cell(CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: i + 1))
          .value = TextCellValue(persona.dia.replaceAll(" ", "").trim());
      sheetObject
              .cell(CellIndex.indexByColumnRow(columnIndex: 3, rowIndex: i + 1))
              .value =
          TextCellValue(DateAndHoursUtils.getdayToString(
              DateAndHoursUtils.getDay(persona.dia)));
      sheetObject
              .cell(CellIndex.indexByColumnRow(columnIndex: 4, rowIndex: i + 1))
              .value =
          TextCellValue(
              "${persona.horaInicio.toLowerCase()} a ${persona.horaFinal.toLowerCase()}");
      var cellDifferentsHours = sheetObject
          .cell(CellIndex.indexByColumnRow(columnIndex: 5, rowIndex: i + 1));
      cellDifferentsHours.value = TextCellValue(
          DateAndHoursUtils.calcularDiferenciaHoras(
                  persona.horaInicio, persona.horaFinal)
              .toString());
      cellDifferentsHours.cellStyle = cellContainer;
      sheetObject
          .cell(CellIndex.indexByColumnRow(columnIndex: 6, rowIndex: i + 1))
          .value = TextCellValue(persona.descripcion);
      sheetObject
          .cell(CellIndex.indexByColumnRow(columnIndex: 7, rowIndex: i + 1))
          .value = TextCellValue(proyecto);
      sheetObject
          .cell(CellIndex.indexByColumnRow(columnIndex: 8, rowIndex: i + 1))
          .value = TextCellValue(jefeInmediato);
      sheetObject
          .cell(CellIndex.indexByColumnRow(columnIndex: 9, rowIndex: i + 1))
          .value = TextCellValue(responsable);
      sheetObject
          .cell(CellIndex.indexByColumnRow(columnIndex: 10, rowIndex: i + 1))
          .value = TextCellValue("");
    }

    // Guarda el archivo
    var fileBytes = excel.save();

    // Especifica la ubicación donde guardar el archivo
    File(
        "C:/Users/John/Documents/Universidad/Cuarto Semestre/Practica I/gestor_horas_extras/documents/horas_extras.xlsx")
      ..createSync(recursive: true)
      ..writeAsBytesSync(fileBytes!);
  }
}
