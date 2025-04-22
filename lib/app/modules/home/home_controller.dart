import 'package:get/get.dart';

class HomeController extends GetxController {
  var currentTabIndex = 0.obs;

  var selectedCategory = 'Newest'.obs;
  var categories = ['All', 'Newest', 'Popular', 'Man', 'Woman'];
}
