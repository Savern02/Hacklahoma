import 'package:flutter/material.dart';
import 'package:my_app/widgets/sidebar.dart';
import 'package:my_app/screens/homepage.dart';
import 'package:my_app/supabase.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Row(
        children: [
          const Sidebar(),
          Expanded(
          child: Center(child: ElevatedButton(
                  onPressed: () async {
                    await supabase.auth.signOut();
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  },
                  child: const Text('Sign Out'), ),),),
          
        ],),
    );
  }
}
