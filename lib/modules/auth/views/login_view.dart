import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/routes/app_routes.dart';
import '../controllers/auth_controller.dart';
import '../widgets/auth_button.dart';
import '../widgets/auth_text_field.dart';

class LoginView extends GetView<AuthController> {

  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            AuthTextField(
              controller:
              controller.emailController,
              hintText: "Email",
            ),

            const SizedBox(height: 16),

            AuthTextField(
              controller:
              controller.passwordController,
              hintText: "Password",
              obscureText: true,
            ),

            const SizedBox(height: 24),

            Obx(
                  () => AuthButton(
                text: controller.isLoading.value
                    ? "Loading..."
                    : "Login",
                onPressed: controller.login,
              ),
            ),
            TextButton(
              onPressed: () {
                Get.toNamed(
                  Routes.FORGOT_PASSWORD,
                );
              },
              child: const Text(
                "Forgot Password?",
              ),
            ),

            TextButton(
              onPressed: () {
                Get.toNamed(
                  Routes.REGISTER,
                );
              },
              child: const Text(
                "Create Account",
              ),
            ),
          ],
        ),
      ),
    );
  }
}