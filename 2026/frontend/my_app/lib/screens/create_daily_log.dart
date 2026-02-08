import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

class CreateDailyLog extends StatefulWidget {
  const CreateDailyLog({super.key});

  @override
  State<CreateDailyLog> createState() => _CreateDailyLogState();
}

class _CreateDailyLogState extends State<CreateDailyLog> {

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text('Create Daily Log')),
      body: Column(
        children: [
          TextField(
            decoration: const InputDecoration(
              labelText: 'Title',
            ),
            controller: titleController,
          ),
          TextField(
            decoration: const InputDecoration(
              labelText: 'Description',
            ),
            controller: descriptionController,
          ),
          ElevatedButton(
            onPressed: () async {
              // Save the daily log entry
              await supabase.from('daily_logs').insert({
                'title': titleController.text,
                'body': descriptionController.text,
              });

              // Navigate back to the previous screen
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              textStyle: Theme.of(context).textTheme.titleMedium,
            ),
            child: const Text('Save Log Entry'),
          ),
        ],
      ),
    );
  }
}