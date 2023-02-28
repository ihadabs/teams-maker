// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'member.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Member _$MemberFromJson(Map<String, dynamic> json) {
  return _Member.fromJson(json);
}

/// @nodoc
mixin _$Member {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<String> get preferredMembersIds => throw _privateConstructorUsedError;
  List<String> get unpreferredMembersIds => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MemberCopyWith<Member> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemberCopyWith<$Res> {
  factory $MemberCopyWith(Member value, $Res Function(Member) then) =
      _$MemberCopyWithImpl<$Res, Member>;
  @useResult
  $Res call(
      {String id,
      String name,
      List<String> preferredMembersIds,
      List<String> unpreferredMembersIds});
}

/// @nodoc
class _$MemberCopyWithImpl<$Res, $Val extends Member>
    implements $MemberCopyWith<$Res> {
  _$MemberCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? preferredMembersIds = null,
    Object? unpreferredMembersIds = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      preferredMembersIds: null == preferredMembersIds
          ? _value.preferredMembersIds
          : preferredMembersIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      unpreferredMembersIds: null == unpreferredMembersIds
          ? _value.unpreferredMembersIds
          : unpreferredMembersIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MemberCopyWith<$Res> implements $MemberCopyWith<$Res> {
  factory _$$_MemberCopyWith(_$_Member value, $Res Function(_$_Member) then) =
      __$$_MemberCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      List<String> preferredMembersIds,
      List<String> unpreferredMembersIds});
}

/// @nodoc
class __$$_MemberCopyWithImpl<$Res>
    extends _$MemberCopyWithImpl<$Res, _$_Member>
    implements _$$_MemberCopyWith<$Res> {
  __$$_MemberCopyWithImpl(_$_Member _value, $Res Function(_$_Member) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? preferredMembersIds = null,
    Object? unpreferredMembersIds = null,
  }) {
    return _then(_$_Member(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      preferredMembersIds: null == preferredMembersIds
          ? _value._preferredMembersIds
          : preferredMembersIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      unpreferredMembersIds: null == unpreferredMembersIds
          ? _value._unpreferredMembersIds
          : unpreferredMembersIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Member extends _Member {
  const _$_Member(
      {required this.id,
      required this.name,
      required final List<String> preferredMembersIds,
      required final List<String> unpreferredMembersIds})
      : _preferredMembersIds = preferredMembersIds,
        _unpreferredMembersIds = unpreferredMembersIds,
        super._();

  factory _$_Member.fromJson(Map<String, dynamic> json) =>
      _$$_MemberFromJson(json);

  @override
  final String id;
  @override
  final String name;
  final List<String> _preferredMembersIds;
  @override
  List<String> get preferredMembersIds {
    if (_preferredMembersIds is EqualUnmodifiableListView)
      return _preferredMembersIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_preferredMembersIds);
  }

  final List<String> _unpreferredMembersIds;
  @override
  List<String> get unpreferredMembersIds {
    if (_unpreferredMembersIds is EqualUnmodifiableListView)
      return _unpreferredMembersIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_unpreferredMembersIds);
  }

  @override
  String toString() {
    return 'Member(id: $id, name: $name, preferredMembersIds: $preferredMembersIds, unpreferredMembersIds: $unpreferredMembersIds)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Member &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._preferredMembersIds, _preferredMembersIds) &&
            const DeepCollectionEquality()
                .equals(other._unpreferredMembersIds, _unpreferredMembersIds));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      const DeepCollectionEquality().hash(_preferredMembersIds),
      const DeepCollectionEquality().hash(_unpreferredMembersIds));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MemberCopyWith<_$_Member> get copyWith =>
      __$$_MemberCopyWithImpl<_$_Member>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MemberToJson(
      this,
    );
  }
}

abstract class _Member extends Member {
  const factory _Member(
      {required final String id,
      required final String name,
      required final List<String> preferredMembersIds,
      required final List<String> unpreferredMembersIds}) = _$_Member;
  const _Member._() : super._();

  factory _Member.fromJson(Map<String, dynamic> json) = _$_Member.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  List<String> get preferredMembersIds;
  @override
  List<String> get unpreferredMembersIds;
  @override
  @JsonKey(ignore: true)
  _$$_MemberCopyWith<_$_Member> get copyWith =>
      throw _privateConstructorUsedError;
}
