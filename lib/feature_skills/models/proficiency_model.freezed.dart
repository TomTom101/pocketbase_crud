// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'proficiency_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Proficiency _$ProficiencyFromJson(Map<String, dynamic> json) {
  return _Proficiency.fromJson(json);
}

/// @nodoc
mixin _$Proficiency {
  String? get id => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;
  Skill get skill => throw _privateConstructorUsedError;
  double get level => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProficiencyCopyWith<Proficiency> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProficiencyCopyWith<$Res> {
  factory $ProficiencyCopyWith(
          Proficiency value, $Res Function(Proficiency) then) =
      _$ProficiencyCopyWithImpl<$Res, Proficiency>;
  @useResult
  $Res call({String? id, User user, Skill skill, double level});

  $UserCopyWith<$Res> get user;
  $SkillCopyWith<$Res> get skill;
}

/// @nodoc
class _$ProficiencyCopyWithImpl<$Res, $Val extends Proficiency>
    implements $ProficiencyCopyWith<$Res> {
  _$ProficiencyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? user = null,
    Object? skill = null,
    Object? level = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      skill: null == skill
          ? _value.skill
          : skill // ignore: cast_nullable_to_non_nullable
              as Skill,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SkillCopyWith<$Res> get skill {
    return $SkillCopyWith<$Res>(_value.skill, (value) {
      return _then(_value.copyWith(skill: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ProficiencyCopyWith<$Res>
    implements $ProficiencyCopyWith<$Res> {
  factory _$$_ProficiencyCopyWith(
          _$_Proficiency value, $Res Function(_$_Proficiency) then) =
      __$$_ProficiencyCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, User user, Skill skill, double level});

  @override
  $UserCopyWith<$Res> get user;
  @override
  $SkillCopyWith<$Res> get skill;
}

/// @nodoc
class __$$_ProficiencyCopyWithImpl<$Res>
    extends _$ProficiencyCopyWithImpl<$Res, _$_Proficiency>
    implements _$$_ProficiencyCopyWith<$Res> {
  __$$_ProficiencyCopyWithImpl(
      _$_Proficiency _value, $Res Function(_$_Proficiency) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? user = null,
    Object? skill = null,
    Object? level = null,
  }) {
    return _then(_$_Proficiency(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      skill: null == skill
          ? _value.skill
          : skill // ignore: cast_nullable_to_non_nullable
              as Skill,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Proficiency with DiagnosticableTreeMixin implements _Proficiency {
  const _$_Proficiency(
      {this.id, required this.user, required this.skill, required this.level});

  factory _$_Proficiency.fromJson(Map<String, dynamic> json) =>
      _$$_ProficiencyFromJson(json);

  @override
  final String? id;
  @override
  final User user;
  @override
  final Skill skill;
  @override
  final double level;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Proficiency(id: $id, user: $user, skill: $skill, level: $level)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Proficiency'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('user', user))
      ..add(DiagnosticsProperty('skill', skill))
      ..add(DiagnosticsProperty('level', level));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Proficiency &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.skill, skill) || other.skill == skill) &&
            (identical(other.level, level) || other.level == level));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, user, skill, level);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProficiencyCopyWith<_$_Proficiency> get copyWith =>
      __$$_ProficiencyCopyWithImpl<_$_Proficiency>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProficiencyToJson(
      this,
    );
  }
}

abstract class _Proficiency implements Proficiency {
  const factory _Proficiency(
      {final String? id,
      required final User user,
      required final Skill skill,
      required final double level}) = _$_Proficiency;

  factory _Proficiency.fromJson(Map<String, dynamic> json) =
      _$_Proficiency.fromJson;

  @override
  String? get id;
  @override
  User get user;
  @override
  Skill get skill;
  @override
  double get level;
  @override
  @JsonKey(ignore: true)
  _$$_ProficiencyCopyWith<_$_Proficiency> get copyWith =>
      throw _privateConstructorUsedError;
}
