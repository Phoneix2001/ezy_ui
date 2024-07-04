// To parse this JSON data, do
//
//     final template = templateFromJson(jsonString);

import 'dart:convert';

import 'component_details_data_model.dart';

List<Template> templateFromJson(String str) => List<Template>.from(json.decode(str).map((x) => Template.fromJson(x)));

String templateToJson(List<Template> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Template {
  String? templateId;
  String? templateName;
  List<ComponentDetailsDataModel>? templateData;
  String? createdAt;
  String? updatedAt;
  List<String>? updatedLogs;
bool selected = false;
  Template({
    this.templateId,
    this.templateName,
    this.templateData,
    this.createdAt,
    this.updatedAt,
    this.updatedLogs
  });

  Template copyWith({
    String? templateId,
    String? templateName,
    List<ComponentDetailsDataModel>? templateData,
    String? createdAt,
    String? updatedAt,
    List<String>? updatedLogs,
  }) =>
      Template(
        templateId: templateId ?? this.templateId,
        templateName: templateName ?? this.templateName,
        templateData: templateData ?? this.templateData,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        updatedLogs: updatedLogs ?? this.updatedLogs,
      );

  factory Template.fromJson(Map<String, dynamic> json) => Template(
    templateId: json["template_id"],
    templateName: json["template_name"],
    templateData: null,
    createdAt: json["created_id"],
    updatedAt: json["updated_id"],
    updatedLogs: json["updated_logs"] == null ? [] : List<String>.from(json["updated_logs"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "template_id": templateId,
    "template_name": templateName,
    "template_data": templateData.toString(),
    "created_id": createdAt,
    "updated_id": updatedAt,
    "updated_logs": updatedLogs == null ? [] : List<dynamic>.from(updatedLogs!.map((x) => x)),
  };
}
