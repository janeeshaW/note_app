import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';


/// *** Created By Isuru B. Ranapana *** ///
/// ***     Eyepax IT Consulting     *** ///
/// ***   on 2/21/2023 => 5:38 PM  *** ///

@JsonSerializable()
class UserModel {
  UserModel({
    required this.result,
  });

  @JsonKey(name: "result")
  List<Result> result;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

@JsonSerializable()
class Result {
  Result({
     this.calendarIntegration,
     this.country,
    this.userPassword,
     this.lastLoginTime,
     this.hashedUserId,
     this.source,
     this.sysUpdatedOn,
     this.building,
     this.webServiceAccessOnly,
     this.notification,
     this.enableMultifactorAuthn,
     this.sysUpdatedBy,
     this.sysCreatedOn,
     this.sysDomain,
     this.state,
     this.vip,
     this.sysCreatedBy,
     this.zip,
     this.homePhone,
     this.timeFormat,
     this.lastLogin,
     this.defaultPerspective,
     this.active,
     this.sysDomainPath,
     this.costCenter,
     this.phone,
     this.name,
     this.employeeNumber,
     this.passwordNeedsReset,
     this.gender,
     this.city,
     this.failedAttempts,
     this.userName,
     this.roles,
     this.title,
     this.sysClassName,
     this.sysId,
     this.internalIntegrationUser,
     this.ldapServer,
     this.mobilePhone,
     this.street,
     this.company,
     this.department,
     this.firstName,
     this.email,
     this.introduction,
     this.preferredLanguage,
     this.manager,
     this.lockedOut,
     this.sysModCount,
    this.lastName,
    this.photo,
    this.avatar,
    this.middleName,
    this.sysTags,
    this.timeZone,
    this.schedule,
    this.dateFormat,
    this.location,
  });

  @JsonKey(name: "calendar_integration")
  String? calendarIntegration;
  @JsonKey(name: "country")
  String? country;
  @JsonKey(name: "user_password")
  String? userPassword;
  @JsonKey(name: "last_login_time")
  DateTime? lastLoginTime;
  @JsonKey(name: "hashed_user_id")
  String? hashedUserId;
  @JsonKey(name: "source")
  String? source;
  @JsonKey(name: "sys_updated_on")
  DateTime? sysUpdatedOn;
  @JsonKey(name: "building")
  String? building;
  @JsonKey(name: "web_service_access_only")
  String? webServiceAccessOnly;
  @JsonKey(name: "notification")
  String? notification;
  @JsonKey(name: "enable_multifactor_authn")
  String ?enableMultifactorAuthn;
  @JsonKey(name: "sys_updated_by")
  String ?sysUpdatedBy;
  @JsonKey(name: "sys_created_on")
  DateTime? sysCreatedOn;
  @JsonKey(name: "sys_domain")
  SysDomain? sysDomain;
  @JsonKey(name: "state")
  String? state;
  @JsonKey(name: "vip")
  String? vip;
  @JsonKey(name: "sys_created_by")
  String ?sysCreatedBy;
  @JsonKey(name: "zip")
  String? zip;
  @JsonKey(name: "home_phone")
  String? homePhone;
  @JsonKey(name: "time_format")
  String ?timeFormat;
  @JsonKey(name: "last_login")
  DateTime? lastLogin;
  @JsonKey(name: "default_perspective")
  String ?defaultPerspective;
  @JsonKey(name: "active")
  String? active;
  @JsonKey(name: "sys_domain_path")
  String? sysDomainPath;
  @JsonKey(name: "cost_center")
  String ?costCenter;
  @JsonKey(name: "phone")
  String ?phone;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "employee_number")
  String? employeeNumber;
  @JsonKey(name: "password_needs_reset")
  String? passwordNeedsReset;
  @JsonKey(name: "gender")
  String? gender;
  @JsonKey(name: "city")
  String ?city;
  @JsonKey(name: "failed_attempts")
  String? failedAttempts;
  @JsonKey(name: "user_name")
  String? userName;
  @JsonKey(name: "roles")
  String? roles;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "sys_class_name")
  String? sysClassName;
  @JsonKey(name: "sys_id")
  String? sysId;
  @JsonKey(name: "internal_integration_user")
  String? internalIntegrationUser;
  @JsonKey(name: "ldap_server")
  String? ldapServer;
  @JsonKey(name: "mobile_phone")
  String? mobilePhone;
  @JsonKey(name: "street")
  String? street;
  @JsonKey(name: "company")
  String? company;
  @JsonKey(name: "department")
  String? department;
  @JsonKey(name: "first_name")
  String? firstName;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "introduction")
  String? introduction;
  @JsonKey(name: "preferred_language")
  String? preferredLanguage;
  @JsonKey(name: "manager")
  String? manager;
  @JsonKey(name: "locked_out")
  String? lockedOut;
  @JsonKey(name: "sys_mod_count")
  String? sysModCount;
  @JsonKey(name: "last_name")
  String? lastName;
  @JsonKey(name: "photo")
  String? photo;
  @JsonKey(name: "avatar")
  String? avatar;
  @JsonKey(name: "middle_name")
  String? middleName;
  @JsonKey(name: "sys_tags")
  String? sysTags;
  @JsonKey(name: "time_zone")
  String? timeZone;
  @JsonKey(name: "schedule")
  String? schedule;
  @JsonKey(name: "date_format")
  String? dateFormat;
  @JsonKey(name: "location")
  String? location;

  factory Result.fromJson(Map<String, dynamic> json) =>
      _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}

@JsonSerializable()
class SysDomain {
  SysDomain({
    this.link,
    this.value,
  });

  @JsonKey(name: "link")
  String? link;
  @JsonKey(name: "value")
  String? value;

  factory SysDomain.fromJson(Map<String, dynamic> json) =>
      _$SysDomainFromJson(json);

  Map<String, dynamic> toJson() => _$SysDomainToJson(this);
}
