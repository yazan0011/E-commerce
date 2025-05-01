import 'package:e_co/app/modules/home/home_binding.dart';
import 'package:e_co/app/modules/home/home_view.dart';
import 'package:e_co/app/widgets/publicW/elevated_button.dart';
import 'package:e_co/app/widgets/publicW/text_feild.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'complete_profile_controller.dart';

class CompleteProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CompleteProfileController>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        title: Text('Complete Your Profile', style: TextStyle(fontSize: 20)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 10),
            Text(
              "Don't worry, only you can see your personal data. No one else will be able to see it.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 20),
            Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey.shade300,
                  child: Icon(Icons.person, size: 50, color: Colors.grey),
                ),
                Positioned(
                  bottom: 0,
                  right: 5,
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: const Color.fromARGB(255, 170, 136, 123),
                    child: Icon(Icons.edit, size: 15, color: Colors.white),
                  ),
                )
              ],
            ),
            SizedBox(height: 30),

            // Name Field
            CustomTextField(
              hintText: "Name",
              icon: Icons.person,
              controller: controller.nameController,
            ),

            // Phone Number Field with Country Code
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 12,
                        offset: Offset(0, 6),
                      ),
                    ],
                  ),
                  child: DropdownButton<String>(
                    value: controller.countryCode.value,
                    underline: SizedBox(),
                    items: ["+1", "+91", "+44", "+61"]
                        .map((code) =>
                            DropdownMenuItem(value: code, child: Text(code)))
                        .toList(),
                    onChanged: (value) {
                      controller.countryCode.value = value!;
                    },
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: CustomTextField(
                    hintText: "Phone Number",
                    icon: Icons.phone,
                    keyboardType: TextInputType.phone,
                    controller: controller.phoneController,
                  ),
                ),
              ],
            ),

            // Gender Dropdown
            Obx(() => Container(
                  margin: const EdgeInsets.symmetric(vertical: 12),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 12,
                        offset: Offset(0, 6),
                      ),
                    ],
                  ),
                  child: DropdownButtonFormField<String>(
                    value: controller.gender.value.isEmpty
                        ? null
                        : controller.gender.value,
                    hint: Text("Select Gender"),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.zero,
                    ),
                    items: ["Male", "Female"]
                        .map((gender) => DropdownMenuItem(
                              value: gender,
                              child: Text(gender),
                            ))
                        .toList(),
                    onChanged: (value) {
                      controller.gender.value = value!;
                    },
                  ),
                )),

            SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: CustomElevatedButton(
                text: "Sign In",
                onPressed: () {
                  Get.to(HomeView(), binding: HomeBinding());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
