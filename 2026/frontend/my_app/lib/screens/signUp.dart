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
            try {
              final authResponse = await supabase.auth.signUp(email: emailController.text, password: passwordController.text);
              if (authResponse.user != null) {

                // Inform the user of successful sign in and of the email confermation step.
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Sign up successful! Please check your email to confirm your account.')),
                );

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