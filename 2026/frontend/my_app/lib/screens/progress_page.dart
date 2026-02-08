import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:my_app/screens/schedule_maker.dart';
import 'package:my_app/supabase.dart';

class ProgressPage extends HookWidget {
	const ProgressPage({super.key});

	@override
	Widget build(BuildContext context) {
    final future = useMemoized(() => supabase.from('progress').select('id, created_at, schedule, user_id'));
    final snapshot = useFuture(future);

    // If the user does not already have a progress tracker, we create one for them. 
    if (!snapshot.hasData) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ScheduleMaker(),
        ),
      );
      return const Center(child: CircularProgressIndicator());
    }

    final List<dynamic> progressData = snapshot.data as List<dynamic>? ?? [];
    debugPrint('Progress Data: $progressData');

		return Scaffold(
			appBar: AppBar(title: const Text('Progress')),
			body: const Center(child: Text('Progress Page')),
		);
	}
}

