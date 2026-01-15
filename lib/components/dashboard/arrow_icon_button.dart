import 'package:flutter/material.dart';

class ArrowIconButton extends StatelessWidget {
  final bool selected;

  const ArrowIconButton(this.selected, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color:
        selected ? Colors.white : const Color(0xFFEA6A12),
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.arrow_forward_ios_outlined,
        size: 12,
        color: selected ? const Color(0xFFEA6A12) : Colors.white,
      ),
    );
  }
}
