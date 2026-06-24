import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';
import '../widgets/auth_button.dart';
import '../widgets/auth_text_field.dart';

class RegisterView extends GetView<AuthController> {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {

    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(

      appBar: AppBar(
        title: const Text("Register"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            AuthTextField(
              controller: nameController,
              hintText: "Full Name",
            ),

            const SizedBox(height: 16),

            AuthTextField(
              controller: emailController,
              hintText: "Email",
            ),

            const SizedBox(height: 16),

            AuthTextField(
              controller: passwordController,
              hintText: "Password",
              obscureText: true,
            ),

            const SizedBox(height: 24),

            AuthButton(
              text: "Register",
              onPressed: () {

                Get.snackbar(
                  "Success",
                  "Registration Successful",
                );

                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}