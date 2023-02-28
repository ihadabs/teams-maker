import 'package:flutter/material.dart';
import 'package:teams_maker/components/add_icon.dart';
import 'package:teams_maker/components/button.dart';
import 'package:teams_maker/components/logo.dart';
import 'package:teams_maker/components/member_card.dart';
import 'package:teams_maker/components/title.dart';
import 'package:teams_maker/pages/add_member_page.dart';
import 'package:teams_maker/pages/teams_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            const Logo(),
            const SizedBox(height: 35),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const MyTitle('All members:'),
                AddIcon(
                  onTap: () {
                    context.openPage(const AddMemberPage());
                  },
                )
              ],
            ),
            const SizedBox(height: 24),
            const MemberCard(),
            const SizedBox(height: 24),
            const MemberCard(),
            const SizedBox(height: 24),
            MyButton(
              title: 'Generate Teams',
              onTap: () {
                context.openPage(const TeamsPage());
              },
            ),
          ],
        ),
      ),
    );
  }
}

extension GG on BuildContext {
  void openPage(Widget page) {
    final navigator = Navigator.of(this);
    navigator.push(MaterialPageRoute(builder: (context) => page));
  }
}
