import 'package:flutter/material.dart';
import 'package:my_app/supabase.dart';

class EditNote extends StatefulWidget {
  final Map<String, dynamic> note;

  const EditNote({super.key, required this.note});

  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {

  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Note')),
      body: Column(
        children: [
          TextField(
            controller: titleController..text = widget.note['title'] ?? '',

            decoration: const InputDecoration(hintText: 'Title'),
          ),
          TextField(
            controller: bodyController..text = widget.note['body'] ?? '',
            decoration: const InputDecoration(hintText: 'Body'),
          ),
          ElevatedButton(
            onPressed: () async {
              // Save the daily log entry
              await supabase.from('notes').update({
                'title': titleController.text,
                'body': bodyController.text,
              }).eq('id', widget.note['id']);

              debugPrint('Note updated successfully');

              // Navigate back to the previous screen
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              textStyle: Theme.of(context).textTheme.titleMedium,
            ), child: const Text('Save Notes'),
          ),
          ElevatedButton(onPressed: () {
            Navigator.pop(context);
          }, child: const Text('Cancel'))
      ],
      )
    );  
  }
}