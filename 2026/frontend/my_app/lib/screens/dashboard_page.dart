import 'package:flutter/material.dart';
import 'package:my_app/widgets/sidebar.dart';
import 'package:my_app/screens/progress_page.dart';
import 'package:my_app/screens/journal_page.dart';
import 'package:my_app/screens/nutrition_page.dart';
import 'package:my_app/widgets/topbar.dart';
import 'package:my_app/widgets/gemini_chat.dart';

class DashboardContent extends StatelessWidget {
  const DashboardContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ChatScreen()),
          );
        },
        tooltip: 'Talk to your AI Coach',
        child: const Icon(Icons.chat_bubble_outline),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     // Example increment logic
      //   },
      //   tooltip: 'Account',
      //   child: const Icon(Icons.manage),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body: Row(
        children: [
          const Sidebar(),
          Expanded(
            child: Center ( child:Column(
              mainAxisSize: MainAxisSize.min, // only take needed vertical space
              mainAxisAlignment: MainAxisAlignment.center, // center vertically
              children: [
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
            ),),
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
