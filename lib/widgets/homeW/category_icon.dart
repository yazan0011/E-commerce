import 'package:flutter/material.dart';

class CategoryIcon extends StatelessWidget {
  final String label;
  final IconData icon;

  const CategoryIcon({required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.brown.shade100,
          child: Icon(icon, color: Colors.brown),
        ),
        const SizedBox(height: 4),
        Text(label),
      ],
    );
  }
}
