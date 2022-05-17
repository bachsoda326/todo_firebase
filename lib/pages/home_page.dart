import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            onPressed: () =>
                debugPrint(FirebaseAuth.instance.currentUser.toString()),
            icon: const Icon(Icons.info_outline),
          ),
          IconButton(
            onPressed: () async => await FirebaseAuth.instance.signOut(),
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Get.toNamed('/test1'),
          child: const Text('To test 1'),
        ),
      ),
    );
  }
}
