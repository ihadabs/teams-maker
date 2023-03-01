import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:teams_maker/components/back_button.dart';
import 'package:teams_maker/components/button.dart';
import 'package:teams_maker/components/member_card.dart';
import 'package:teams_maker/components/title.dart';

import '../models/team.dart';

class TeamsPage extends HookWidget {
  const TeamsPage(this.listTeams, {super.key});

  final List<List<Team>> listTeams;

  @override
  Widget build(BuildContext context) {
    final index = useState(0);
    final teams = listTeams[index.value];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            const TmBackButton(),
            Row(
              children: [
                MyButton(
                  title: '<>',
                  onTap: () {
                    if (index.value == listTeams.length - 1) {
                      index.value = 0;
                    } else {
                      index.value++;
                    }
                  },
                ),
              ],
            ),
            const SizedBox(height: 47),
            for (final team in teams) ...[
              MyTitle('Team ${team.score}'),
              const SizedBox(height: 10),
              for (final teamMember in team.members) ...[
                MemberCard(teamMember),
                const SizedBox(height: 10),
              ],
              const SizedBox(height: 24),
            ],
          ],
        ),
      ),
    );
  }
}
