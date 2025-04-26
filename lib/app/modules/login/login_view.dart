import 'package:e_co/app/modules/home/home_binding.dart';
import 'package:e_co/app/modules/home/home_view.dart';
import 'package:e_co/app/modules/login/login_controller.dart';
import 'package:e_co/widgets/publicW/elevated_button.dart';
import 'package:e_co/widgets/publicW/text_feild.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_co/app/utils/constants.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);

  final AuthController controller = Get.put(AuthController());

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
                    onPressed: () {},
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
                    Get.to(HomeView(), binding: HomeBinding());
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
                    socialLoginButton(Icons.g_mobiledata),
                    const SizedBox(width: 20),
                    socialLoginButton(Icons.facebook),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account? "),
                    GestureDetector(
                      onTap: () {
                        // Go to sign up page
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

  Widget socialLoginButton(IconData icon) {
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
