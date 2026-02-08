import 'package:flutter/material.dart';
import 'package:my_app/widgets/sidebar.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const Sidebar(),
          Expanded(
            child: Column(
              children: const [
                  
                Expanded(child: DashboardContent()),
        floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

