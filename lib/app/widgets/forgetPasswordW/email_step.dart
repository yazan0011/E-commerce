import 'package:e_co/app/utils/constants.dart';
import 'package:e_co/app/widgets/publicW/elevated_button.dart';
import 'package:e_co/app/widgets/publicW/text_feild.dart';
import 'package:flutter/material.dart';

class EmailStep extends StatelessWidget {
  final controller;
  const EmailStep({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          const SizedBox(height: 100),
          Text(
            "Forgot Password",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "Enter your email address",
            style: TextStyle(color: Colors.grey[600], fontSize: 16),
          ),
          const SizedBox(height: 70),
          CustomTextField(
            hintText: "Email",
            controller: controller.emailController,
            keyboardType: TextInputType.emailAddress,
            icon: Icons.email,
          ),
          const SizedBox(height: 20),
          CustomElevatedButton(
            text: "Send OTP",
            onPressed: () {
              controller.nextStep();
            },
          ),
        ],
      ),
    );
  }
}
