import 'package:flutter/material.dart';

class AddIcon extends StatelessWidget {
  const AddIcon({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: const Icon(
        Icons.add,
        color: Colors.black,
        size: 24,
      ),
    );
  }
}
