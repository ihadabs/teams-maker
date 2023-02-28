import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:teams_maker/components/member_card.dart';
import 'package:teams_maker/components/title.dart';
import 'package:teams_maker/models/member.dart';
import 'package:teams_maker/pages/home_page.dart';

class SelectMemberPage extends StatelessWidget {
  const SelectMemberPage({super.key, required this.currentMember, this.addToPreferredMembers = true});

  final Member currentMember;
  final bool addToPreferredMembers;

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
            StreamBuilder(
              stream: Member.collectionOrdered().toListStream(),
              builder: (context, snapshot) {
                if (snapshot.data == null) {
                  return const LoadingIndicator(size: 50, borderWidth: 1);
                }

                final members = (snapshot.data ?? []).where((m) => m.id != currentMember.id).toList();
                final membersToShow = members
                    .where(
                      (m) =>
                          !currentMember.preferredMembersIds.contains(m.id) &&
                          !currentMember.unpreferredMembersIds.contains(m.id),
                    )
                    .toList();

                return ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    for (final member in membersToShow) ...[
                      MemberCard(
                        member,
                        onTap: () {
                          if (addToPreferredMembers) {
                            final newCurrentMember = currentMember.copyWith(
                              preferredMembersIds: [
                                ...currentMember.preferredMembersIds,
                                member.id,
                              ],
                            );
                            Member.collection().doc(currentMember.id).set(newCurrentMember);
                          } else {
                            final newCurrentMember = currentMember.copyWith(
                              unpreferredMembersIds: [
                                ...currentMember.unpreferredMembersIds,
                                member.id,
                              ],
                            );
                            Member.collection().doc(currentMember.id).set(newCurrentMember);
                          }

                          Navigator.pop(context);
                        },
                      ),
                      const SizedBox(height: 10),
                    ],
                  ],
                );
              },
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
