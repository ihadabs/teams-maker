// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'combo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Combo {
  List<Team> get teams => throw _privateConstructorUsedError;
  List<Member> get members => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ComboCopyWith<Combo> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ComboCopyWith<$Res> {
  factory $ComboCopyWith(Combo value, $Res Function(Combo) then) =
      _$ComboCopyWithImpl<$Res, Combo>;
  @useResult
  $Res call({List<Team> teams, List<Member> members});
}

/// @nodoc
class _$ComboCopyWithImpl<$Res, $Val extends Combo>
    implements $ComboCopyWith<$Res> {
  _$ComboCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? teams = null,
    Object? members = null,
  }) {
    return _then(_value.copyWith(
      teams: null == teams
          ? _value.teams
          : teams // ignore: cast_nullable_to_non_nullable
              as List<Team>,
      members: null == members
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<Member>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ComboCopyWith<$Res> implements $ComboCopyWith<$Res> {
  factory _$$_ComboCopyWith(_$_Combo value, $Res Function(_$_Combo) then) =
      __$$_ComboCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Team> teams, List<Member> members});
}

/// @nodoc
class __$$_ComboCopyWithImpl<$Res> extends _$ComboCopyWithImpl<$Res, _$_Combo>
    implements _$$_ComboCopyWith<$Res> {
  __$$_ComboCopyWithImpl(_$_Combo _value, $Res Function(_$_Combo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? teams = null,
    Object? members = null,
  }) {
    return _then(_$_Combo(
      teams: null == teams
          ? _value._teams
          : teams // ignore: cast_nullable_to_non_nullable
              as List<Team>,
      members: null == members
          ? _value._members
          : members // ignore: cast_nullable_to_non_nullable
              as List<Member>,
    ));
  }
}

/// @nodoc

class _$_Combo extends _Combo {
  const _$_Combo(
      {required final List<Team> teams, required final List<Member> members})
      : _teams = teams,
        _members = members,
        super._();

  final List<Team> _teams;
  @override
  List<Team> get teams {
    if (_teams is EqualUnmodifiableListView) return _teams;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_teams);
  }

  final List<Member> _members;
  @override
  List<Member> get members {
    if (_members is EqualUnmodifiableListView) return _members;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_members);
  }

  @override
  String toString() {
    return 'Combo(teams: $teams, members: $members)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Combo &&
            const DeepCollectionEquality().equals(other._teams, _teams) &&
            const DeepCollectionEquality().equals(other._members, _members));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_teams),
      const DeepCollectionEquality().hash(_members));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ComboCopyWith<_$_Combo> get copyWith =>
      __$$_ComboCopyWithImpl<_$_Combo>(this, _$identity);
}

abstract class _Combo extends Combo {
  const factory _Combo(
      {required final List<Team> teams,
      required final List<Member> members}) = _$_Combo;
  const _Combo._() : super._();

  @override
  List<Team> get teams;
  @override
  List<Member> get members;
  @override
  @JsonKey(ignore: true)
  _$$_ComboCopyWith<_$_Combo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Relation {
  Member get m1 => throw _privateConstructorUsedError;
  Member get m2 => throw _privateConstructorUsedError;
  int get score => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RelationCopyWith<Relation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RelationCopyWith<$Res> {
  factory $RelationCopyWith(Relation value, $Res Function(Relation) then) =
      _$RelationCopyWithImpl<$Res, Relation>;
  @useResult
  $Res call({Member m1, Member m2, int score});

  $MemberCopyWith<$Res> get m1;
  $MemberCopyWith<$Res> get m2;
}

/// @nodoc
class _$RelationCopyWithImpl<$Res, $Val extends Relation>
    implements $RelationCopyWith<$Res> {
  _$RelationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? m1 = null,
    Object? m2 = null,
    Object? score = null,
  }) {
    return _then(_value.copyWith(
      m1: null == m1
          ? _value.m1
          : m1 // ignore: cast_nullable_to_non_nullable
              as Member,
      m2: null == m2
          ? _value.m2
          : m2 // ignore: cast_nullable_to_non_nullable
              as Member,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MemberCopyWith<$Res> get m1 {
    return $MemberCopyWith<$Res>(_value.m1, (value) {
      return _then(_value.copyWith(m1: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MemberCopyWith<$Res> get m2 {
    return $MemberCopyWith<$Res>(_value.m2, (value) {
      return _then(_value.copyWith(m2: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_RelationCopyWith<$Res> implements $RelationCopyWith<$Res> {
  factory _$$_RelationCopyWith(
          _$_Relation value, $Res Function(_$_Relation) then) =
      __$$_RelationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Member m1, Member m2, int score});

  @override
  $MemberCopyWith<$Res> get m1;
  @override
  $MemberCopyWith<$Res> get m2;
}

/// @nodoc
class __$$_RelationCopyWithImpl<$Res>
    extends _$RelationCopyWithImpl<$Res, _$_Relation>
    implements _$$_RelationCopyWith<$Res> {
  __$$_RelationCopyWithImpl(
      _$_Relation _value, $Res Function(_$_Relation) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? m1 = null,
    Object? m2 = null,
    Object? score = null,
  }) {
    return _then(_$_Relation(
      m1: null == m1
          ? _value.m1
          : m1 // ignore: cast_nullable_to_non_nullable
              as Member,
      m2: null == m2
          ? _value.m2
          : m2 // ignore: cast_nullable_to_non_nullable
              as Member,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Relation implements _Relation {
  const _$_Relation({required this.m1, required this.m2, required this.score});

  @override
  final Member m1;
  @override
  final Member m2;
  @override
  final int score;

  @override
  String toString() {
    return 'Relation(m1: $m1, m2: $m2, score: $score)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Relation &&
            (identical(other.m1, m1) || other.m1 == m1) &&
            (identical(other.m2, m2) || other.m2 == m2) &&
            (identical(other.score, score) || other.score == score));
  }

  @override
  int get hashCode => Object.hash(runtimeType, m1, m2, score);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RelationCopyWith<_$_Relation> get copyWith =>
      __$$_RelationCopyWithImpl<_$_Relation>(this, _$identity);
}

abstract class _Relation implements Relation {
  const factory _Relation(
      {required final Member m1,
      required final Member m2,
      required final int score}) = _$_Relation;

  @override
  Member get m1;
  @override
  Member get m2;
  @override
  int get score;
  @override
  @JsonKey(ignore: true)
  _$$_RelationCopyWith<_$_Relation> get copyWith =>
      throw _privateConstructorUsedError;
}
