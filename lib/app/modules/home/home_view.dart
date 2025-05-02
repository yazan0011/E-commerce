import 'package:e_co/app/modules/cart/cart_view.dart';
import 'package:e_co/app/modules/home/home_controller.dart';
import 'package:e_co/app/modules/profile/profile_view.dart';
import 'package:e_co/app/modules/wishlist/wishlist_view.dart';
import 'package:e_co/app/widgets/homeW/home_content.dart';
import 'package:e_co/app/widgets/homeW/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Obx(() => IndexedStack(
                    index: controller.currentTabIndex.value,
                    children: [
                      homeContent(), // 0
                      WishlistView(), // 1
                      WishlistView(), // 2
                      CartView(), // 3
                      ProfilePage(), // 3
                    ],
                  )),
            ),

            // ✅ الـ Custom Navbar
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Obx(() => CustomNavbar(
                    currentIndex: controller.currentTabIndex.value,
                    onTap: (index) => controller.currentTabIndex.value = index,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
