import 'package:e_co/app/modules/cart/cart_view.dart';
import 'package:e_co/app/modules/home/home_controller.dart';
import 'package:e_co/app/modules/profile/profile_view.dart';
import 'package:e_co/app/modules/wishlist/wishlist_view.dart';
import 'package:e_co/app/utils/constants.dart';
import 'package:e_co/app/utils/helpers.dart';
import 'package:e_co/app/widgets/homeW/CategoryDialogContent.dart';
import 'package:e_co/app/widgets/homeW/auto_scrol_panel.dart';
import 'package:e_co/app/widgets/homeW/category_icon.dart';
import 'package:e_co/app/widgets/homeW/nav_bar.dart';
import 'package:e_co/app/widgets/homeW/product_card.dart';
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
            // ✅ المحتوى بناءً على التاب المختار
            Positioned.fill(
              child: Obx(() => IndexedStack(
                    index: controller.currentTabIndex.value,
                    children: [
                      homeContent(), // 0
                      WishlistView(), // 1
                      CartView(), // 2
                      CartView(), // 2
                      ProfilePage(), // 3
                      // ProfileTabContent(),     // 4
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

class homeContent extends StatelessWidget {
  const homeContent({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Icon(Icons.location_on, color: AppColors.primary),
                  SizedBox(width: 4),
                  Text("New York, USA",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              IconButton(
                icon: Icon(Icons.notifications_none),
                color: AppColors.primary,
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: const [
                Icon(Icons.search, color: AppColors.primary),
                SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: 'Search'),
                  ),
                ),
                Icon(Icons.tune, color: AppColors.primary),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // New Collection
          AutoScrollSaleBanner(),
          const SizedBox(height: 16),
          // Category
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Category",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              GestureDetector(
                onTap: () {
                  showCustomAnimatedDialog(
                    context,
                    child: CategoryDialogContent(), // محتوى مخصص
                  );
                },
                child: const Text(
                  "See All",
                  style: TextStyle(color: AppColors.primary),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              spacing: 26,
              children: const [
                CategoryIcon(label: 'T-Shirt', icon: Icons.checkroom),
                CategoryIcon(label: 'Pant', icon: Icons.view_stream),
                CategoryIcon(label: 'Dress', icon: Icons.woman),
                CategoryIcon(label: 'Jacket', icon: Icons.shopping_bag),
                CategoryIcon(label: 'Shoes', icon: Icons.shopping_cart),
                CategoryIcon(label: 'Access', icon: Icons.watch),
                CategoryIcon(label: 'Access', icon: Icons.watch),
                CategoryIcon(label: 'Access', icon: Icons.watch),
                CategoryIcon(label: 'Access', icon: Icons.watch),
                CategoryIcon(label: 'Access', icon: Icons.watch),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              color: Colors.grey.shade300,
              thickness: 1.2,
            ),
          ),
          Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: controller.categories
                    .map((cat) => GestureDetector(
                          onTap: () => controller.selectedCategory.value = cat,
                          child: Chip(
                            backgroundColor:
                                controller.selectedCategory.value == cat
                                    ? AppColors.primary
                                    : Colors.grey.shade200,
                            label: Text(cat,
                                style: TextStyle(
                                    color:
                                        controller.selectedCategory.value == cat
                                            ? Colors.white
                                            : Colors.black)),
                          ),
                        ))
                    .toList(),
              )),
          const SizedBox(height: 16),
          // Products Grid
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            childAspectRatio: 0.7,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            children: const [
              ProductCard(
                wish: 0,
                image:
                    'images/360_F_341034617_4e96ntzBPpqjGxbUoHEVAp6NrH6KJwbE.jpg',
                name: 'Brown Jacket',
                price: 83.97,
                rating: 4.9,
                totalImages: 4,
              ),
              ProductCard(
                wish: 0,
                image: 'images/shutterstock_1263034774.jpg',
                name: 'Brown Suite',
                price: 120.00,
                rating: 5.0,
                totalImages: 5,
              ),
              ProductCard(
                wish: 0,
                image: 'images/pexels-anastasiya-gepp-654466-1462637.jpg',
                name: 'Brown Jacket',
                price: 83.97,
                rating: 4.9,
                totalImages: 2,
              ),
              ProductCard(
                wish: 0,
                image:
                    'images/360_F_341034617_4e96ntzBPpqjGxbUoHEVAp6NrH6KJwbE.jpg',
                name: 'Yellow Shirt',
                price: 120.00,
                rating: 5.0,
                totalImages: 3,
              ),
              ProductCard(
                wish: 0,
                image: 'images/shutterstock_1263034774.jpg',
                name: 'Yellow Shirt',
                price: 120.00,
                rating: 5.0,
                totalImages: 7,
              ),
              ProductCard(
                wish: 0,
                image: 'images/shutterstock_1263034774.jpg',
                name: 'Yellow Shirt',
                price: 120.00,
                rating: 5.0,
                totalImages: 1,
              ),
              ProductCard(
                wish: 0,
                image:
                    'images/360_F_341034617_4e96ntzBPpqjGxbUoHEVAp6NrH6KJwbE.jpg',
                name: 'Yellow Shirt',
                price: 120.00,
                rating: 5.0,
                totalImages: 9,
              ),
              ProductCard(
                wish: 0,
                image:
                    'images/360_F_341034617_4e96ntzBPpqjGxbUoHEVAp6NrH6KJwbE.jpg',
                name: 'Yellow Shirt',
                price: 120.00,
                rating: 5.0,
                totalImages: 9,
              ),
              ProductCard(
                wish: 0,
                image:
                    'images/360_F_341034617_4e96ntzBPpqjGxbUoHEVAp6NrH6KJwbE.jpg',
                name: 'Yellow Shirt',
                price: 120.00,
                rating: 5.0,
                totalImages: 9,
              ),
              ProductCard(
                wish: 0,
                image:
                    'images/360_F_341034617_4e96ntzBPpqjGxbUoHEVAp6NrH6KJwbE.jpg',
                name: 'Yellow Shirt',
                price: 120.00,
                rating: 5.0,
                totalImages: 9,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
