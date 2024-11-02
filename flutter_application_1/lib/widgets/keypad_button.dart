import 'package:flutter/material.dart';

class KeypadButton extends StatelessWidget {
  final int number;
  final VoidCallback onPressed;

  KeypadButton({required this.number, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        '$number',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}