import 'package:flutter/material.dart';
import 'package:my_app/screens/dashboard_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

// This is the state for the SignUp widget.
// It displays two text input fields, one for email and one for password, and on pressing the submit button,
// it calls the supabase.auth.signUp method with the email and password provided by the user.
class _SignUpState extends State<SignUp> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  Widget build(BuildContext context) {
    return Material( 
      child: Column(
      children: [
        TextField(
          decoration: InputDecoration(hintText: 'Email'),
          controller: emailController,
          ),
        TextField(
          decoration: InputDecoration(hintText: 'Password'),
          controller: passwordController,
          obscureText: true,
          ),
        TextField(
          decoration: InputDecoration(hintText: 'First Name'),
          controller: firstNameController,
          ),
        TextField(
          decoration: InputDecoration(hintText: 'Last Name'),
          controller: lastNameController,
          ),
        MaterialButton(
          onPressed: () async {
            final authResponse = await supabase.auth.signUp(
              email: emailController.text,
              password: passwordController.text,
            );

            if (authResponse.user != null) {
              debugPrint("User signed up successfully: ${authResponse.user!.email}");

              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const DashboardPage()));
            }

            await supabase.from('users').insert({
              'first_name': firstNameController.text,
              'last_name': lastNameController.text,
              'email': emailController.text,
            });
          }, child: Text("Sign Up"),
        )
      ],)
    );
  }
}