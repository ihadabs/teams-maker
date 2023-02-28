import 'package:flutter/material.dart';
import 'package:teams_maker/components/add_icon.dart';
import 'package:teams_maker/components/back_button.dart';
import 'package:teams_maker/components/member_card.dart';
import 'package:teams_maker/components/title.dart';
import 'package:teams_maker/pages/select_member_page.dart';

class MemberPage extends StatelessWidget {
  const MemberPage({super.key});

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
            const MemberCard(),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const MyTitle('Preferred Members:'),
                AddIcon(
                  onTap: () {
                    showModalBottomSheet(context: context, builder: (_) => const SelectMemberPage());
                  },
                ),
              ],
            ),
            const SizedBox(height: 24),
            const MemberCard(),
            const SizedBox(height: 24),
            const MemberCard(),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [MyTitle('Unpreferred Members:'), AddIcon()],
            ),
            const SizedBox(height: 24),
            const MemberCard(),
            const SizedBox(height: 24),
            const MemberCard(),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
