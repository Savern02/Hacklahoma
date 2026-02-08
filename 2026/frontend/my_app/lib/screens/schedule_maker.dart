import 'package:flutter/material.dart';
import 'package:my_app/supabase.dart';

class ScheduleMaker extends StatefulWidget {
  const ScheduleMaker({super.key});

  @override
  State<ScheduleMaker> createState() => _ScheduleMakerState();
}

class _ScheduleMakerState extends State<ScheduleMaker> {
  String freeTimeStart = '00:00';
  String freeTimeEnd = '00:00';

  Future<void> _selectTimes(BuildContext context, TimeOfDay? currentTime, Function(TimeOfDay) updateTime, String) async {
    final TimeOfDay? monStart = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Schedule Maker')),
      );
  }
}