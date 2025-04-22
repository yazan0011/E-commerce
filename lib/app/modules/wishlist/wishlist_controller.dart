import 'package:get/get.dart';

class WishlistController extends GetxController {
  var categories = ['Jackets', 'Shoes', 'Accessories', 'Shoes2', 'Shoe'].obs;

  final wishlistItems = <String, List<Map<String, dynamic>>>{
    'Jackets': List.generate(
      4,
      (index) => {
        'image': 'images/pexels-photo-842811.jpeg',
        'name': 'Jacket $index',
        'price': 80.0 + index,
        'rating': 4.5,
        'totalImages': 5,
      },
    ),
    'Shoes': List.generate(
      3,
      (index) => {
        'image': 'images/360_F_341034617_4e96ntzBPpqjGxbUoHEVAp6NrH6KJwbE.jpg',
        'name': 'Shoe $index',
        'price': 60.0 + index,
        'rating': 4.2,
        'totalImages': 3,
      },
    ),
    'Shoes2': List.generate(
      3,
      (index) => {
        'image': 'images/360_F_341034617_4e96ntzBPpqjGxbUoHEVAp6NrH6KJwbE.jpg',
        'name': 'Shoe $index',
        'price': 60.0 + index,
        'rating': 4.2,
        'totalImages': 3,
      },
    ),
    'Shoe': List.generate(
      3,
      (index) => {
        'image': 'images/360_F_341034617_4e96ntzBPpqjGxbUoHEVAp6NrH6KJwbE.jpg',
        'name': 'Shoe $index',
        'price': 60.0 + index,
        'rating': 4.2,
        'totalImages': 3,
      },
    ),
    'Accessories': List.generate(
      2,
      (index) => {
        'image': 'images/pexels-photo-842811.jpeg',
        'name': 'Accessory $index',
        'price': 40.0 + index,
        'rating': 4.8,
        'totalImages': 2,
      },
    ),
  }.obs;
}
