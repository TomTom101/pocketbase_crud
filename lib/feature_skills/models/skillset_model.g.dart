// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skillset_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SkillSet _$$_SkillSetFromJson(Map<String, dynamic> json) => _$_SkillSet(
      id: json['id'] as String?,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      proficiencies: (json['proficiencies'] as List<dynamic>?)
              ?.map((e) => Proficiency.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_SkillSetToJson(_$_SkillSet instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'proficiencies': instance.proficiencies,
    };
