import 'package:flutter/material.dart';
import 'package:teams_maker/models/member.dart';
import 'package:teams_maker/pages/home_page.dart';
import 'package:teams_maker/pages/member_page.dart';

class MemberCard extends StatelessWidget {
  const MemberCard(this.member, {super.key, this.isClickable = true, this.onTap});

  final Member member;
  final bool isClickable;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (!isClickable) return;
        if (onTap != null) {
          onTap!();
          return;
        }
        context.openPage(MemberPage(member.id));
      },
      child: Container(
        padding: const EdgeInsets.only(top: 20, bottom: 12, left: 16, right: 16),
        decoration: BoxDecoration(
          color: const Color(0xFF000000).withOpacity(0.06),
          border: Border.all(style: BorderStyle.solid, width: 5, color: Colors.black),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          member.name,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
