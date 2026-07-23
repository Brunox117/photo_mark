import 'package:flutter/material.dart';

class StrokeWidthSelector extends StatelessWidget {
  final List<double> widths;
  final double currentWidth;
  final Color accent;
  final ValueChanged<double> onChanged;

  const StrokeWidthSelector({
    super.key,
    required this.widths,
    required this.currentWidth,
    required this.accent,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (final width in widths) ...[
          if (width != widths.first) const SizedBox(height: 6),
          _StrokeWidthOption(
            width: width,
            isSelected: currentWidth == width,
            accent: accent,
            onTap: () => onChanged(width),
          ),
        ],
      ],
    );
  }
}

class _StrokeWidthOption extends StatelessWidget {
  final double width;
  final bool isSelected;
  final Color accent;
  final VoidCallback onTap;

  const _StrokeWidthOption({
    required this.width,
    required this.isSelected,
    required this.accent,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeOut,
          width: 52,
          height: 36,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected
                ? accent.withValues(alpha: 0.22)
                : Colors.white.withValues(alpha: 0.04),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isSelected
                  ? accent.withValues(alpha: 0.9)
                  : Colors.white.withValues(alpha: 0.06),
              width: isSelected ? 1.5 : 1,
            ),
          ),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            width: 28,
            height: width.clamp(2, 14),
            decoration: BoxDecoration(
              color: isSelected ? accent : Colors.white.withValues(alpha: 0.85),
              borderRadius: BorderRadius.circular(99),
            ),
          ),
        ),
      ),
    );
  }
}
