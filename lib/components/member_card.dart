import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:teams_maker/models/member.dart';
import 'package:teams_maker/pages/home_page.dart';
import 'package:teams_maker/pages/member_page.dart';

class DismissibleMemberCard extends StatelessWidget {
  const DismissibleMemberCard(
    this.member, {
    super.key,
    this.isClickable = true,
    this.onTap,
    this.onDismissed,
  });

  final Member member;
  final bool isClickable;
  final VoidCallback? onTap;
  final void Function()? onDismissed;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.endToStart,
      key: ValueKey(member.id),
      background: Container(
        alignment: Alignment.centerRight,
        decoration: const BoxDecoration(color: Colors.red),
        child: const Padding(
          padding: EdgeInsetsDirectional.all(24),
          child: Icon(Icons.delete_outline_rounded, color: Colors.white),
        ),
      ),
      confirmDismiss: (direction) async {
        return true;
      },
      onDismissed: (direction) {
        if (onDismissed != null) {
          onDismissed!();
          return;
        }

        /// Deletion logic
        if (direction == DismissDirection.endToStart) {
          Member.collection().doc(member.id).delete();
        }
      },
      child: MemberCard(member, isClickable: isClickable, onTap: onTap),
    );
  }
}

class MemberCard extends StatelessWidget {
  const MemberCard(this.member, {super.key, this.isClickable = true, this.onTap});

  final Member member;
  final bool isClickable;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      key: ValueKey(member),
      onTap: () {
        if (!isClickable) return;
        if (onTap != null) {
          onTap!();
          return;
        }
        context.openPage(MemberPage(member.id));
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(top: 20, bottom: 12, left: 16, right: 16),
        decoration: BoxDecoration(
          color: const Color(0xFF000000).withOpacity(0.06),
          border: Border.all(style: BorderStyle.solid, width: 5, color: Colors.black),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    member.name,
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  MembersStream(builder: (context, members) {
                    return Text(
                      member.preferredMembersIds
                          .map((mId) => members.firstWhereOrNull((m) => m.id == mId)?.name ?? '')
                          .where((s) => s.isNotEmpty)
                          .sorted((a, b) => a.compareTo(b))
                          .join(', '),
                      style: const TextStyle(fontSize: 11, fontWeight: FontWeight.normal),
                    );
                  }),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Icon(
              Icons.thumb_up_alt_outlined,
              size: 28,
              color: member.preferredMembersIds.isNotEmpty ? Colors.green : Colors.black,
            ),
            const SizedBox(width: 4),
            Text(
              member.preferredMembersIds.length.toString(),
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 24),
            Icon(
              Icons.thumb_down_alt_outlined,
              size: 28,
              color: member.unpreferredMembersIds.isNotEmpty ? Colors.red : Colors.black,
            ),
            const SizedBox(width: 4),
            Text(
              member.unpreferredMembersIds.length.toString(),
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
