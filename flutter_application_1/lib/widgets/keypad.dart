import 'package:flutter/material.dart';
import 'keypad_button.dart';

class Keypad extends StatelessWidget {
  final Function(int) onNumberPressed;
  final VoidCallback onClearPressed;
  final VoidCallback onEnterPressed;

  Keypad({
    required this.onNumberPressed,
    required this.onClearPressed,
    required this.onEnterPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [1, 2, 3]
              .map((number) => KeypadButton(
                    number: number,
                    onPressed: () => onNumberPressed(number),
                  ))
              .toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [4, 5, 6]
              .map((number) => KeypadButton(
                    number: number,
                    onPressed: () => onNumberPressed(number),
                  ))
              .toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [7, 8, 9]
              .map((number) => KeypadButton(
                    number: number,
                    onPressed: () => onNumberPressed(number),
                  ))
              .toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            KeypadButton(
              number: 0,
              onPressed: () => onNumberPressed(0),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(onPressed: onClearPressed, child: Text('Clear')),
            TextButton(onPressed: onEnterPressed, child: Text('Enter')),
          ],
        ),
      ],
    );
  }
}