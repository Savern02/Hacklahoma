import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

// We use the HookWidget over the StatefulWidget because they handle async data better and are more concise.
// They also have a lot of built in hooks that make it easier to manage state and side effects.
class NotesPage extends HookWidget {
  const NotesPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    final future = useMemoized(() => supabase.from('notes').select('title, body, created_at'));
    final snapshot = useFuture(future);

    if (snapshot.hasError) {
      return Center(child: Text('Error: ${snapshot.error}'));
    }

    final List<dynamic> notes = snapshot.data as List<dynamic>? ?? [];

    debugPrint('Notes: $notes');

    return Scaffold(
      appBar: AppBar(title: const Text('Notes')),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          final note = notes[index];
          return ListTile(
            title: Text(
              note['title'] ?? 'No title', 
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.0,
                fontWeight: FontWeight.bold)
            ),

            subtitle: Text(
              'Created on: ${note['created_at'].toString().substring(0, note['created_at'].toString().indexOf('T'))}\n${note['body'] ?? 'No content'}',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12.0)
            ),
          );
        },
      ),
    );
  }
}