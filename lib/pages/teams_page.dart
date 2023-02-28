import 'package:flutter/material.dart';
import 'package:teams_maker/components/back_button.dart';
import 'package:teams_maker/components/member_card.dart';
import 'package:teams_maker/components/title.dart';

class TeamsPage extends StatelessWidget {
  const TeamsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: const [
            TmBackButton(),
            SizedBox(height: 47),
            MyTitle('Team 1'),
            SizedBox(height: 24),
            MemberCard(),
            SizedBox(height: 24),
            MemberCard(),
            SizedBox(height: 24),
            MyTitle('Team 2'),
            SizedBox(height: 24),
            MemberCard(),
            SizedBox(height: 24),
            MemberCard(),
            SizedBox(height: 24),
            MyTitle('Team 3'),
            SizedBox(height: 24),
            MemberCard(),
            SizedBox(height: 24),
            MemberCard(),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
