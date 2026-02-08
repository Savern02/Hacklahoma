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
          try {
            final authResponse = await supabase.auth.signUp(email: emailController.text, password: passwordController.text);
            if (authResponse.user != null) {
              // Give the user time to read the email confirmation before redirecting to the dashboard
              await Future.delayed(const Duration(seconds: 1));
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DashboardPage(),
                ),
              );
            }
            } on AuthException catch (error) {
              // Handle specific Supabase Auth errors
              debugPrint('Sign up error: ${error.message}');
            } catch (error) {
              // Handle other potential errors
              debugPrint('An unexpected error occurred: $error');
            }
        })
    ],);
  }
}