import 'package:flutter/material.dart';
import 'package:sample_chat_app/utils/extensions/build_context_ext.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Text(
                context.strings.signUpWithGoogle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
