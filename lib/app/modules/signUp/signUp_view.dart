import 'package:e_co/app/modules/signIn/signIn_view.dart';
import 'package:e_co/app/modules/signUp/signUp_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_co/app/utils/constants.dart';
import 'package:e_co/app/widgets/publicW/elevated_button.dart';
import 'package:e_co/app/widgets/publicW/text_feild.dart';

class SignUpView extends StatelessWidget {
  SignUpView({Key? key}) : super(key: key);

  final SignUpController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 80),
                Text(
                  "Create Account",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Text(
                  "Sign up to get started!",
                  style: TextStyle(color: Colors.grey[600], fontSize: 16),
                ),
                const SizedBox(height: 60),
                CustomTextField(
                  hintText: "Email",
                  controller: controller.emailController,
                  keyboardType: TextInputType.emailAddress,
                  icon: Icons.email,
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  hintText: "Password",
                  controller: controller.passwordController,
                  obscureText: true,
                  icon: Icons.lock,
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  hintText: "Confirm Password",
                  controller: controller.confirmPasswordController,
                  obscureText: true,
                  icon: Icons.lock_outline,
                ),
                const SizedBox(height: 20),
                CustomElevatedButton(
                  text: "Sign Up",
                  onPressed: () {
                    // Perform sign-up logic
                    // Then navigate to HomeView or LoginView
                  },
                ),
                const SizedBox(height: 20),
                Row(
                  children: const [
                    Expanded(child: Divider(thickness: 1)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text("Or sign in with"),
                    ),
                    Expanded(child: Divider(thickness: 1)),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(width: 20),
                    socialButton(
                      icon: Icons.g_mobiledata,
                    ),
                    const SizedBox(width: 20),
                    socialButton(
                      icon: Icons.facebook,
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account? "),
                    GestureDetector(
                      onTap: () {
                        Get.back(); // Go back to login screen
                      },
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
