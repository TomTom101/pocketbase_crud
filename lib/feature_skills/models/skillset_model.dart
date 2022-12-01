import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pocketbase_scaffold/pocketbase_scaffold.dart';

import 'proficiency_model.dart';

part 'skillset_model.freezed.dart';
part 'skillset_model.g.dart';

@freezed
class SkillSet extends BaseModel with _$SkillSet {
  const factory SkillSet({
    String? id,
    required User user,
    @Default([]) List<Proficiency> proficiencies,
  }) = _SkillSet;

  factory SkillSet.fromJson(Map<String, Object?> json) =>
      _$SkillSetFromJson(json);
}
