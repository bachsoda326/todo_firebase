import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_firebase/frameworks/app_routes.dart' as routes;
import 'package:todo_firebase/pages/login/controllers/login_controller.dart';
import 'package:todo_firebase/utils/validation_utils.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginController = Get.find<LoginController>();

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Form(
            key: loginController.formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: loginController.emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: ValidationUtils.validateEmail,
                ),
                const SizedBox(height: 24),
                TextFormField(
                  controller: loginController.passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: ValidationUtils.validatePassword,
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () => Get.toNamed(routes.signupRoute),
                    child: const Text(
                      'Sign up?',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: loginController.login,
                  child: const Text('Login'),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: loginController.loginAnonymous,
                  child: const Text('Login anonymous'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
