import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:teams_maker/components/add_icon.dart';
import 'package:teams_maker/components/back_button.dart';
import 'package:teams_maker/components/member_card.dart';
import 'package:teams_maker/components/title.dart';
import 'package:teams_maker/models/member.dart';
import 'package:teams_maker/pages/home_page.dart';
import 'package:teams_maker/pages/select_member_page.dart';

class MemberPage extends StatelessWidget {
  const MemberPage(this.memberId, {super.key});

  final String memberId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: StreamBuilder(
          stream: Member.collection().doc(memberId).snapshots(),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return const LoadingIndicator(size: 50, borderWidth: 4);
            }

            final member = snapshot.data!.data()!;

            return StreamBuilder(
              stream: Member.collectionOrdered().toListStream(),
              builder: (context, snapshot) {
                if (snapshot.data == null) {
                  return const LoadingIndicator(size: 50, borderWidth: 1);
                }

                final members = snapshot.data ?? [];
                final preferredMembers = members.where((m) => member.preferredMembersIds.contains(m.id)).toList();
                final unpreferredMembers = members.where((m) => member.unpreferredMembersIds.contains(m.id)).toList();

                return ListView(
                  padding: const EdgeInsets.all(24),
                  children: [
                    const TmBackButton(),
                    const SizedBox(height: 47),
                    MemberCard(member, isClickable: false),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const MyTitle('Preferred Members:'),
                        AddIcon(
                          onTap: () {
                            showModalBottomSheet(
                                context: context, builder: (_) => SelectMemberPage(currentMember: member));
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        for (final member in preferredMembers) ...[
                          MemberCard(member),
                          const SizedBox(height: 10),
                        ],
                      ],
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const MyTitle('Unpreferred Members:'),
                        AddIcon(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (_) => SelectMemberPage(currentMember: member, addToPreferredMembers: false),
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        for (final member in unpreferredMembers) ...[
                          MemberCard(member),
                          const SizedBox(height: 10),
                        ],
                      ],
                    ),
                    const SizedBox(height: 24),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
