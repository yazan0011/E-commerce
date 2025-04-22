import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsController extends GetxController {
  var selectedSize = ''.obs;
  var selectedColor = 0.obs;

  var sizes = ['S', 'M', 'L', 'XL', 'xxl'];
  var colors = [Colors.brown, Colors.grey, Colors.black, Colors.orange];

  var imageList = [
    'images/pexels-photo-842811.jpeg',
    'images/shutterstock_1263034774.jpg',
    'images/shutterstock_1263034774.jpg',
    'images/shutterstock_1263034774.jpg',
    'images/shutterstock_1263034774.jpg',
    'images/shutterstock_1263034774.jpg',
    'images/shutterstock_1263034774.jpg',
    'images/shutterstock_1263034774.jpg',
  ];

  var currentImageIndex = 0.obs;
}
