import 'package:flutter/material.dart';
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
    return Column(
      children: [
        TextField(
          controller: emailController,
          ),
        TextField(
          controller: passwordController,
          obscureText: true,
          ),
        TextField(
          controller: firstNameController,
          ),
        TextField(
          controller: lastNameController,
          ),
        MaterialButton(
          onPressed: () async {
            await supabase.auth.signUp(
              email: emailController.text,
              password: passwordController.text,
            );
            await supabase.from('profiles').insert({
              'id': supabase.auth.currentUser!.id,
              'first_name': firstNameController.text,
              'last_name': lastNameController.text,
            });
          }, child: Text("Sign Up"),
        )
      ],);
  }
}