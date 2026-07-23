import 'package:flutter/material.dart';

class ToolIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final bool destructive;

  const ToolIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.destructive = false,
  });

  @override
  Widget build(BuildContext context) {
    final color = destructive
        ? const Color(0xFFFF6B6B)
        : Colors.white.withValues(alpha: 0.9);

    return IconButton(
      onPressed: onPressed,
      visualDensity: VisualDensity.compact,
      style: IconButton.styleFrom(
        foregroundColor: color,
        backgroundColor: Colors.white.withValues(alpha: 0.06),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      icon: Icon(icon, size: 22),
    );
  }
}
