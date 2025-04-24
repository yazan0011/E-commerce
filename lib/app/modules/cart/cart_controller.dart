import 'package:get/get.dart';

class CartController extends GetxController {
  var cartItems = [
    {
      "name": "Brown Jacket",
      "size": "XL",
      "price": 83.97,
      "qty": 1.obs,
      "image": "images/shutterstock_1263034774.jpg",
    },
    {
      "name": "Brown Suite",
      "size": "XL",
      "price": 120.0,
      "qty": 1.obs,
      "image": "images/shutterstock_1263034774.jpg",
    }
  ].obs;

  double get subTotal => cartItems.fold(
      0,
      (sum, item) =>
          sum + (item["price"] as double) * (item["qty"] as RxInt).value);
  double get deliveryFee => 25.0;
  double get discount => 35.0;
  double get totalCost => subTotal + deliveryFee - discount;

  void increaseQty(int index) => (cartItems[index]["qty"] as RxInt).value++;
  void decreaseQty(int index) {
    if ((cartItems[index]["qty"] as RxInt).value > 1) {
      (cartItems[index]["qty"] as RxInt).value--;
    } else {
      cartItems.removeAt(index);
    }
  }

  void removeItem(int index) => cartItems.removeAt(index);
}
