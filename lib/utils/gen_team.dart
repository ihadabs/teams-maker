import 'package:trotter/trotter.dart';

import '../models/member.dart';
import '../models/team.dart';

List<Team> genTeams(List<Member> members) {
  // final newMembers = List.from(members);
  // newMembers.shuffle();

  // List<Team> teams = [];
  // var i = 0;
  // var teamNumber = 1;
  // var team = Team(id: const Uuid().v4(), name: '$teamNumber', members: []);
  // for (; i < newMembers.length; i++) {
  //   team = team.copyWith(members: [...team.members, newMembers[i]]);
  //   final x = i + 1;
  //   if (x % 3 == 0) {
  //     teams.add(team);
  //     teamNumber++;
  //     team = Team(id: const Uuid().v4(), name: '$teamNumber', members: []);
  //   }
  // }

  const memberCount = 6;
  const teamMemberCount = 2;
  const numberOfTeams = memberCount ~/ teamMemberCount;
  print('numberOfTeams $numberOfTeams');
  final sublist = members.sublist(0, memberCount);

  print('sublist.length: ${sublist.length}');

  final c = Combinations<Member>(2, sublist);

  var i = 1;
  List<Team> allPossibleTeams = [];
  for (final members in c()) {
    i++;
    allPossibleTeams.add(Team(id: '$i', name: 'Team $i', members: members));
  }

  print('allPossibleTeams.length ${allPossibleTeams.length}');

  // if (allPossibleTeams.length != 6) return [];
  // return [];

  getUniqueCombos(allPossibleTeams, numberOfTeams);

  return [];
}

List<List<Team>> getUniqueCombos(List<Team> teams, int numberOfTeams) {
  List<List<Team>> allCompos = [];
  List<Team> allTeamsCopy = List.from(teams);
  List<Team> tempCompo = [];

  var count = 0;
  while (allTeamsCopy.isNotEmpty && count < 100) {
    count++;
    for (var i = 0; i < allTeamsCopy.length; i++) {
      final someTeam = allTeamsCopy[i];
      if (checkIfBelong(someTeam, tempCompo)) {
        tempCompo.add(allTeamsCopy.removeAt(i));

        if (tempCompo.length == numberOfTeams) {
          allCompos.add(tempCompo);
          tempCompo = [];
        }
        break;
      }
    }

    print('All Teams: ${allTeamsCopy.length}');
    print('Made Compos: ${allCompos.length}');
  }

  return [];
}

bool checkIfBelong(Team teamToCheck, List<Team> teams) {
  for (final member in teamToCheck.members) {
    for (final team in teams) {
      if (team.doYouHaveMember(member)) {
        return false;
      }
    }
  }

  print('true');
  return true;
}

/// Teams = 6
/// Members = 18
/// Team Member Count = 3
/// (18C3)/6 = 136
///
///
/// A, B, C, D
/// A+B, C+D
/// A+C, B+D
/// A+D, B+C
