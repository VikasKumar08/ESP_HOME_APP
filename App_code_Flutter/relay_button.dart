import 'package:flutter/material.dart';

class RelayButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final IconData? icon;
  final double iconSize;

  const RelayButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.iconSize = 25, // Smaller icon size
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8), // Smaller padding
        minimumSize: const Size(80, 40), // Smaller button size
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6), // Slightly rounded corners
        ),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold,), // Smaller text size
      ),
      icon: icon != null
          ? Icon(icon, size: iconSize)
          : const SizedBox.shrink(), // Hide icon if not provided
      label: Text(label),
      onPressed: onPressed,
    );
  }
}
