import 'package:flutter/material.dart';
import 'package:my_app/screens/daily_logs.dart';

class JournalPage extends StatelessWidget {
	const JournalPage({super.key});

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(title: const Text('Journal')),
			body: Center(child: Row(children: [
        ElevatedButton(onPressed: () {
          //Navigate to the Daily Log Page
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => DailyLogsPage(),
            ),
          );
        }, child: const Text('Add Daily Log Entry'))
        ],
        ),
      ),
		);
	}
}

