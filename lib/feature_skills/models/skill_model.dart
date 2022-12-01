import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pocketbase_scaffold/pocketbase_scaffold.dart';

part 'skill_model.freezed.dart';
part 'skill_model.g.dart';

@freezed
class Skill extends BaseModel with _$Skill {
  const factory Skill({
    String? id,
    required String name,
  }) = _Skill;

  factory Skill.fromJson(Map<String, Object?> json) => _$SkillFromJson(json);
}
