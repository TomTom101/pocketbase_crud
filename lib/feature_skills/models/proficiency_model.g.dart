// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proficiency_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Proficiency _$$_ProficiencyFromJson(Map<String, dynamic> json) =>
    _$_Proficiency(
      id: json['id'] as String?,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      skill: Skill.fromJson(json['skill'] as Map<String, dynamic>),
      level: (json['level'] as num).toDouble(),
    );

Map<String, dynamic> _$$_ProficiencyToJson(_$_Proficiency instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'skill': instance.skill,
      'level': instance.level,
    };
