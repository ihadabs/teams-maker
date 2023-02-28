import 'package:flutter/material.dart';
import 'package:teams_maker/components/back_button.dart';
import 'package:teams_maker/components/member_card.dart';
import 'package:teams_maker/components/title.dart';

import '../models/team.dart';

class TeamsPage extends StatelessWidget {
  const TeamsPage(this.teams, {super.key});

  final List<Team> teams;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            const TmBackButton(),
            const SizedBox(height: 47),
            for (final team in teams) ...[
              MyTitle('Team ${team.name}'),
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
