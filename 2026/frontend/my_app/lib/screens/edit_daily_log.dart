import 'package:flutter/material.dart';
import 'package:my_app/supabase.dart';

class EditDailyLog extends StatefulWidget {
  final Map<String, dynamic> dailyLog;

  const EditDailyLog({super.key, required this.dailyLog});

  @override
  State<EditDailyLog> createState() => _EditDailyLogState();
}

class _EditDailyLogState extends State<EditDailyLog> {

  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Note')),
      body: Column(
        children: [
          TextField(
            controller: titleController..text = widget.dailyLog['title'] ?? '',

            decoration: const InputDecoration(hintText: 'Title'),
          ),
          TextField(
            controller: bodyController..text = widget.dailyLog['body'] ?? '',
            decoration: const InputDecoration(hintText: 'Body'),
          ),
          ElevatedButton(
            onPressed: () async {
              // Save the daily log entry
              await supabase.from('daily_logs').update({
                'title': titleController.text,
                'body': bodyController.text,
              }).eq('id', widget.dailyLog['id']);
              // Navigate back to the previous screen
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              textStyle: Theme.of(context).textTheme.titleMedium,
            ), child: const Text('Save Daily Log'),
          ),
          ElevatedButton(onPressed: () {
            Navigator.pop(context);
          }, child: const Text('Cancel'))
      ],
      )
    );
  }
}