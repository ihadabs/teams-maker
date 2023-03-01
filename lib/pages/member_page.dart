import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:teams_maker/components/add_icon.dart';
import 'package:teams_maker/components/back_button.dart';
import 'package:teams_maker/components/member_card.dart';
import 'package:teams_maker/components/title.dart';
import 'package:teams_maker/models/member.dart';
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

            final currentMember = snapshot.data!.data()!;

            return MembersStream(
              builder: (context, members) {
                final preferredMembers =
                    members.where((m) => currentMember.preferredMembersIds.contains(m.id)).toList();
                final unpreferredMembers =
                    members.where((m) => currentMember.unpreferredMembersIds.contains(m.id)).toList();

                return ListView(
                  padding: const EdgeInsets.all(24),
                  children: [
                    const TmBackButton(),
                    const SizedBox(height: 47),
                    MemberCard(currentMember, isClickable: false),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const MyTitle('Preferred Members:'),
                        AddIcon(
                          onTap: () {
                            showModalBottomSheet(
                                context: context, builder: (_) => SelectMemberPage(currentMember: currentMember));
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    for (final member in preferredMembers) ...[
                      DismissibleMemberCard(
                        member,
                        isClickable: false,
                        onDismissed: () {
                          final newCurrentMember = currentMember.copyWith(
                            preferredMembersIds: currentMember.preferredMembersIds
                                .where(
                                  (mId) => mId != member.id,
                                )
                                .toList(),
                          );
                          Member.collection().doc(currentMember.id).set(newCurrentMember);
                        },
                      ),
                      const SizedBox(height: 10),
                    ],
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const MyTitle('Unpreferred Members:'),
                        AddIcon(
                          onTap: () async {
                            final result = await showModalBottomSheet(
                              context: context,
                              builder: (_) =>
                                  SelectMemberPage(currentMember: currentMember, addToPreferredMembers: false),
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    for (final member in unpreferredMembers) ...[
                      DismissibleMemberCard(
                        member,
                        isClickable: false,
                        onDismissed: () {
                          final newCurrentMember = currentMember.copyWith(
                            unpreferredMembersIds: currentMember.unpreferredMembersIds
                                .where(
                                  (mId) => mId != member.id,
                                )
                                .toList(),
                          );
                          Member.collection().doc(currentMember.id).set(newCurrentMember);
                        },
                      ),
                      const SizedBox(height: 10),
                    ],
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
