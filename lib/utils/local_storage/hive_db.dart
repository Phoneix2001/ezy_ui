import 'dart:async';

import 'package:ezy_ui/model/template.dart';
import 'package:ezy_ui/utils/custom_funcation.dart';
import 'package:flutter/material.dart' show debugPrint;
import 'package:hive/hive.dart';

sealed class DataKey {
  static const String box = "AppData12334234foi";
  static const String selectedHomeTab = "SelectedHOMETAB";
  static const String templatesKey = "TemplatesKey111";
  static const String jsonViewDataGlobal = "json39024sdadnfkjfd";
 static const  String templateNameGlobal ="template2943i092";
}




class LocalDB  {
  /// Set Dashboard Tab Selected Value
 static set setSelectedHomeTab(int value) {
    writeData(value, DataKey.box, DataKey.selectedHomeTab);
  }
  /// Get Dashboard Tab Selected Value
 static get getSelectedHomeTab {
   return readData(DataKey.box, DataKey.selectedHomeTab);
  }

  /// Set Dashboard Tab Selected Value
 static set templatesKey(List<Template>? value) {
   runZonedGuarded(() {
     // print("template wrote ${templateToJson(value ?? [])}");
     writeData(templateToJson(value ?? []), DataKey.box, DataKey.templatesKey);
   },printError);
 }

  /// Get Dashboard Tab Selected Value
 static List<Template>? get templatesKey {
   final data = readData(DataKey.box, DataKey.templatesKey);
   if (data == null) {
     return null;
   }
  // print(data);
   return templateFromJson(data);
  }
  static dynamic get rawTemplateData {
   return readData(DataKey.box, DataKey.templatesKey);
  }

/* /// Set Dashboard Tab Selected Value
 static set jsonViewDataGlobal(dynamic value) {
   writeData(value, DataKey.box, DataKey.jsonViewDataGlobal);
 }
 /// Get Dashboard Tab Selected Value
 static get jsonViewDataGlobal {
   return readData(DataKey.box, DataKey.jsonViewDataGlobal);
 }

 /// Set Dashboard Tab Selected Value
 static set templateNameGlobal(String? value) {
   writeData(value, DataKey.box, DataKey.templateNameGlobal);
 }
 /// Get Dashboard Tab Selected Value
 static String? get templateNameGlobal {
   return readData(DataKey.box, DataKey.templateNameGlobal);
 }*/
}



/// DataBase Hive Write
void writeData(dynamic data, String box, String key) {
  try {
    final myBox = Hive.box(box);
    myBox.put(key, data);
  } on Exception catch (e, s) {
    debugPrint(e.toString());
    debugPrint(s.toString());
  } catch (e, s) {
    debugPrint(e.toString());
    debugPrint(s.toString());
  }
}

/// Database Hive Read
dynamic readData(String box, String key) {
  dynamic value;
  Hive.openBox(box);
  try {
    final myBox = Hive.box(box);
    value = myBox.get(key);
    return value;
  } on Exception catch (e, s) {
    debugPrint(e.toString());
    debugPrint(s.toString());
  } catch (e, s) {
    debugPrint(e.toString());
    debugPrint(s.toString());
  }
  return value;
}

/// Delete Local Data
bool deleteData(String key, String box) {
  bool value = true;
  try {
    final myBox = Hive.box(box);
    myBox.delete(key);
  } catch (e, s) {
    value = false;
    debugPrint(e.toString());
    debugPrint(s.toString());
  }

  return value;
}

/// Delete All Local Data
bool deleteAll(String box) {
  var value = true;
  try {
    final myBox = Hive.box(box);
    myBox.clear();
  } catch (e, s) {
    value = false;
    debugPrint(e.toString());
    debugPrint(s.toString());
  }
  return value;

}