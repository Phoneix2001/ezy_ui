import 'dart:convert';

import 'package:ezy_ui/utils/assets/assets.dart';
import 'package:flutter/services.dart';



class Strings {
  static final Strings _instance = Strings._internal();
  static final Strings _instance2 = Strings._internal();

  factory Strings() {
    return _instance;
  }

  factory Strings.secondInstance() {
    return _instance2;
  }

  Strings._internal();

  static late Strings _singleton;
  static late Strings _singleton2;
  late dynamic headings;


  static Future<void> initialize() async {
    _singleton = Strings._internal();
    final String response = await rootBundle.loadString(AppAssets.stringValue);
    _singleton.headings = json.decode(response);


  }



  static void initializeSecondInstance() async {
    _singleton2 = Strings._internal();
    final String response = await rootBundle.loadString(AppAssets.stringValue);
    _singleton2.headings = await json.decode(response);
  }

  late final String box = _singleton.headings["box"];
  late final String column = _singleton.headings["column"];
  late final String stack = _singleton.headings["stack"];
  late final String text = _singleton.headings["text"];
  late final String textHere = _singleton.headings["text_here"];
}
