// To parse this JSON data, do
//
//     final userInfo = userInfoFromJson(jsonString);

import 'dart:convert';

UserInfo userInfoFromJson(String str) => UserInfo.fromJson(json.decode(str));

String userInfoToJson(UserInfo data) => json.encode(data.toJson());

class UserInfo {
  String? message;
  int? status;
  Data? data;

  UserInfo({
    this.message,
    this.status,
    this.data,
  });

  UserInfo copyWith({
    String? message,
    int? status,
    Data? data,
  }) =>
      UserInfo(
        message: message ?? this.message,
        status: status ?? this.status,
        data: data ?? this.data,
      );

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
    message: json["message"],
    status: json["status"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "status": status,
    "data": data?.toJson(),
  };
}

class Data {
  int? count;
  List<UserData>? data;

  Data({
    this.count,
    this.data,
  });

  Data copyWith({
    int? count,
    List<UserData>? data,
  }) =>
      Data(
        count: count ?? this.count,
        data: data ?? this.data,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    count: json["count"],
    data: json["data"] == null ? [] : List<UserData>.from(json["data"]!.map((x) => UserData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class UserData {
  String? id;
  String? respondentId;
  String? accountId;
  DateTime? createdAt;
  dynamic deletedTime;
  dynamic earning;
  dynamic filterDetails;
  List<String>? filters;
  int? isDeleted;
  DateTime? lastResponse;
  int? surveys;
  dynamic templateData;
  DateTime? updatedAt;
  String? name;
  String? respondents;
  String? firstName;
  String? lastName;
  dynamic email;
  dynamic userImage;
  String? countryCode;
  int? phoneNumber;
  bool? demographicDetailsPending;
  int? age;
  String? disabilityStatus;
  String? education;
  String? gender;
  List<int>? race;
  String? phone;
  bool? isUnsubscribed;
  dynamic isUnsubscribedBy;
  dynamic unsubscribedTime;
  String? searchFilters;
  String? lowerName;
  String? lowerEmail;
  dynamic template;
bool selected = false;
  UserData({
    this.id,
    this.respondentId,
    this.accountId,
    this.createdAt,
    this.deletedTime,
    this.earning,
    this.filterDetails,
    this.filters,
    this.isDeleted,
    this.lastResponse,
    this.surveys,
    this.templateData,
    this.updatedAt,
    this.name,
    this.respondents,
    this.firstName,
    this.lastName,
    this.email,
    this.userImage,
    this.countryCode,
    this.phoneNumber,
    this.demographicDetailsPending,
    this.age,
    this.disabilityStatus,
    this.education,
    this.gender,
    this.race,
    this.phone,
    this.isUnsubscribed,
    this.isUnsubscribedBy,
    this.unsubscribedTime,
    this.searchFilters,
    this.lowerName,
    this.lowerEmail,
    this.template,
  });

  UserData copyWith({
    String? id,
    String? respondentId,
    String? accountId,
    DateTime? createdAt,
    dynamic deletedTime,
    dynamic earning,
    dynamic filterDetails,
    List<String>? filters,
    int? isDeleted,
    DateTime? lastResponse,
    int? surveys,
    dynamic templateData,
    DateTime? updatedAt,
    String? name,
    String? respondents,
    String? firstName,
    String? lastName,
    dynamic email,
    dynamic userImage,
    String? countryCode,
    int? phoneNumber,
    bool? demographicDetailsPending,
    int? age,
    String? disabilityStatus,
    String? education,
    String? gender,
    List<int>? race,
    String? phone,
    bool? isUnsubscribed,
    dynamic isUnsubscribedBy,
    dynamic unsubscribedTime,
    String? searchFilters,
    String? lowerName,
    String? lowerEmail,
    dynamic template,
  }) =>
      UserData(
        id: id ?? this.id,
        respondentId: respondentId ?? this.respondentId,
        accountId: accountId ?? this.accountId,
        createdAt: createdAt ?? this.createdAt,
        deletedTime: deletedTime ?? this.deletedTime,
        earning: earning ?? this.earning,
        filterDetails: filterDetails ?? this.filterDetails,
        filters: filters ?? this.filters,
        isDeleted: isDeleted ?? this.isDeleted,
        lastResponse: lastResponse ?? this.lastResponse,
        surveys: surveys ?? this.surveys,
        templateData: templateData ?? this.templateData,
        updatedAt: updatedAt ?? this.updatedAt,
        name: name ?? this.name,
        respondents: respondents ?? this.respondents,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        userImage: userImage ?? this.userImage,
        countryCode: countryCode ?? this.countryCode,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        demographicDetailsPending: demographicDetailsPending ?? this.demographicDetailsPending,
        age: age ?? this.age,
        disabilityStatus: disabilityStatus ?? this.disabilityStatus,
        education: education ?? this.education,
        gender: gender ?? this.gender,
        race: race ?? this.race,
        phone: phone ?? this.phone,
        isUnsubscribed: isUnsubscribed ?? this.isUnsubscribed,
        isUnsubscribedBy: isUnsubscribedBy ?? this.isUnsubscribedBy,
        unsubscribedTime: unsubscribedTime ?? this.unsubscribedTime,
        searchFilters: searchFilters ?? this.searchFilters,
        lowerName: lowerName ?? this.lowerName,
        lowerEmail: lowerEmail ?? this.lowerEmail,
        template: template ?? this.template,
      );

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    id: json["_id"],
    respondentId: json["respondent_id"],
    accountId: json["account_id"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    deletedTime: json["deleted_time"],
    earning: json["earning"],
    filterDetails: json["filter_details"] ,
    filters: json["filters"] == null ? [] : List<String>.from(json["filters"]!.map((x) => x)),
    isDeleted: json["is_deleted"],
    lastResponse: json["last_response"] == null ? null : DateTime.parse(json["last_response"]),
    surveys: json["surveys"],
    templateData: json["template_data"],
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    name: json["name"],
    respondents: json["respondents"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
    userImage: json["user_image"],
    countryCode: json["country_code"],
    phoneNumber: json["phone_number"],
    demographicDetailsPending: json["demographic_details_pending"],
    age: json["age"],
    disabilityStatus: json["disability_status"],
    education: json["education"],
    gender: json["gender"],
    race: json["race"] == null ? [] : List<int>.from(json["race"]!.map((x) => x)),
    phone: json["phone"],
    isUnsubscribed: json["is_unsubscribed"],
    isUnsubscribedBy: json["is_unsubscribed_by"],
    unsubscribedTime: json["unsubscribed_time"],
    searchFilters: json["search_filters"],
    lowerName: json["lowerName"],
    lowerEmail: json["lowerEmail"],
    template: json["template"] ,
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "respondent_id": respondentId,
    "account_id": accountId,
    "createdAt": createdAt?.toIso8601String(),
    "deleted_time": deletedTime,
    "earning": earning,
    "filter_details": filterDetails == null ? [] : List<dynamic>.from(filterDetails!.map((x) => x.toJson())),
    "filters": filters == null ? [] : List<dynamic>.from(filters!.map((x) => x)),
    "is_deleted": isDeleted,
    "last_response": lastResponse?.toIso8601String(),
    "surveys": surveys,
    "template_data": templateData?.toJson(),
    "updatedAt": updatedAt?.toIso8601String(),
    "name": name,
    "respondents": respondents,
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "user_image": userImage,
    "country_code": countryCode,
    "phone_number": phoneNumber,
    "demographic_details_pending": demographicDetailsPending,
    "age": age,
    "disability_status": disabilityStatus,
    "education": education,
    "gender": gender,
    "race": race == null ? [] : List<dynamic>.from(race!.map((x) => x)),
    "phone": phone,
    "is_unsubscribed": isUnsubscribed,
    "is_unsubscribed_by": isUnsubscribedBy,
    "unsubscribed_time": unsubscribedTime,
    "search_filters": searchFilters,
    "lowerName": lowerName,
    "lowerEmail": lowerEmail,
    "template": template == null ? [] : List<dynamic>.from(template!.map((x) => x.toJson())),
  };
}


