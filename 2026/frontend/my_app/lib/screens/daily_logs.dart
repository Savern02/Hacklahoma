import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

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
          return ListTile(
            title: Text(
              dailyLog['title'] ?? 'No title', 
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.0,
                fontWeight: FontWeight.bold)
            ),

            // This bit of code is way too long, but it works, don't break it, please.
            subtitle: Text(
              'Created on: ${dailyLog['created_at'].toString().substring(0, dailyLog['created_at'].toString().indexOf('T'))}r',
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