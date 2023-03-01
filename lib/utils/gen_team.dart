import 'package:collection/collection.dart';
import 'package:teams_maker/models/combo.dart';
import 'package:trotter/trotter.dart';

import '../models/member.dart';
import '../models/team.dart';

var x = 0;

void tmLogger(String somText) {
  if (x < 50) {
    print(somText);
    // x++;
  }
}

List<Team> genAllPossibleTeams(List<Member> members) {
  final sublist = members;
  final memberCount = sublist.length;
  const teamMemberCount = 3;
  final numberOfTeams = memberCount ~/ teamMemberCount;
  tmLogger('Number of teams: $numberOfTeams');
  tmLogger('Number of members: ${sublist.length}');

  final c = Combinations<Member>(teamMemberCount, sublist);

  var i = 1;
  List<Team> allPossibleTeams = [];
  for (final members in c()) {
    i++;
    allPossibleTeams.add(Team(id: '$i', name: 'Team $i', members: members));
    // tmLogger(members.map((e) => e.toString()).join(', '));
  }

  // tmLogger('All Possible Teams ${allPossibleTeams.length}');

  return allPossibleTeams;
}

List<List<Team>> genTeams(List<Member> members) {
  // final sublist = members.sublist(0, 4);
  // final memberCount = sublist.length;
  // const teamMemberCount = 2;
  // final numberOfTeams = memberCount ~/ teamMemberCount;
  final allPossibleTeams = genAllPossibleTeams(members);

  Map<String, List<Team>> teamsByMember = {};

  for (final member in members) {
    teamsByMember[member.name] = List.from(allPossibleTeams.where((t) => t.containsMember(member)).toList());
  }

  List<Combo> allCompos = [];

  for (final memberName in teamsByMember.keys) {
    final memberCombinations = teamsByMember[memberName] ?? [];
    for (final combination in memberCombinations) {
      var newCombo = Combo(
        teams: [combination],
        members: members,
      );

      for (final t in allPossibleTeams) {
        newCombo = newCombo.addTeam(t);
        if (newCombo.isComplete) {
          allCompos.add(newCombo);
          break;
        }
      }
    }

    // print('$memberName: ${memberCombinations.length}');
  }

  // print('allCompos ${allCompos.length}');

  final sortedCompos = allCompos.sorted((a, b) => (b.score - a.score).round());

  print(sortedCompos.sublist(0, 15).map((e) => e.score));

  // getUniqueCombos(allPossibleTeams, numberOfTeams);

  return sortedCompos.sublist(0, 4).map((e) => e.teams).toList();
}

List<List<Team>> getUniqueCombos(List<Team> teams, int numberOfTeams) {
  List<List<Team>> allCompos = [];
  List<Team> allTeamsCopy = List.from(teams);
  List<Team> tempCompo = [];

  var count = 0;
  while (allTeamsCopy.isNotEmpty && count < 2000) {
    count++;

    final belongTeam = allTeamsCopy.firstWhereOrNull((t) => checkIfBelong(t, tempCompo));

    if (belongTeam != null) {
      tempCompo.add(belongTeam);
      allTeamsCopy.remove(belongTeam);

      if (tempCompo.length == numberOfTeams) {
        allCompos.add(tempCompo);
        tempCompo = [];
      }
    } else {
      break;
    }
  }

  // tmLogger('Left Teams: $allTeamsCopy');
  // tmLogger('Failed compo: $tempCompo');

  // for (final t in allCompos) {
  //   print('Made compo: $t');
  // }

  tmLogger('Made Compos: ${allCompos.length}');
  tmLogger('Left Teams: ${allTeamsCopy.length}');
  print('count $count');

  return [];
}

bool checkIfBelong(Team teamToCheck, List<Team> teams) {
  if (teams.isEmpty) return true;

  for (final member in teamToCheck.members) {
    if (teams.any((t) => t.containsMember(member))) {
      return false;
    }
  }

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


//  Hana, Hussam
//  Hana, Lama
//  Hana, Luluah
//  Hana, Maryam
//  Hana, Mashael
//  Hussam, Lama
//  Hussam, Luluah
//  Hussam, Maryam
//  Hussam, Mashael



/// All combinations
/// Group by member
/// Options = 
///   Loop through members
///     Loop through each member combinations
///       take a combination and try to complete it with any other combination
///       when selecting other combinations prioritize unused combinations