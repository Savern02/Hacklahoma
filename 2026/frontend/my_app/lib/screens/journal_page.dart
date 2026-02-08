import 'package:flutter/material.dart';
import 'package:my_app/screens/create_daily_log.dart';
import 'package:my_app/screens/daily_logs.dart';
import 'package:my_app/screens/make_notes.dart';
import 'package:my_app/screens/notes.dart';

class JournalPage extends StatelessWidget {
	const JournalPage({super.key});

	@override
	Widget build(BuildContext context) {
		return Scaffold(
      appBar: AppBar(title: const Text('Journal')),
      body: Row(children: [
        // Daily Logs Column
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [  
            ElevatedButton(onPressed: () {
              //Navigate to the Daily Logs Page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => DailyLogsPage(),
                ),
              );
            }, child: const Text("View Daily Logs")),

            ElevatedButton(onPressed: () {
            //Navigate to the Daily Log Creation Page
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => CreateDailyLog(),
              ),
            );
          }, child: const Text('Add Daily Log'))]
        ),

        // Notes Column
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () {
              //Navigate to the Notes Page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => NotesPage(),
                ),
              );
            }, child: const Text("View Notes")),

            ElevatedButton(onPressed: () {
              //Navigate to the Make Notes Page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => MakeNotes(),
                ),
              );
            }, child: const Text('Make Notes')),
          ],
        ),
      ],)
    );
	}
}

