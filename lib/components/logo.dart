import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 51,
          width: 154,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(style: BorderStyle.solid, width: 5, color: Colors.black),
            borderRadius: BorderRadius.circular(4),
          ),
          child: const Text(
            'Logo',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
