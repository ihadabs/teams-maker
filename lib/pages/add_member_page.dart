import 'package:flutter/material.dart';
import 'package:teams_maker/components/back_button.dart';
import 'package:teams_maker/components/button.dart';
import 'package:teams_maker/models/member.dart';
import 'package:uuid/uuid.dart';

class AddMemberPage extends StatefulWidget {
  const AddMemberPage({super.key});

  @override
  State<AddMemberPage> createState() => _AddMemberPageState();
}

class _AddMemberPageState extends State<AddMemberPage> {
  final nameController = TextEditingController();

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
            TextField(
              controller: nameController,
              style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
              cursorColor: Colors.black,
              decoration: InputDecoration(
                hintText: 'Enter member name',
                hintStyle: const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 14),
                border: const OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                filled: true,
                fillColor: Colors.black.withOpacity(0.06),
              ),
            ),
            const SizedBox(height: 64),
            MyButton(
              title: 'Add Member',
              onTap: () {
                final newMember = Member(
                  id: const Uuid().v4(),
                  name: nameController.text,
                  preferredMembersIds: [],
                  unpreferredMembersIds: [],
                );

                Member.collection().doc(newMember.id).set(newMember);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
