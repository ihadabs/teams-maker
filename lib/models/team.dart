import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:teams_maker/models/member.dart';

import 'combo.dart';

part 'team.freezed.dart';
part 'team.g.dart';

@freezed
class Team with _$Team {
  const Team._();
  const factory Team({
    required String id,
    required String name,
    required List<Member> members,
  }) = _Team;

  factory Team.fromJson(Map<String, Object?> json) => _$TeamFromJson(json);

  Relation makeRelation(Member m1, Member m2) {
    var m2mScore = 0;

    /// Both like
    if (m1.preferredMembersIds.contains(m2.id) && m2.preferredMembersIds.contains(m1.id)) {
      m2mScore = 30;
    }

    /// Both not like
    else if (m1.unpreferredMembersIds.contains(m2.id) && m2.unpreferredMembersIds.contains(m1.id)) {
      m2mScore = -30;
    }

    ///
    else if (m1.preferredMembersIds.contains(m2.id)) {
      m2mScore = 15;
    } else if (m1.unpreferredMembersIds.contains(m2.id)) {
      m2mScore = -15;
    } else {
      m2mScore = 5;
    }

    return Relation(m1: m1, m2: m2, score: m2mScore);
  }

  int get score {
    Set<Relation> relations = {};

    for (var i = 0; i < members.length; i++) {
      for (var j = 0; j < members.length; j++) {
        final m1 = members[i];
        final m2 = members[j];

        relations.addAll([makeRelation(m1, m2), makeRelation(m2, m1)]);
      }
    }

    return relations.fold(0, (sum, r) => sum + r.score);
  }

  @override
  String toString() {
    return '[${members.join(', ')}]';
  }

  bool containsMember(Member member) {
    return members.contains(member);
  }
}
