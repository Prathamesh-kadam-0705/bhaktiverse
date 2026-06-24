import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';
import '../widgets/auth_button.dart';
import '../widgets/auth_text_field.dart';

class ForgotPasswordView extends GetView<AuthController> {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Forgot Password",
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            AuthTextField(
              controller:
              controller.forgotEmailController,
              hintText: "Email Address",
              keyboardType:
              TextInputType.emailAddress,
            ),

            const SizedBox(height: 24),

            Obx(
                  () => AuthButton(
                text: "Send Reset Link",
                isLoading: controller.forgotPasswordLoading.value,
                onPressed: controller.forgotPassword,
              ),
            ),
          ],
        ),
      ),
    );
  }
}