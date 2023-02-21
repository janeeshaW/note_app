// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotesModel _$NotesModelFromJson(Map<String, dynamic> json) => NotesModel(
      (json['result'] as List<dynamic>)
          .map((e) => ResultGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NotesModelToJson(NotesModel instance) =>
    <String, dynamic>{
      'result': instance.results,
    };

ResultGroup _$ResultGroupFromJson(Map<String, dynamic> json) => ResultGroup(
      id: json['sys_id'] as String?,
      description: json['u_note_description'] as String?,
      title: json['u_note_title'] as String?,
      date: json['u_due_date'] as String?,
    );

Map<String, dynamic> _$ResultGroupToJson(ResultGroup instance) =>
    <String, dynamic>{
      'sys_id': instance.id,
      'u_note_description': instance.description,
      'u_note_title': instance.title,
      'u_due_date': instance.date,
    };
