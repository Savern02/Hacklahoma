import 'package:flutter/material.dart';
import 'package:my_app/screens/dashboard_page.dart';
import 'package:my_app/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  String? passwordError;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: Column(
        children: [
          TextField(
            controller: emailController,
            decoration: const InputDecoration(hintText: 'Email'),
          ),
          TextField(
            controller: passwordController,
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Password',
              errorText: passwordError,
            ),
          ),
          TextField(
            controller: firstNameController,
            decoration: const InputDecoration(hintText: 'First Name'),
          ),
          TextField(
            controller: lastNameController,
            decoration: const InputDecoration(hintText: 'Last Name'),
          ),
          ElevatedButton(
            onPressed: () async {
              setState(() => passwordError = null);

              AuthResponse? authResponse;

              try {
                authResponse = await supabase.auth.signUp(
                  email: emailController.text,
                  password: passwordController.text,
                );
              } on AuthException catch (e) {
                setState(() {
                  passwordError = e.message;
                });
                return;
              }

              if (authResponse.user != null) {
                await supabase.from('users').insert({
                  'first_name': firstNameController.text,
                  'last_name': lastNameController.text,
                  'email': emailController.text,
                });

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DashboardPage(),
                  ),
                );
              }
            },
            child: const Text("Sign Up"),
          ),
        ],
      ),
    );
  }
}
