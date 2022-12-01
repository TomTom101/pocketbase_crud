// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'skillset_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SkillSet _$SkillSetFromJson(Map<String, dynamic> json) {
  return _SkillSet.fromJson(json);
}

/// @nodoc
mixin _$SkillSet {
  String? get id => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;
  List<Proficiency> get proficiencies => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SkillSetCopyWith<SkillSet> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SkillSetCopyWith<$Res> {
  factory $SkillSetCopyWith(SkillSet value, $Res Function(SkillSet) then) =
      _$SkillSetCopyWithImpl<$Res, SkillSet>;
  @useResult
  $Res call({String? id, User user, List<Proficiency> proficiencies});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$SkillSetCopyWithImpl<$Res, $Val extends SkillSet>
    implements $SkillSetCopyWith<$Res> {
  _$SkillSetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? user = null,
    Object? proficiencies = null,
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
      proficiencies: null == proficiencies
          ? _value.proficiencies
          : proficiencies // ignore: cast_nullable_to_non_nullable
              as List<Proficiency>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_SkillSetCopyWith<$Res> implements $SkillSetCopyWith<$Res> {
  factory _$$_SkillSetCopyWith(
          _$_SkillSet value, $Res Function(_$_SkillSet) then) =
      __$$_SkillSetCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, User user, List<Proficiency> proficiencies});

  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$_SkillSetCopyWithImpl<$Res>
    extends _$SkillSetCopyWithImpl<$Res, _$_SkillSet>
    implements _$$_SkillSetCopyWith<$Res> {
  __$$_SkillSetCopyWithImpl(
      _$_SkillSet _value, $Res Function(_$_SkillSet) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? user = null,
    Object? proficiencies = null,
  }) {
    return _then(_$_SkillSet(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      proficiencies: null == proficiencies
          ? _value._proficiencies
          : proficiencies // ignore: cast_nullable_to_non_nullable
              as List<Proficiency>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SkillSet with DiagnosticableTreeMixin implements _SkillSet {
  const _$_SkillSet(
      {this.id,
      required this.user,
      final List<Proficiency> proficiencies = const []})
      : _proficiencies = proficiencies;

  factory _$_SkillSet.fromJson(Map<String, dynamic> json) =>
      _$$_SkillSetFromJson(json);

  @override
  final String? id;
  @override
  final User user;
  final List<Proficiency> _proficiencies;
  @override
  @JsonKey()
  List<Proficiency> get proficiencies {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_proficiencies);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SkillSet(id: $id, user: $user, proficiencies: $proficiencies)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SkillSet'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('user', user))
      ..add(DiagnosticsProperty('proficiencies', proficiencies));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SkillSet &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.user, user) || other.user == user) &&
            const DeepCollectionEquality()
                .equals(other._proficiencies, _proficiencies));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, user,
      const DeepCollectionEquality().hash(_proficiencies));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SkillSetCopyWith<_$_SkillSet> get copyWith =>
      __$$_SkillSetCopyWithImpl<_$_SkillSet>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SkillSetToJson(
      this,
    );
  }
}

abstract class _SkillSet implements SkillSet {
  const factory _SkillSet(
      {final String? id,
      required final User user,
      final List<Proficiency> proficiencies}) = _$_SkillSet;

  factory _SkillSet.fromJson(Map<String, dynamic> json) = _$_SkillSet.fromJson;

  @override
  String? get id;
  @override
  User get user;
  @override
  List<Proficiency> get proficiencies;
  @override
  @JsonKey(ignore: true)
  _$$_SkillSetCopyWith<_$_SkillSet> get copyWith =>
      throw _privateConstructorUsedError;
}
