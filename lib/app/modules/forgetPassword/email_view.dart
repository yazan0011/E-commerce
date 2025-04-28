import 'package:e_co/app/modules/forgetPassword/email_controller.dart';
import 'package:e_co/app/widgets/forgetPasswordW/email_step.dart';
import 'package:e_co/app/widgets/forgetPasswordW/new_password.dart';
import 'package:e_co/app/widgets/forgetPasswordW/opt_input.dart';

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
