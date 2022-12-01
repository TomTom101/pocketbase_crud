import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pocketbase_scaffold/pocketbase_scaffold.dart';

import 'skill_model.dart';

part 'proficiency_model.freezed.dart';
part 'proficiency_model.g.dart';

@freezed
class Proficiency extends BaseModel with _$Proficiency {
  const factory Proficiency({
    String? id,
    required User user,
    required Skill skill,
    required double level,
  }) = _Proficiency;

  factory Proficiency.fromJson(Map<String, Object?> json) =>
      _$ProficiencyFromJson(json);
}
