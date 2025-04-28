import 'package:e_co/app/modules/completeProfile/complete_profile_binding.dart';
import 'package:e_co/app/modules/completeProfile/complete_profile_view.dart';
import 'package:e_co/app/modules/forgetPassword/email_binding.dart';
import 'package:e_co/app/modules/forgetPassword/email_view.dart';

import 'package:e_co/app/modules/signIn/signIn_controller.dart';
import 'package:e_co/app/modules/signUp/signUp_binding.dart';
import 'package:e_co/app/modules/signUp/signUp_view.dart';
import 'package:e_co/app/widgets/publicW/elevated_button.dart';
import 'package:e_co/app/widgets/publicW/text_feild.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_co/app/utils/constants.dart';

class SignInView extends StatelessWidget {
  SignInView({Key? key}) : super(key: key);

  final SignInController controller = Get.find();

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
                const SizedBox(height: 100),
                Text(
                  "Welcome to styliq",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Text(
                  "Sign In to continue",
                  style: TextStyle(color: Colors.grey[600], fontSize: 16),
                ),
                const SizedBox(height: 70),
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
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Get.to(() => ForgetPasswordView(),
                          binding: ForgetPasswordBinding());
                    },
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(color: AppColors.primary),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                CustomElevatedButton(
                  text: "Sign In",
                  onPressed: () {
                    Get.to(CompleteProfileView(),
                        binding: CompleteProfileBinding());
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
                    const Text("Don't have an account? "),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => SignUpView(), binding: SignUpBinding());
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class socialButton extends StatelessWidget {
  final IconData icon;

  const socialButton({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Icon(icon, size: 30),
    );
  }
}
