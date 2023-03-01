import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:teams_maker/components/add_icon.dart';
import 'package:teams_maker/components/button.dart';
import 'package:teams_maker/components/logo.dart';
import 'package:teams_maker/components/member_card.dart';
import 'package:teams_maker/components/title.dart';
import 'package:teams_maker/models/member.dart';
import 'package:teams_maker/pages/add_member_page.dart';
import 'package:teams_maker/utils/gen_team.dart';

// const members = [
//   Member(id: '1', name: 'Mohammed', preferredMembersIds: [], unpreferredMembersIds: []),
//   Member(id: '2', name: 'Hamad', preferredMembersIds: [], unpreferredMembersIds: []),
//   Member(id: '3', name: 'Hussam', preferredMembersIds: [], unpreferredMembersIds: []),
//   Member(id: '4', name: 'Mustafa', preferredMembersIds: [], unpreferredMembersIds: []),
//   Member(id: '5', name: 'Hana', preferredMembersIds: [], unpreferredMembersIds: []),
//   Member(id: '6', name: 'Sara', preferredMembersIds: [], unpreferredMembersIds: []),
//   Member(id: '7', name: 'Lama', preferredMembersIds: [], unpreferredMembersIds: []),
//   Member(id: '8', name: 'Rahaf', preferredMembersIds: [], unpreferredMembersIds: []),
// ];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: StreamBuilder(
          stream: Member.collectionOrdered().toListStream(),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return const LoadingIndicator(size: 50, borderWidth: 1);
            }

            final members = snapshot.data ?? [];

            return ListView(
              padding: const EdgeInsets.all(24),
              children: [
                const Logo(),
                const SizedBox(height: 35),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyTitle('All members (${members.length}):'),
                    AddIcon(
                      onTap: () {
                        context.openPage(const AddMemberPage());
                      },
                    )
                  ],
                ),
                const SizedBox(height: 24),
                for (final member in members) ...[
                  DismissibleMemberCard(member),
                  const SizedBox(height: 10),
                ],
                const SizedBox(height: 24),
                MyButton(
                  title: 'Generate Teams (${members.length / 3})',
                  onTap: () {
                    final teams = genTeams(members);
                    // context.openPage(TeamsPage(teams));
                  },
                ),
              ],
            );
          },
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

extension GG2<T> on CollectionReference<T> {
  Stream<List<T>> toListStream() {
    return snapshots().map((snapshot) => snapshot.docs.map((d) => d.data()).toList());
  }
}

extension GG3<T> on Query<T> {
  Stream<List<T>> toListStream() {
    return snapshots().map((snapshot) => snapshot.docs.map((d) => d.data()).toList());
  }
}
