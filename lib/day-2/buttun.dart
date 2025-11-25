import 'package:flutter/material.dart';

class VkButton extends StatelessWidget {
  final double width;
  final double height;
  final String label;
  final Color color;
  final Color? textColor;
  final double? textSize;
  final void Function() onTap;
  final double? borderRadius;
  final bool? disabled;

  const VkButton({
    super.key,
    required this.width,
    required this.height,
    required this.label,
    required this.color,
    this.textColor = Colors.black,
    this.textSize = 16,
    required this.onTap,
    this.borderRadius = 10,
    this.disabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: disabled == true ? null : onTap,
      child: Container(
        width: width.toDouble(),
        height: height.toDouble(),
        decoration: BoxDecoration(
          color: disabled == true ? color.withValues(alpha: 0.5) : color,
          borderRadius: BorderRadius.circular(borderRadius!),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: textSize,
            ),
          ),
        ),
      ),
    );
  }
}
