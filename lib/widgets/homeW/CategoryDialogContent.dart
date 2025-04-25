import 'package:e_co/app/utils/constants.dart';
import 'package:e_co/widgets/homeW/category_icon.dart';
import 'package:flutter/material.dart';

class CategoryDialogContent extends StatelessWidget {
  final List<Map<String, dynamic>> categories = [
    {'label': 'T-Shirt', 'icon': Icons.checkroom},
    {'label': 'Pant', 'icon': Icons.view_stream},
    {'label': 'Dress', 'icon': Icons.woman},
    {'label': 'Jacket', 'icon': Icons.shopping_bag},
    {'label': 'Shoes', 'icon': Icons.shopping_cart},
    {'label': 'Access', 'icon': Icons.watch},
    {'label': 'Bags', 'icon': Icons.backpack},
    {'label': 'Glasses', 'icon': Icons.remove_red_eye},
    {'label': 'Hats', 'icon': Icons.emoji_people},
    {'label': 'Socks', 'icon': Icons.format_paint},
    {'label': 'Scarf', 'icon': Icons.ac_unit},
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.85,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "All Categories",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Divider(),
              const SizedBox(height: 12),
              SizedBox(
                height: 300,
                child: SingleChildScrollView(
                  child: Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    children: categories
                        .map((cat) => CategoryIcon(
                              label: cat['label'],
                              icon: cat['icon'],
                            ))
                        .toList(),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.close),
                label: const Text("Close"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
