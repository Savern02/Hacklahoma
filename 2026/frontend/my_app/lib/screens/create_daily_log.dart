import 'package:flutter/material.dart';

class CreateDailyLog extends StatefulWidget {
  const CreateDailyLog({super.key});

  @override
  State<CreateDailyLog> createState() => _CreateDailyLogState();
}

class _CreateDailyLogState extends State<CreateDailyLog> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text('Create Daily Log')),
      body: Center(child: Text('This is where you will create a daily log entry.')),
    );
  }
}