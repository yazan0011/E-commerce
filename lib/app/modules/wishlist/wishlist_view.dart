import 'package:e_co/app/modules/wishlist/wishlist_controller.dart';
import 'package:e_co/app/utils/constants.dart';
import 'package:e_co/app/widgets/homeW/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishlistView extends StatelessWidget {
  final WishlistController controller = Get.put(WishlistController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: controller.categories.length,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: const Text("My Wishlist"),
          ),
          bottom: TabBar(
            indicatorColor: AppColors.primary,
            isScrollable: true,
            labelColor: AppColors.primary,
            unselectedLabelColor: Colors.grey,
            tabs: controller.categories.map((c) => Tab(text: c)).toList(),
          ),
        ),
        body: TabBarView(
          children: controller.categories.map((category) {
            final products = controller.wishlistItems[category] ?? [];

            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: GridView.builder(
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.65,
                ),
                itemBuilder: (context, index) {
                  final product = products[index];
                  return ProductCard(
                    wish: 1,
                    image: product['image'],
                    name: product['name'],
                    price: product['price'],
                    rating: product['rating'],
                    totalImages: product['totalImages'],
                  );
                },
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
