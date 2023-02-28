// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Member _$$_MemberFromJson(Map<String, dynamic> json) => _$_Member(
      id: json['id'] as String,
      name: json['name'] as String,
      preferredMembersIds: (json['preferredMembersIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      unpreferredMembersIds: (json['unpreferredMembersIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_MemberToJson(_$_Member instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'preferredMembersIds': instance.preferredMembersIds,
      'unpreferredMembersIds': instance.unpreferredMembersIds,
    };
