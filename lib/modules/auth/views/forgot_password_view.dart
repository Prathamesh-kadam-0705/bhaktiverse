import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/auth_button.dart';
import '../widgets/auth_text_field.dart';

class ForgotPasswordView extends StatelessWidget {

  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {

    final emailController = TextEditingController();

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          "Forgot Password",
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            AuthTextField(
              controller: emailController,
              hintText: "Email Address",
            ),

            const SizedBox(height: 24),

            AuthButton(
              text: "Send Reset Link",
              onPressed: () {

                Get.snackbar(
                  "Success",
                  "Password reset link sent",
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