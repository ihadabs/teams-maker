import 'package:flutter/material.dart';
import 'package:teams_maker/pages/home_page.dart';
import 'package:teams_maker/pages/member_page.dart';

class MemberCard extends StatelessWidget {
  const MemberCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.openPage(const MemberPage());
      },
      child: Container(
        padding: const EdgeInsets.only(top: 20, bottom: 12, left: 16, right: 16),
        decoration: BoxDecoration(
          color: const Color(0xFF000000).withOpacity(0.06),
          border: Border.all(style: BorderStyle.solid, width: 5, color: Colors.black),
          borderRadius: BorderRadius.circular(4),
        ),
        child: const Text(
          'Member Name',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
