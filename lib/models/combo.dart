import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:teams_maker/models/member.dart';
import 'package:teams_maker/models/team.dart';

part 'combo.freezed.dart';

@freezed
class Combo with _$Combo {
  const Combo._();
  const factory Combo({
    required List<Team> teams,
    required List<Member> members,
  }) = _Combo;

  double get score {
    return teams.map((t) => t.score).sum.toDouble();
  }

  Combo addTeam(Team team) {
    final newTeams = {...teams, team}.toList();
    final newComp = copyWith(teams: newTeams);

    if (newComp.isWrong) return this;
    return newComp;
  }

  bool get isWrong {
    List<Member> teamsMembers = [];
    for (final t in teams) {
      teamsMembers.addAll(t.members);
    }

    if (teamsMembers.length > members.length) return true;

    if (teamsMembers.length != teamsMembers.toSet().length) return true;

    return false;
  }

  bool get isComplete {
    List<Member> teamsMembers = [];
    for (final t in teams) {
      teamsMembers.addAll(t.members);
    }

    if (teamsMembers.length == members.length) return true;

    if (teamsMembers.length > members.length) {
      throw Exception('Teams members more than available members');
    }

    return false;
  }
}

@freezed
class Relation with _$Relation {
  const factory Relation({
    required Member m1,
    required Member m2,
    required int score,
  }) = _Relation;
}
