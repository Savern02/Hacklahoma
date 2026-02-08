import 'package:flutter/material.dart';
import 'package:my_app/widgets/sidebar.dart';
<<<<<<< HEAD
import 'package:my_app/screens/progress_page.dart';
import 'package:my_app/screens/journal_page.dart';
import 'package:my_app/screens/nutrition_page.dart';

class DashboardContent extends StatelessWidget {
  const DashboardContent({super.key});
=======

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});
>>>>>>> 2ad739537ac8d59f59a7516e9ac2b695e01123a1

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Example increment logic
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      body: Row(
        children: [
          const Sidebar(),
          Expanded(
            child: Column(
              children: [
                // Replace this with your actual content
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ProgressPage(),
                      ),
                    );
                  },
                  child: const Text('Progress Tracker'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => JournalPage(),
                      ),
                    );
                  },
                  child: const Text('Journal'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => NutritionPage(),
                      ),
                    );
                  },
                  child: const Text('Nutrition Tracker'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const DashboardContent();
  }
}
