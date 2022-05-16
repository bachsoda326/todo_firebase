import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:todo_firebase/utils/validation_utils.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _userNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    if (_formKey.currentState?.validate() ?? false) {}
  }

  Future<void> _loginAnonymous() async {
    EasyLoading.show(maskType: EasyLoadingMaskType.black);

    try {
      final userCredential = await FirebaseAuth.instance.signInAnonymously();
      debugPrint('Signed in with temporary account. $userCredential');

      EasyLoading.dismiss();
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();

      switch (e.code) {
        case 'operation-not-allowed':
          debugPrint('Anonymous auth hasn\'t been enabled for this project.');
          break;
        default:
          debugPrint('Unknown error.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _userNameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: ValidationUtils.validateEmail,
                ),
                const SizedBox(height: 24),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: ValidationUtils.validatePassword,
                ),
                const SizedBox(height: 4),
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () => {},
                    child: const Text('Sign up?'),
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: _login,
                  child: const Text('Login'),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _loginAnonymous,
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
