import 'package:flutter/material.dart';
import 'package:teams_maker/components/back_button.dart';
import 'package:teams_maker/components/button.dart';

class AddMemberPage extends StatelessWidget {
  const AddMemberPage({super.key});

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
            const MyButton(title: 'Add Member'),
          ],
        ),
      ),
    );
  }
}
