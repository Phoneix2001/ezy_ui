// To parse this JSON data, do
//
//     final componentDetailsDataModel = componentDetailsDataModelFromJson(jsonString);

import 'dart:convert';

import 'package:ezy_ui/utils/constants/app_enum.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

ComponentDetailsDataModel componentDetailsDataModelFromJson(String str) =>
    ComponentDetailsDataModel.fromJson(json.decode(str));

String componentDetailsDataModelToJson(ComponentDetailsDataModel data) =>
    json.encode(data.toJson());

class ComponentDetailsDataModel {
  String id;
  double? height;
  double? width;
  Color? color;
  TextEditingController? text;
  CustomComponent type;
  ColumnComponent? columnComponent;
int itemsCount;
  ComponentDetailsDataModel(
      {required this.id,
      this.height,
      this.width,
      this.color,
      required this.type,
      this.text,this.columnComponent,this.itemsCount =0});

  ComponentDetailsDataModel copyWith(
          {String? id,
          double? height,
          double? width,
          Color? color,
          CustomComponent? type,
          TextEditingController? text,
          ColumnComponent? columnComponent,
          int? itemsCount}) =>
      ComponentDetailsDataModel(
          id: id ?? this.id,
          height: height ?? this.height,
          width: width ?? this.width,
          color: color ?? this.color,
          type: type ?? this.type,
          text: text ?? this.text,
      columnComponent: columnComponent ?? this.columnComponent,
      itemsCount: itemsCount ?? this.itemsCount);

  factory ComponentDetailsDataModel.fromJson(Map<String, dynamic> json) =>
      ComponentDetailsDataModel(
          id: json["id"],
          height: json["height"]?.toDouble(),
          width: json["width"]?.toDouble(),
          color:Color(json["color"] ?? 0xff00000) ,
          type: json["type"],
          text: TextEditingController(text:json["text"] ?? ""),
      columnComponent: json["columnComponent"],
          itemsCount: json["itemsCount"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "height": height,
        "width": width,
        "color": color?.value,
        "type": type,
        "text": text?.text,
    "columnComponent":columnComponent?.toJson(),
    "itemsCount" : itemsCount
      };
}

class ColumnComponent {
  String id;
  double? height;
  double? width;
  Key? key;
  MainAxisAlignment mainAxisAlignment;
  MainAxisSize mainAxisSize;
  CrossAxisAlignment crossAxisAlignment;
  TextDirection? textDirection;
  VerticalDirection verticalDirection;
  TextBaseline? textBaseline;
  List<Widget> widgets;
  ColumnComponent(
      {required this.id,
      this.height,
      this.width,
      this.key,
      this.mainAxisAlignment = MainAxisAlignment.start,
      this.mainAxisSize = MainAxisSize.max,
      this.crossAxisAlignment = CrossAxisAlignment.center,
      this.textDirection,
      this.verticalDirection = VerticalDirection.down,
      this.textBaseline,
      this.widgets = const <Widget>[]});

  ColumnComponent copyWith(
          {String? id,
          double? height,
          double? width,
          Key? key,
          MainAxisAlignment? mainAxisAlignment,
          MainAxisSize? mainAxisSize,
          CrossAxisAlignment? crossAxisAlignment,
          TextDirection? textDirection,
          VerticalDirection? verticalDirection,
          TextBaseline? textBaseline,
          List<Widget>? widgets}) =>
      ColumnComponent(
          id: id ?? this.id,
          height: height ?? this.height,
          width: width ?? this.width,
          key: key ?? this.key,
          mainAxisAlignment: mainAxisAlignment ?? this.mainAxisAlignment,
          mainAxisSize: mainAxisSize ?? this.mainAxisSize,
          crossAxisAlignment: crossAxisAlignment ?? this.crossAxisAlignment,
          textDirection: textDirection ?? this.textDirection,
          verticalDirection: verticalDirection ?? this.verticalDirection,
          textBaseline: textBaseline ?? this.textBaseline,
          widgets: widgets ?? this.widgets);

  factory ColumnComponent.fromJson(Map<String, dynamic> json) =>
      ColumnComponent(
          id: json["id"],
          height: json["height"]?.toDouble(),
          width: json["width"]?.toDouble(),
          key: json["key"],
          mainAxisAlignment: json["mainAxisAlignment"],
          mainAxisSize: json["mainAxisSize"],
          crossAxisAlignment: json["crossAxisAlignment"],
          textDirection: json["textDirection"],
          verticalDirection: json["verticalDirection"],
          textBaseline: json["textBaseline"],
          widgets: json["widgets"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "height": height,
        "width": width,
        "key": key,
        "mainAxisAlignment": mainAxisAlignment,
        "mainAxisSize": mainAxisSize,
        "crossAxisAlignment": crossAxisAlignment,
        "textDirection": textDirection,
        "verticalDirection": verticalDirection,
        "textBaseline": textBaseline,
        "widgets": widgets
      };
}
