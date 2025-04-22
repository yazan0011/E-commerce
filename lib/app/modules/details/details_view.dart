import 'package:e_co/app/modules/details/details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsView extends StatelessWidget {
  final DetailsController controller = Get.find<DetailsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(() => Stack(
                  children: [
                    // Main image carousel
                    Container(
                      height: 400,
                      width: double.infinity,
                      child: PageView.builder(
                        itemCount: controller.imageList.length,
                        onPageChanged: (index) =>
                            controller.currentImageIndex.value = index,
                        itemBuilder: (_, index) {
                          return Image.asset(
                            controller.imageList[index],
                            fit: BoxFit.cover,
                            width: double.infinity,
                          );
                        },
                      ),
                    ),

                    // Back button
                    Positioned(
                      top: MediaQuery.of(context).padding.top + 10,
                      left: 16,
                      child: CircleAvatar(
                        backgroundColor: Colors.white.withOpacity(0.8),
                        child: IconButton(
                          icon: Icon(Icons.arrow_back, color: Colors.black),
                          onPressed: () => Get.back(),
                        ),
                      ),
                    ),

                    // Favorite button
                    Positioned(
                      top: MediaQuery.of(context).padding.top + 10,
                      right: 16,
                      child: CircleAvatar(
                        backgroundColor: Colors.white.withOpacity(0.8),
                        child: Icon(Icons.favorite_border, color: Colors.black),
                      ),
                    ),

                    // Dots indicator
                    Positioned(
                      bottom: 10,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:
                            List.generate(controller.imageList.length, (index) {
                          return AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            margin: EdgeInsets.symmetric(horizontal: 4),
                            width: controller.currentImageIndex.value == index
                                ? 12
                                : 8,
                            height: controller.currentImageIndex.value == index
                                ? 12
                                : 8,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: controller.currentImageIndex.value == index
                                  ? Colors.brown
                                  : Colors.white,
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                )),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Female's Style",
                          style: TextStyle(color: Colors.grey)),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber),
                          Text("4.5"),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Text("Light Brown Jacket",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Text("Product Details",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."),
                  SizedBox(height: 20),
                  Text("Select Size"),
                  Obx(() => Wrap(
                        spacing: 8,
                        children: controller.sizes.map((size) {
                          bool selected = controller.selectedSize.value == size;
                          return ChoiceChip(
                            label: Text(size),
                            selected: selected,
                            onSelected: (_) =>
                                controller.selectedSize.value = size,
                          );
                        }).toList(),
                      )),
                  SizedBox(height: 20),
                  Text("Select Color : "),
                  Obx(() => Row(
                        children:
                            List.generate(controller.colors.length, (index) {
                          return GestureDetector(
                            onTap: () => controller.selectedColor.value = index,
                            child: Container(
                              margin: EdgeInsets.only(right: 10, top: 8),
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: controller.colors[index],
                                border: Border.all(
                                  color: controller.selectedColor.value == index
                                      ? const Color.fromARGB(255, 58, 58, 58)
                                      : Colors.transparent,
                                  width: 2,
                                ),
                              ),
                            ),
                          );
                        }),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("total : \$83.97",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              label: Text(
                "Add to Cart",
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
