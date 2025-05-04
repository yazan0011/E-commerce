import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterController extends GetxController {
  var brands = ['All', 'Nike', 'Adidas', 'Puma', 'Fila'].obs;
  var selectedBrand = 'All'.obs;

  var genders = ['All', 'Men', 'Women'].obs;
  var selectedGender = 'All'.obs;

  var sortOptions = ['Most Recent', 'Popular', 'Price High'].obs;
  var selectedSort = 'Popular'.obs;

  var priceRange = Rx<RangeValues>(RangeValues(7, 100));

  var reviewOptions = <double>[4.5, 4.0, 3.5, 3.0, 2.5].obs;
  var selectedRating = 4.5.obs;

  void resetFilters() {
    selectedBrand.value = 'All';
    selectedGender.value = 'All';
    selectedSort.value = 'Popular';
    priceRange.value = RangeValues(7, 100);
    selectedRating.value = 4.5;
  }

  void applyFilters() {
    // Send filters to backend or filter local list
    print("Filters applied:");
    print("Brand: ${selectedBrand.value}");
    print("Gender: ${selectedGender.value}");
    print("Sort: ${selectedSort.value}");
    print("Price: ${priceRange.value.start} - ${priceRange.value.end}");
    print("Rating: ${selectedRating.value}+");
  }
}
