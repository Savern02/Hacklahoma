import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TextField(
        controller: emailController
      ),
      TextField(
        controller: passwordController,
        obscureText: true,
      ),
      MaterialButton(
        onPressed: () async {
          await supabase.auth.signInWithPassword(
            email: emailController.text,
            password: passwordController.text,
          );
        })
    ],);
  }
}