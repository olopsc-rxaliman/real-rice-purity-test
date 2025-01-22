import 'package:flutter/material.dart';

class ChecklistItem extends StatelessWidget {
  final int index;
  final String text;
  final bool isChecked;
  final Function() onPressed;

  const ChecklistItem({
    required this.index,
    required this.text,
    required this.isChecked,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Row(
        children: [
          Transform.scale(
            scale: 0.75,
            child: Checkbox(
              value: isChecked,
              onChanged: (value) {
                onPressed();
              },
            ),
          ),
          Flexible(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                fontFamily: 'Roboto',
                height: 1.1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
