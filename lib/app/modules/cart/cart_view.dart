import 'dart:async';

import 'package:e_co/app/utils/helpers.dart';
import 'package:e_co/widgets/cartW/deletion_dialog.dart';
import 'package:e_co/widgets/cartW/summary_row.dart';
import 'package:e_co/widgets/publicW/elevated_button.dart';
import 'package:e_co/widgets/publicW/text_feild.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'cart_controller.dart';

class CartView extends StatelessWidget {
  final CartController controller = Get.put(CartController());
  final TextEditingController tcontroller = TextEditingController();

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

                      // ✅ تأكيد الحذف قبل تنفيذه
                      confirmDismiss: (_) async {
                        final completer = Completer<bool>();

                        showCustomAnimatedDialog(
                          context,
                          child: ConfirmDeleteDialog(
                            onConfirm: () {
                              completer.complete(true);
                              Navigator.of(context).pop(); // يغلق الدايالوج
                            },
                            onCancel: () {
                              completer.complete(false);
                              Navigator.of(context).pop(); // يغلق الدايالوج
                            },
                          ),
                        );

                        return completer.future;
                      },

                      // ✅ حذف العنصر فقط إذا وافق المستخدم
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
                            flex: 3,
                            child: CustomTextField(
                                hintText: 'promo code',
                                controller: tcontroller)),
                        SizedBox(width: 10),
                        Expanded(
                            child: CustomElevatedButton(
                                onPressed: () {}, text: 'Apply'))
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
                    //
                    CustomElevatedButton(
                        onPressed: () {}, text: "Proceed to Checkout")
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
