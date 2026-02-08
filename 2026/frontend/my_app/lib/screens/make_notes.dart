import 'package:flutter/material.dart';
import 'package:my_app/supabase.dart';

class MakeNotes extends StatefulWidget {
  const MakeNotes({super.key});

  @override
  State<MakeNotes> createState() => _MakeNotesState();
}

class _MakeNotesState extends State<MakeNotes> {

  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Make Notes')),
      body: Column(
        children: [
          TextField(
            controller: titleController,
            decoration: const InputDecoration(hintText: 'Title'),
          ),
          TextField(
            controller: bodyController,
            decoration: const InputDecoration(hintText: 'Body'),
          ),
          ElevatedButton(
            onPressed: () async {
              // Save the daily log entry
              await supabase.from('notes').insert({
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
            ), child: const Text('Save Notes'),
          )
        ],
      ),
    );
  }
}