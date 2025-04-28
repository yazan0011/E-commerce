import 'package:e_co/app/utils/constants.dart';
import 'package:e_co/app/widgets/publicW/elevated_button.dart';
import 'package:e_co/app/widgets/publicW/text_feild.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewPassword extends StatelessWidget {
  final controller;
  const NewPassword({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          const SizedBox(height: 100),
          Text(
            "New Password",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "Create your new password",
            style: TextStyle(color: Colors.grey[600], fontSize: 16),
          ),
          const SizedBox(height: 50),
          CustomTextField(
            hintText: "New Password",
            controller: controller.passwordController,
            obscureText: true,
            icon: Icons.lock,
          ),
          const SizedBox(height: 10),
          CustomTextField(
            hintText: "Confirm Password",
            controller: controller.confirmPasswordController,
            obscureText: true,
            icon: Icons.lock,
          ),
          const SizedBox(height: 20),
          CustomElevatedButton(
            text: "Reset Password",
            onPressed: () {
              // handle password reset
              Get.back(); // go back to login or success screen
            },
          ),
          TextButton(
            onPressed: controller.previousStep,
            child: const Text("Back"),
          ),
        ],
      ),
    );
  }
}
