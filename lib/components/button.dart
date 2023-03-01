import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  const MyButton({super.key, required this.title, this.onTap});

  final String title;
  final VoidCallback? onTap;

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  var isLoading = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final onTap = widget.onTap;

        if (onTap == null) return;

        if (_isAsync(onTap)) {
          setState(() => isLoading = true);
          await Future.sync(onTap);
          if (mounted) {
            setState(() => isLoading = false);
          }
        } else {
          onTap.call();
        }
      },
      child: Container(
        constraints: const BoxConstraints(minHeight: 54),
        alignment: Alignment.center,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Text(
              widget.title,
              style: TextStyle(
                color: Colors.white.withOpacity(isLoading ? 0 : 1),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (isLoading) const LoadingIndicator(size: 30, borderWidth: 2, color: Colors.white),
          ],
        ),
      ),
    );
  }
}

typedef _AsyncFunc = dynamic Function();

bool _isAsync(_AsyncFunc? func) {
  if (func is Future Function()) return true;
//   if (func is Future Function(Never)) return true;
//   if (func is Future Function(Never, Never)) return true;
//   if (func is Future Function(Never, Never, Never)) return true;
  // Repeat as long as you want to.
  return false;
}
