import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/routes/app_routes.dart';
import '../../../core/services/auth_service.dart';

class AuthController extends GetxController {
  final AuthService _authService = Get.find<AuthService>();

  // Login
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Register
  final registerNameController = TextEditingController();
  final registerEmailController = TextEditingController();
  final registerPasswordController = TextEditingController();

  // Forgot Password
  final forgotEmailController = TextEditingController();

  // Loading States
  final loginLoading = false.obs;
  final registerLoading = false.obs;
  final forgotPasswordLoading = false.obs;

  bool _isValidEmail(String email) {
    return GetUtils.isEmail(email);
  }

  Future<void> login() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty) {
      Get.snackbar("Error", "Please enter email");
      return;
    }

    if (!_isValidEmail(email)) {
      Get.snackbar("Error", "Please enter valid email");
      return;
    }

    if (password.isEmpty) {
      Get.snackbar("Error", "Please enter password");
      return;
    }

    try {
      loginLoading.value = true;

      await _authService.login(
        email: email,
        password: password,
      );

      Get.offAllNamed(
        Routes.MAIN_NAVIGATION,
      );

      Get.snackbar(
        "Success",
        "Login Successful",
      );
      Get.offAllNamed(
        Routes.MAIN_NAVIGATION,
      );
    } catch (e) {
      Get.snackbar(
        "Login Failed",
        _getErrorMessage(e),
      );
    } finally {
      loginLoading.value = false;
    }
  }

  Future<void> register() async {
    final name = registerNameController.text.trim();
    final email = registerEmailController.text.trim();
    final password = registerPasswordController.text.trim();

    if (name.isEmpty ||
        email.isEmpty ||
        password.isEmpty) {
      Get.snackbar(
        "Error",
        "Please fill all fields",
      );
      return;
    }

    if (!_isValidEmail(email)) {
      Get.snackbar(
        "Error",
        "Please enter valid email",
      );
      return;
    }

    if (password.length < 6) {
      Get.snackbar(
        "Error",
        "Password must be at least 6 characters",
      );
      return;
    }

    try {
      registerLoading.value = true;

      await _authService.register(
        email: email,
        password: password,
      );

      Get.back();

      Get.snackbar(
        "Success",
        "Registration Successful",
      );
    } catch (e) {
      Get.snackbar(
        "Registration Failed",
        _getErrorMessage(e),
      );
    } finally {
      registerLoading.value = false;
    }
  }

  Future<void> forgotPassword() async {
    final email = forgotEmailController.text.trim();

    if (email.isEmpty) {
      Get.snackbar(
        "Error",
        "Please enter email",
      );
      return;
    }

    if (!_isValidEmail(email)) {
      Get.snackbar(
        "Error",
        "Please enter valid email",
      );
      return;
    }

    try {
      forgotPasswordLoading.value = true;

      await _authService.resetPassword(
        email: email,
      );

      Get.back();

      Get.snackbar(
        "Success",
        "Password reset email sent",
      );
    } catch (e) {
      Get.snackbar(
        "Error",
        _getErrorMessage(e),
      );
    } finally {
      forgotPasswordLoading.value = false;
    }
  }

  String _getErrorMessage(dynamic error) {
    final message = error.toString();

    if (message.contains('user-not-found')) {
      return 'No user found with this email';
    }

    if (message.contains('wrong-password')) {
      return 'Incorrect password';
    }

    if (message.contains('email-already-in-use')) {
      return 'Email already registered';
    }

    if (message.contains('invalid-email')) {
      return 'Invalid email address';
    }

    if (message.contains('weak-password')) {
      return 'Password is too weak';
    }

    return 'Something went wrong';
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();

    registerNameController.dispose();
    registerEmailController.dispose();
    registerPasswordController.dispose();

    forgotEmailController.dispose();

    super.onClose();
  }
}