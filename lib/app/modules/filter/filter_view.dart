import 'package:e_co/app/modules/filter/filter_contoller.dart';
import 'package:e_co/app/utils/constants.dart';
import 'package:e_co/app/widgets/publicW/elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Filterview extends StatelessWidget {
  final controller = Get.find<FilterController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Filter')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle("Brands"),
              Obx(() => Wrap(
                    spacing: 8,
                    children: controller.brands.map((brand) {
                      final isSelected =
                          controller.selectedBrand.value == brand;
                      return ChoiceChip(
                        checkmarkColor: Colors.white,
                        backgroundColor: Colors.white,
                        selectedColor: const Color.fromARGB(255, 155, 127, 116),
                        label: Text(
                          brand,
                          style: TextStyle(
                              color:
                                  isSelected ? Colors.white : Colors.black54),
                        ),
                        selected: isSelected,
                        onSelected: (_) =>
                            controller.selectedBrand.value = brand,
                      );
                    }).toList(),
                  )),
              _buildSectionTitle("Gender"),
              Obx(() => Wrap(
                    spacing: 8,
                    children: controller.genders.map((gender) {
                      final isSelected =
                          controller.selectedGender.value == gender;
                      return ChoiceChip(
                        checkmarkColor: Colors.white,
                        backgroundColor: Colors.white,
                        selectedColor: const Color.fromARGB(255, 155, 127, 116),
                        label: Text(
                          gender,
                          style: TextStyle(
                              color:
                                  isSelected ? Colors.white : Colors.black54),
                        ),
                        selected: isSelected,
                        onSelected: (_) =>
                            controller.selectedGender.value = gender,
                      );
                    }).toList(),
                  )),
              _buildSectionTitle("Sort by"),
              Obx(() => Wrap(
                    spacing: 8,
                    children: controller.sortOptions.map((sort) {
                      final isSelected = controller.selectedSort.value == sort;
                      return ChoiceChip(
                        checkmarkColor: Colors.white,
                        backgroundColor: Colors.white,
                        selectedColor: const Color.fromARGB(255, 155, 127, 116),
                        label: Text(
                          sort,
                          style: TextStyle(
                              color:
                                  isSelected ? Colors.white : Colors.black54),
                        ),
                        selected: isSelected,
                        onSelected: (_) => controller.selectedSort.value = sort,
                      );
                    }).toList(),
                  )),
              _buildSectionTitle("Pricing Range"),
              Obx(() => RangeSlider(
                    activeColor: const Color.fromARGB(255, 155, 127, 116),
                    values: controller.priceRange.value,
                    min: 2,
                    max: 150,
                    divisions: 15,
                    labels: RangeLabels(
                      controller.priceRange.value.start.toStringAsFixed(0),
                      controller.priceRange.value.end.toStringAsFixed(0),
                    ),
                    onChanged: (range) {
                      controller.priceRange.value = range;
                    },
                  )),
              _buildSectionTitle("Reviews"),
              Obx(() => Column(
                    children: controller.reviewOptions.map((rating) {
                      return RadioListTile<double>(
                        activeColor: const Color.fromARGB(255, 155, 127, 116),
                        value: rating,
                        groupValue: controller.selectedRating.value,
                        onChanged: (val) {
                          controller.selectedRating.value = val!;
                        },
                        title: Row(
                          children: [
                            ...List.generate(5, (index) {
                              return Icon(Icons.star,
                                  color: index < rating
                                      ? Colors.orange
                                      : Colors.grey);
                            }),
                            SizedBox(width: 8),
                            Text("$rating and above"),
                          ],
                        ),
                      );
                    }).toList(),
                  )),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: CustomElevatedButton(
                        onPressed: controller.resetFilters,
                        text: 'Reset Filter'),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: CustomElevatedButton(
                        onPressed: controller.applyFilters, text: 'Apply'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Text(title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      );
}
