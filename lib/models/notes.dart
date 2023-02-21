import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notes.g.dart';

/// A class used to represent the OAuth token used for accessing a users data
@JsonSerializable()
// ignore: must_be_immutable
class NotesModel extends Equatable {
  NotesModel(
      this.results);

  @JsonKey(name: "result")
  List<ResultGroup> results;

  factory NotesModel.fromJson(Map<String, dynamic> json) =>
      _$NotesModelFromJson(json);

  Map<String, dynamic> toJson() => _$NotesModelToJson(this);

  @override
  List<Object?> get props =>
      [results];
}

@JsonSerializable()
// ignore: must_be_immutable
class ResultGroup extends Equatable {
  @JsonKey(name: "sys_id")
  String? id;

  @JsonKey(name: "u_note_description")
  String? description;

  @JsonKey(name: "u_note_title")
  String? title;

  @JsonKey(name: "u_due_date")
  String? date;

  ResultGroup({
    this.id,
    this.description,
    this.title,
    this.date,
  });

  factory ResultGroup.fromJson(Map<String, dynamic> json) =>
      _$ResultGroupFromJson(json);

  Map<String, dynamic> toJson() => _$ResultGroupToJson(this);

  @override
  List<Object?> get props => [
    id,
    description,
    title,
    date,
  ];
}