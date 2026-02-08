import 'package:flutter/material.dart';
import 'package:my_app/screens/dashboard_page.dart';
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
    return Material( 
      child: Column(children: [
      TextField(
        decoration: InputDecoration(
            hintText: 'Email'
        ),
        controller: emailController
      ),
      TextField(
        decoration: InputDecoration(
            hintText: 'Password'
        ),
        controller: passwordController,
        obscureText: true,
      ),
      MaterialButton(
        onPressed: () async {
          final authResponse = await supabase.auth.signInWithPassword(
            email: emailController.text,
            password: passwordController.text,
          );

          if (authResponse.user != null) {
              debugPrint("User signed in successfully: ${authResponse.user!.email}");

              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const DashboardPage()));
            }
        })
    ],)
    );
  }
}