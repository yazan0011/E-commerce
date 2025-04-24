import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'cart_controller.dart';

class cartView extends StatelessWidget {
  final CartController controller = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("My Cart", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: BackButton(color: Colors.black),
      ),
      body: Obx(() => Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: controller.cartItems.length,
                  itemBuilder: (context, index) {
                    var item = controller.cartItems[index];
                    return Dismissible(
                      key: Key(item["name"] as String),
                      direction: DismissDirection.endToStart,
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.only(right: 20),
                        child: Icon(Icons.delete, color: Colors.white),
                      ),
                      onDismissed: (_) => controller.removeItem(index),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 8),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(item["image"] as String,
                                  width: 60, height: 60, fit: BoxFit.cover),
                            ),
                            SizedBox(width: 15),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(item["name"] as String,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Text("Size: ${item["size"]}",
                                      style: TextStyle(color: Colors.grey)),
                                  Text(
                                      "\$${(item["price"] as double).toStringAsFixed(2)}"),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.remove),
                                  onPressed: () =>
                                      controller.decreaseQty(index),
                                ),
                                Obx(() =>
                                    Text("${(item["qty"] as RxInt).value}")),
                                IconButton(
                                  icon: Icon(Icons.add),
                                  onPressed: () =>
                                      controller.increaseQty(index),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Promo Code",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12)),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF4D2C1E),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                          ),
                          onPressed: () {},
                          child: Text("Apply"),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    SummaryRow("Sub-Total",
                        "\$${controller.subTotal.toStringAsFixed(2)}"),
                    SummaryRow("Delivery Fee",
                        "\$${controller.deliveryFee.toStringAsFixed(2)}"),
                    SummaryRow("Discount",
                        "-\$${controller.discount.toStringAsFixed(2)}"),
                    Divider(thickness: 1),
                    SummaryRow("Total Cost",
                        "\$${controller.totalCost.toStringAsFixed(2)}"),
                    SizedBox(height: 15),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF4D2C1E),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        minimumSize: Size(double.infinity, 50),
                      ),
                      onPressed: () {},
                      child: Text("Proceed to Checkout"),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

class SummaryRow extends StatelessWidget {
  final String label;
  final String value;
  SummaryRow(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(value, style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
