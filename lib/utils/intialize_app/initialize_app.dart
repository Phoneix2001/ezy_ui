import 'dart:async';

import 'package:ezy_ui/utils/local_storage/hive_db.dart';
import 'package:flutter/material.dart' show WidgetsFlutterBinding;
import 'package:hive_flutter/hive_flutter.dart';

import '../constants/strings/strings.dart' ;

Future<void> initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();
 await Strings.initialize();
  await initHive();
}

Future<void> initHive() async {
  await Hive.initFlutter();
  await Hive.openBox(DataKey.box);
}
