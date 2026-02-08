import 'package:flutter/material.dart';
import 'package:my_app/screens/edit_note.dart';
import 'package:my_app/supabase.dart';

class NoteDetailPage extends StatelessWidget {
  final Map<String, dynamic> note;

  const NoteDetailPage({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(note['title'] ?? 'Note Detail')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              note['title'] ?? 'No title', 
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.bold)
            ),
            // I don't think we want to restrict the height of the body of the daily log, 
            // so I'm commenting this out for now. We can always add it back in if we want to.
            //SizedBox(height: 8.0),
            Text(
              'Created on: ${note['created_at'].toString().substring(0, note['created_at'].toString().indexOf('T'))}\n\n${note['body'] ?? 'No content'}',
                style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 14.0)
            ),
            ElevatedButton(onPressed: () {
              // Navigate to the Edit Note Page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => EditNote(note: note),
                ),
              );
            }, child: const Text('Edit Note')),
            ElevatedButton(onPressed: () {
              // Delete the note
              supabase.from('notes').delete().eq('id', note['id']);
              Navigator.pop(context);
            }, child: const Text('Delete Note'))
          ],
        ),
      ),
    );
  }
}