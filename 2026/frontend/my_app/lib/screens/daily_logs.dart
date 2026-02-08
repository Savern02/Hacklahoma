import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:my_app/screens/daily_log_detail.dart';
import 'package:my_app/supabase.dart';

class DailyLogsPage extends HookWidget {
  const DailyLogsPage({super.key});

  @override
  Widget build(BuildContext context) {
        final future = useMemoized(() => supabase.from('daily_logs').select('title, body, created_at'));
    final snapshot = useFuture(future);

    if (snapshot.hasError) {
      return Center(child: Text('Error: ${snapshot.error}'));
    }

    final List<dynamic> dailyLogs = snapshot.data as List<dynamic>? ?? [];

    debugPrint('Daily Logs:: $dailyLogs');

    return Scaffold(
      appBar: AppBar(title: const Text('Daily Logs')),
      body: ListView.builder(
        itemCount: dailyLogs.length,
        itemBuilder: (context, index) {
          final dailyLog = dailyLogs[index];

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: ElevatedButton(
              onPressed: () {
                // Navigate to the Daily Log Detail Page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DailyLogDetailPage(dailyLog: dailyLog),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
              ),
              child: Text(dailyLog['title'] ?? 'No title'),
            )
          );          
        },
      ),
    );
  }
}