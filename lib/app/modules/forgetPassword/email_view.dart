import 'package:e_co/app/modules/forgetPassword/email_controller.dart';
import 'package:e_co/app/widgets/publicW/elevated_button.dart';
import 'package:e_co/app/widgets/publicW/text_feild.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_co/app/utils/constants.dart';

class ForgetPasswordView extends StatelessWidget {
  ForgetPasswordView({Key? key}) : super(key: key);

  final ForgetPasswordController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Obx(() {
          if (controller.currentStep.value == 0) {
            return EmailStep(
              controller: controller,
            );
          } else if (controller.currentStep.value == 1) {
            return OTPInput(
              controller: controller,
              controllers: controller.otpControllers,
              borderColor: AppColors.primary,
            );
          } else {
            return NewPassword(
              controller: controller,
            );
          }
        }),
      ),
    );
  }
}

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

class OTPInput extends StatelessWidget {
  final List<TextEditingController> controllers;
  final Color borderColor;
  final controller;

  OTPInput(
      {Key? key,
      required this.controllers,
      required this.borderColor,
      this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          const SizedBox(height: 100),
          Text(
            "Enter OTP",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "Check your email for the OTP",
            style: TextStyle(color: Colors.grey[600], fontSize: 16),
          ),
          const SizedBox(height: 70),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(6, (index) {
              return SizedBox(
                width: 45,
                child: TextField(
                  controller: controllers[index],
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  maxLength: 1,
                  style: TextStyle(fontSize: 24),
                  decoration: InputDecoration(
                    counterText: "",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: borderColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: borderColor, width: 2),
                    ),
                  ),
                  onChanged: (value) {
                    print(controller.otpCode);
                    if (value.isNotEmpty && index < 5) {
                      FocusScope.of(context).nextFocus();
                    }
                    if (value.isEmpty && index > 0) {
                      FocusScope.of(context).previousFocus();
                    }
                  },
                ),
              );
            }),
          ),
          const SizedBox(height: 20),
          CustomElevatedButton(
            text: "Verify OTP",
            onPressed: () {
              controller.nextStep();
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
