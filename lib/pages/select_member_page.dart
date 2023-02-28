import 'package:flutter/material.dart';
import 'package:teams_maker/components/member_card.dart';
import 'package:teams_maker/components/title.dart';

class SelectMemberPage extends StatelessWidget {
  const SelectMemberPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [MyTitle('Select member:')],
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
