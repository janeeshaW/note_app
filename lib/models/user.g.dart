// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      result: (json['result'] as List<dynamic>)
          .map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'result': instance.result,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      calendarIntegration: json['calendar_integration'] as String?,
      country: json['country'] as String?,
      userPassword: json['user_password'] as String?,
      lastLoginTime: json['last_login_time'] == null
          ? null
          : DateTime.parse(json['last_login_time'] as String),
      hashedUserId: json['hashed_user_id'] as String?,
      source: json['source'] as String?,
      sysUpdatedOn: json['sys_updated_on'] == null
          ? null
          : DateTime.parse(json['sys_updated_on'] as String),
      building: json['building'] as String?,
      webServiceAccessOnly: json['web_service_access_only'] as String?,
      notification: json['notification'] as String?,
      enableMultifactorAuthn: json['enable_multifactor_authn'] as String?,
      sysUpdatedBy: json['sys_updated_by'] as String?,
      sysCreatedOn: json['sys_created_on'] == null
          ? null
          : DateTime.parse(json['sys_created_on'] as String),
      sysDomain: json['sys_domain'] == null
          ? null
          : SysDomain.fromJson(json['sys_domain'] as Map<String, dynamic>),
      state: json['state'] as String?,
      vip: json['vip'] as String?,
      sysCreatedBy: json['sys_created_by'] as String?,
      zip: json['zip'] as String?,
      homePhone: json['home_phone'] as String?,
      timeFormat: json['time_format'] as String?,
      lastLogin: json['last_login'] == null
          ? null
          : DateTime.parse(json['last_login'] as String),
      defaultPerspective: json['default_perspective'] as String?,
      active: json['active'] as String?,
      sysDomainPath: json['sys_domain_path'] as String?,
      costCenter: json['cost_center'] as String?,
      phone: json['phone'] as String?,
      name: json['name'] as String?,
      employeeNumber: json['employee_number'] as String?,
      passwordNeedsReset: json['password_needs_reset'] as String?,
      gender: json['gender'] as String?,
      city: json['city'] as String?,
      failedAttempts: json['failed_attempts'] as String?,
      userName: json['user_name'] as String?,
      roles: json['roles'] as String?,
      title: json['title'] as String?,
      sysClassName: json['sys_class_name'] as String?,
      sysId: json['sys_id'] as String?,
      internalIntegrationUser: json['internal_integration_user'] as String?,
      ldapServer: json['ldap_server'] as String?,
      mobilePhone: json['mobile_phone'] as String?,
      street: json['street'] as String?,
      company: json['company'] as String?,
      department: json['department'] as String?,
      firstName: json['first_name'] as String?,
      email: json['email'] as String?,
      introduction: json['introduction'] as String?,
      preferredLanguage: json['preferred_language'] as String?,
      manager: json['manager'] as String?,
      lockedOut: json['locked_out'] as String?,
      sysModCount: json['sys_mod_count'] as String?,
      lastName: json['last_name'] as String?,
      photo: json['photo'] as String?,
      avatar: json['avatar'] as String?,
      middleName: json['middle_name'] as String?,
      sysTags: json['sys_tags'] as String?,
      timeZone: json['time_zone'] as String?,
      schedule: json['schedule'] as String?,
      dateFormat: json['date_format'] as String?,
      location: json['location'] as String?,
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'calendar_integration': instance.calendarIntegration,
      'country': instance.country,
      'user_password': instance.userPassword,
      'last_login_time': instance.lastLoginTime?.toIso8601String(),
      'hashed_user_id': instance.hashedUserId,
      'source': instance.source,
      'sys_updated_on': instance.sysUpdatedOn?.toIso8601String(),
      'building': instance.building,
      'web_service_access_only': instance.webServiceAccessOnly,
      'notification': instance.notification,
      'enable_multifactor_authn': instance.enableMultifactorAuthn,
      'sys_updated_by': instance.sysUpdatedBy,
      'sys_created_on': instance.sysCreatedOn?.toIso8601String(),
      'sys_domain': instance.sysDomain,
      'state': instance.state,
      'vip': instance.vip,
      'sys_created_by': instance.sysCreatedBy,
      'zip': instance.zip,
      'home_phone': instance.homePhone,
      'time_format': instance.timeFormat,
      'last_login': instance.lastLogin?.toIso8601String(),
      'default_perspective': instance.defaultPerspective,
      'active': instance.active,
      'sys_domain_path': instance.sysDomainPath,
      'cost_center': instance.costCenter,
      'phone': instance.phone,
      'name': instance.name,
      'employee_number': instance.employeeNumber,
      'password_needs_reset': instance.passwordNeedsReset,
      'gender': instance.gender,
      'city': instance.city,
      'failed_attempts': instance.failedAttempts,
      'user_name': instance.userName,
      'roles': instance.roles,
      'title': instance.title,
      'sys_class_name': instance.sysClassName,
      'sys_id': instance.sysId,
      'internal_integration_user': instance.internalIntegrationUser,
      'ldap_server': instance.ldapServer,
      'mobile_phone': instance.mobilePhone,
      'street': instance.street,
      'company': instance.company,
      'department': instance.department,
      'first_name': instance.firstName,
      'email': instance.email,
      'introduction': instance.introduction,
      'preferred_language': instance.preferredLanguage,
      'manager': instance.manager,
      'locked_out': instance.lockedOut,
      'sys_mod_count': instance.sysModCount,
      'last_name': instance.lastName,
      'photo': instance.photo,
      'avatar': instance.avatar,
      'middle_name': instance.middleName,
      'sys_tags': instance.sysTags,
      'time_zone': instance.timeZone,
      'schedule': instance.schedule,
      'date_format': instance.dateFormat,
      'location': instance.location,
    };

SysDomain _$SysDomainFromJson(Map<String, dynamic> json) => SysDomain(
      link: json['link'] as String?,
      value: json['value'] as String?,
    );

Map<String, dynamic> _$SysDomainToJson(SysDomain instance) => <String, dynamic>{
      'link': instance.link,
      'value': instance.value,
    };
