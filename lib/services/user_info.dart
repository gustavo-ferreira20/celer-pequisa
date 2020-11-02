// To parse this JSON data, do
//
//     final userInfo = userInfoFromJson(jsonString);

import 'dart:convert';

class UserInfo {
  UserInfo({
    this.user,
    this.token,
  });

  User user;
  String token;

  factory UserInfo.fromRawJson(String str) =>
      UserInfo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
        user: User.fromJson(json["user"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "token": token,
      };

  String toString() {
    return 'Usuario(token: $token)';
  }
}

class User {
  User({
    this.id,
    this.fullName,
    this.email,
    this.profile,
    this.phones,
    this.company,
    this.tads,
    this.createDate,
    this.createUser,
    this.lastUpdateDate,
    this.lastUpdateUser,
    this.isActive,
  });

  int id;
  String fullName;
  String email;
  String profile;
  List<Phone> phones;
  Company company;
  List<dynamic> tads;
  DateTime createDate;
  CreateUserCreateUser createUser;
  DateTime lastUpdateDate;
  CreateUserCreateUser lastUpdateUser;
  bool isActive;

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        fullName: json["fullName"],
        email: json["email"],
        profile: json["profile"],
        phones: List<Phone>.from(json["phones"].map((x) => Phone.fromJson(x))),
        company: Company.fromJson(json["company"]),
        tads: List<dynamic>.from(json["tads"].map((x) => x)),
        createDate: DateTime.parse(json["createDate"]),
        createUser: CreateUserCreateUser.fromJson(json["createUser"]),
        lastUpdateDate: DateTime.parse(json["lastUpdateDate"]),
        lastUpdateUser: CreateUserCreateUser.fromJson(json["lastUpdateUser"]),
        isActive: json["isActive"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fullName": fullName,
        "email": email,
        "profile": profile,
        "phones": List<dynamic>.from(phones.map((x) => x.toJson())),
        "company": company.toJson(),
        "tads": List<dynamic>.from(tads.map((x) => x)),
        "createDate": createDate.toIso8601String(),
        "createUser": createUser.toJson(),
        "lastUpdateDate": lastUpdateDate.toIso8601String(),
        "lastUpdateUser": lastUpdateUser.toJson(),
        "isActive": isActive,
      };
}

class Company {
  Company({
    this.id,
    this.name,
    this.cnpj,
    this.email,
    this.responsibleName,
    this.responsibleEmail,
    this.responsiblePhone,
    this.street,
    this.number,
    this.complement,
    this.neighborhood,
    this.city,
    this.state,
    this.country,
    this.zipcode,
    this.phones,
    this.branch,
    this.createDate,
    this.createUser,
    this.lastUpdateDate,
    this.lastUpdateUser,
    this.isActive,
  });

  int id;
  String name;
  String cnpj;
  String email;
  String responsibleName;
  String responsibleEmail;
  String responsiblePhone;
  dynamic street;
  dynamic number;
  dynamic complement;
  dynamic neighborhood;
  dynamic city;
  dynamic state;
  dynamic country;
  dynamic zipcode;
  List<dynamic> phones;
  dynamic branch;
  DateTime createDate;
  CompanyCreateUser createUser;
  DateTime lastUpdateDate;
  CompanyCreateUser lastUpdateUser;
  bool isActive;

  factory Company.fromRawJson(String str) => Company.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        id: json["id"],
        name: json["name"],
        cnpj: json["cnpj"],
        email: json["email"],
        responsibleName: json["responsibleName"],
        responsibleEmail: json["responsibleEmail"],
        responsiblePhone: json["responsiblePhone"],
        street: json["street"],
        number: json["number"],
        complement: json["complement"],
        neighborhood: json["neighborhood"],
        city: json["city"],
        state: json["state"],
        country: json["country"],
        zipcode: json["zipcode"],
        phones: List<dynamic>.from(json["phones"].map((x) => x)),
        branch: json["branch"],
        createDate: DateTime.parse(json["createDate"]),
        createUser: CompanyCreateUser.fromJson(json["createUser"]),
        lastUpdateDate: DateTime.parse(json["lastUpdateDate"]),
        lastUpdateUser: CompanyCreateUser.fromJson(json["lastUpdateUser"]),
        isActive: json["isActive"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "cnpj": cnpj,
        "email": email,
        "responsibleName": responsibleName,
        "responsibleEmail": responsibleEmail,
        "responsiblePhone": responsiblePhone,
        "street": street,
        "number": number,
        "complement": complement,
        "neighborhood": neighborhood,
        "city": city,
        "state": state,
        "country": country,
        "zipcode": zipcode,
        "phones": List<dynamic>.from(phones.map((x) => x)),
        "branch": branch,
        "createDate": createDate.toIso8601String(),
        "createUser": createUser.toJson(),
        "lastUpdateDate": lastUpdateDate.toIso8601String(),
        "lastUpdateUser": lastUpdateUser.toJson(),
        "isActive": isActive,
      };
}

class CompanyCreateUser {
  CompanyCreateUser({
    this.id,
    this.fullName,
    this.email,
    this.profile,
    this.tads,
    this.createDate,
    this.createUser,
    this.lastUpdateDate,
    this.lastUpdateUser,
    this.isActive,
  });

  int id;
  String fullName;
  String email;
  String profile;
  List<dynamic> tads;
  DateTime createDate;
  CreateUserCreateUser createUser;
  DateTime lastUpdateDate;
  CreateUserCreateUser lastUpdateUser;
  bool isActive;

  factory CompanyCreateUser.fromRawJson(String str) =>
      CompanyCreateUser.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CompanyCreateUser.fromJson(Map<String, dynamic> json) =>
      CompanyCreateUser(
        id: json["id"],
        fullName: json["fullName"],
        email: json["email"],
        profile: json["profile"],
        tads: List<dynamic>.from(json["tads"].map((x) => x)),
        createDate: DateTime.parse(json["createDate"]),
        createUser: CreateUserCreateUser.fromJson(json["createUser"]),
        lastUpdateDate: DateTime.parse(json["lastUpdateDate"]),
        lastUpdateUser: CreateUserCreateUser.fromJson(json["lastUpdateUser"]),
        isActive: json["isActive"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fullName": fullName,
        "email": email,
        "profile": profile,
        "tads": List<dynamic>.from(tads.map((x) => x)),
        "createDate": createDate.toIso8601String(),
        "createUser": createUser.toJson(),
        "lastUpdateDate": lastUpdateDate.toIso8601String(),
        "lastUpdateUser": lastUpdateUser.toJson(),
        "isActive": isActive,
      };
}

class CreateUserCreateUser {
  CreateUserCreateUser({
    this.id,
    this.createDate,
    this.lastUpdateDate,
    this.isActive,
    this.fullName,
    this.profile,
    this.createUser,
    this.lastUpdateUser,
    this.user,
    this.company,
    this.tads,
    this.email,
  });

  int id;
  DateTime createDate;
  DateTime lastUpdateDate;
  bool isActive;
  String fullName;
  String profile;
  int createUser;
  int lastUpdateUser;
  int user;
  int company;
  List<dynamic> tads;
  String email;

  factory CreateUserCreateUser.fromRawJson(String str) =>
      CreateUserCreateUser.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CreateUserCreateUser.fromJson(Map<String, dynamic> json) =>
      CreateUserCreateUser(
        id: json["id"],
        createDate: DateTime.parse(json["createDate"]),
        lastUpdateDate: DateTime.parse(json["lastUpdateDate"]),
        isActive: json["isActive"],
        fullName: json["fullName"],
        profile: json["profile"],
        createUser: json["createUser"],
        lastUpdateUser: json["lastUpdateUser"],
        user: json["user"],
        company: json["company"] == null ? null : json["company"],
        tads: List<dynamic>.from(json["tads"].map((x) => x)),
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "createDate": createDate.toIso8601String(),
        "lastUpdateDate": lastUpdateDate.toIso8601String(),
        "isActive": isActive,
        "fullName": fullName,
        "profile": profile,
        "createUser": createUser,
        "lastUpdateUser": lastUpdateUser,
        "user": user,
        "company": company == null ? null : company,
        "tads": List<dynamic>.from(tads.map((x) => x)),
        "email": email,
      };
}

class Phone {
  Phone({
    this.phone,
    this.description,
  });

  String phone;
  String description;

  factory Phone.fromRawJson(String str) => Phone.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Phone.fromJson(Map<String, dynamic> json) => Phone(
        phone: json["phone"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "phone": phone,
        "description": description,
      };
}
