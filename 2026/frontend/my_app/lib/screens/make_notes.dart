import 'package:flutter/material.dart';

class MakeNotes extends StatefulWidget {
  const MakeNotes({super.key});

  @override
  State<MakeNotes> createState() => _MakeNotesState();
}

class _MakeNotesState extends State<MakeNotes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Make Notes')),
      body: const Center(child: Text('This is the Make Notes page')),
    );
  }
}