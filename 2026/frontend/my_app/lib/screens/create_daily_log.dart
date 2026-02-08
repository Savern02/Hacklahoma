import 'package:flutter/material.dart';
import 'package:my_app/supabase.dart';

class CreateDailyLog extends StatefulWidget {
  const CreateDailyLog({super.key});

  @override
  State<CreateDailyLog> createState() => _CreateDailyLogState();
}

class _CreateDailyLogState extends State<CreateDailyLog> {

  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text('Create Daily Log')),
      body: Column(
        children: [
          TextField(
            decoration: const InputDecoration(hintText: 'Title',),
            controller: titleController,
          ),
          TextField(
            decoration: const InputDecoration(hintText: 'Body',),
            controller: bodyController,
          ),
          ElevatedButton(
            onPressed: () async {
              // Save the daily log entry
              await supabase.from('daily_logs').insert({
                'title': titleController.text,
                'body': bodyController.text,
              });

              // Navigate back to the previous screen
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              textStyle: Theme.of(context).textTheme.titleMedium,
            ), child: const Text('Save Log Entry'),
          ),
        ],
      ),
    );
  }
}