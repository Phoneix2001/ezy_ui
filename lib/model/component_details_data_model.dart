// To parse this JSON data, do
//
//     final componentDetailsDataModel = componentDetailsDataModelFromJson(jsonString);

import 'dart:convert';

import 'package:ezy_ui/utils/constants/app_enum.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

ComponentDetailsDataModel componentDetailsDataModelFromJson(String str) => ComponentDetailsDataModel.fromJson(json.decode(str));

String componentDetailsDataModelToJson(ComponentDetailsDataModel data) => json.encode(data.toJson());

class ComponentDetailsDataModel {
  String id;
  double? height;
  double? width;
  Color? color;
  TextEditingController text = TextEditingController();
  CustomComponent type;

  ComponentDetailsDataModel({
   required this.id,
    this.height,
    this.width,
    this.color,
    required  this.type,
    required this.text
  });

  ComponentDetailsDataModel copyWith({
    String? id,
    double? height,
    double? width,
    Color? color,
    CustomComponent? type,
    TextEditingController?  text
  }) =>
      ComponentDetailsDataModel(
        id: id ?? this.id,
        height: height ?? this.height,
        width: width ?? this.width,
        color: color ?? this.color,
        type: type ?? this.type,
        text: text ?? this.text
      );

  factory ComponentDetailsDataModel.fromJson(Map<String, dynamic> json) => ComponentDetailsDataModel(
    id: json["id"],
    height: json["height"]?.toDouble(),
    width: json["width"]?.toDouble(),
    color: json["color"],
    type: json["type"],
    text: json["text"]
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "height": height,
    "width": width,
    "color": color,
    "type": type,
    "text" : text
  };
}
