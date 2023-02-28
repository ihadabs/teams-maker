import 'package:flutter/material.dart';

class TmBackButton extends StatelessWidget {
  const TmBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () => Navigator.pop(context),
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              border: Border.all(style: BorderStyle.solid, width: 5, color: Colors.black),
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Text(
              '< Back',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
