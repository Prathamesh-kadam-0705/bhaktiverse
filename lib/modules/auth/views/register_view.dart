import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';
import '../widgets/auth_button.dart';
import '../widgets/auth_text_field.dart';

class RegisterView extends GetView<AuthController> {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            AuthTextField(
              controller: controller.registerNameController,
              hintText: "Full Name",
            ),

            const SizedBox(height: 16),

            AuthTextField(
              controller: controller.registerEmailController,
              hintText: "Email",
              keyboardType: TextInputType.emailAddress,
            ),

            const SizedBox(height: 16),

            AuthTextField(
              controller: controller.registerPasswordController,
              hintText: "Password",
              obscureText: true,
            ),

            const SizedBox(height: 24),

            Obx(
                  () => AuthButton(
                text: "Register",
                isLoading: controller.registerLoading.value,
                onPressed: controller.register,
              ),
            ),
          ],
        ),
      ),
    );
  }
}