import 'package:flutter/material.dart';

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
            SizedBox(height: 8.0),
            Text(
              'Created on: ${note['created_at'].toString().substring(0, note['created_at'].toString().indexOf('T'))}\n\n${note['body'] ?? 'No content'}',
                style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 14.0)
            ),
          ],
        ),
      ),
    );
  }
}