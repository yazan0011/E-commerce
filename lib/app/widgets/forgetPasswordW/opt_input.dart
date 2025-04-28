import 'package:e_co/app/utils/constants.dart';
import 'package:e_co/app/widgets/publicW/elevated_button.dart';
import 'package:flutter/material.dart';

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
