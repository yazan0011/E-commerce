import 'package:e_co/app/modules/cart/cart_view.dart';
import 'package:e_co/app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  final List<Map<String, dynamic>> options = [
    {"icon": Icons.person_outline, "label": "Your profile"},
    {"icon": Icons.credit_card, "label": "Payment Methods"},
    {
      "icon": Icons.assignment_outlined,
      "label": "My cart",
      'ontap': CartView()
    },
    {"icon": Icons.settings_outlined, "label": "Settings"},
    {"icon": Icons.help_outline, "label": "Help Center"},
    {"icon": Icons.lock_outline, "label": "Privacy Policy"},
    {"icon": Icons.group_outlined, "label": "Invites Friends"},
    {"icon": Icons.logout, "label": "Log out"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: BackButton(color: Colors.black),
        title: Text("Profile", style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Center(
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage:
                      AssetImage('images/photo_2025-04-23_00-30-59.jpg'),
                ),
                Positioned(
                  right: 4,
                  bottom: 4,
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.grey,
                    child: CircleAvatar(
                      radius: 14,
                      backgroundColor: AppColors.primary,
                      child: Icon(Icons.edit, color: Colors.white, size: 14),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Yazan ALomar",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(height: 20),
          Divider(thickness: 1),
          Expanded(
            child: ListView.builder(
              itemCount: options.length,
              itemBuilder: (context, index) {
                final item = options[index];
                return ListTile(
                  leading: Icon(item["icon"], color: AppColors.primary),
                  title: Text(item["label"]),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    Get.to(item['ontap']);
                  },
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 4, // Profile is the 5th tab (index starts from 0)
        selectedItemColor: AppColors.primary,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ''),
        ],
      ),
    );
  }
}
