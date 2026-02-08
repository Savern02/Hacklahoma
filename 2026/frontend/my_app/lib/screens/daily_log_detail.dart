import 'package:flutter/material.dart';

class DailyLogDetailPage extends StatelessWidget {
  final Map<String, dynamic> dailyLog;

  const DailyLogDetailPage({super.key, required this.dailyLog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(dailyLog['title'] ?? 'Daily Log Detail')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              dailyLog['title'] ?? 'No title', 
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.bold)
            ),
            // I don't think we want to restrict the height of the body of the daily log, 
            // so I'm commenting this out for now. We can always add it back in if we want to.
            //SizedBox(height: 8.0),
            Text(
              'Logged on: ${dailyLog['created_at'].toString().substring(0, dailyLog['created_at'].toString().indexOf('T'))}\n\n${dailyLog['body'] ?? 'No content'}',
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