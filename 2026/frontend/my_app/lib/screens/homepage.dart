import 'package:flutter/material.dart';
import 'package:my_app/screens/login.dart';
import 'package:my_app/screens/signUp.dart';
import 'package:my_app/widgets/swipe_down_arrow.dart';
import 'package:my_app/screens/dashboard_page.dart';
import 'package:my_app/widgets/topbar_wave.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  
  Widget _buildInfoBlock({
  required IconData icon,
  required String title,
  required String content,
}) {
  return Expanded(
    child: Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 40, color: Colors.blueAccent),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              content,
              style: const TextStyle(fontSize: 16, height: 1.5),
            ),
          ],
        ),
      ),
    ),
  );
}



  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: .center,
          children: [
    Text(
      'Welcome to LifeDash!',
      style: Theme.of(context).textTheme.titleLarge,
    ),
    const SizedBox(height: 20),

        // Sign-up / Log-in buttons
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUp()),
                );
              },
              child: const Text('Sign Up'),
            ),
            const SizedBox(width: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Login()),
                );
              },
              child: const Text('Log In'),
            ),
          ],
        ),

        const SizedBox(height: 40),

        // Swipe arrow + scroll hint
        SwipeDownArrow(),
        const SizedBox(height: 8),
        Text(
          "Scroll down for more info",
          style: Theme.of(context).textTheme.bodySmall,
        ),

        const SizedBox(height: 400), // big gap before product info

        // Product Info Section
        LayoutBuilder(
          builder: (context, constraints) {
            bool isWide = constraints.maxWidth > 600;

            if (isWide) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      width: 300,
                      child: _buildInfoBlock(
                        icon: Icons.lightbulb_outline,
                        title: "About LifeDash",
                        content:
                            "LifeDash is your all-in-one productivity dashboard that helps you track goals, journal your progress, and stay on top of your daily habits.",
                      )),
                  SizedBox(
                      width: 300,
                      child: _buildInfoBlock(
                        icon: Icons.check_circle_outline,
                        title: "Features",
                        content:
                            "Track your progress, log daily activities, analyze your habits, and gain actionable insights to optimize your productivity.",
                      )),
                  SizedBox(
                      width: 300,
                      child: _buildInfoBlock(
                        icon: Icons.trending_up,
                        title: "Boost Productivity",
                        content:
                            "By keeping everything in one place, LifeDash reduces friction, improves focus, and helps you achieve your goals faster.",
                      )),
                ],
              );
            } else {
              return Column(
                children: [
                  _buildInfoBlock(
                    icon: Icons.lightbulb_outline,
                    title: "About LifeDash",
                    content:
                        "LifeDash is your all-in-one productivity dashboard that helps you track goals, journal your progress, and stay on top of your daily habits.",
                  ),
                  const SizedBox(height: 24),
                  _buildInfoBlock(
                    icon: Icons.check_circle_outline,
                    title: "Features",
                    content:
                        "Track your progress, log daily activities, analyze your habits, and gain actionable insights to optimize your productivity.",
                  ),
                  const SizedBox(height: 24),
                  _buildInfoBlock(
                    icon: Icons.trending_up,
                    title: "Boost Productivity",
                    content:
                        "By keeping everything in one place, LifeDash reduces friction, improves focus, and helps you achieve your goals faster.",
                  ),
                ],
              );
            }
          },
        ),

        const SizedBox(height: 60), // gap before bottom part

        const BottomPart(),
      ],
    ),
  ),
),
    );
  }
}

class BottomPart extends StatelessWidget {
  const BottomPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.blueGrey[50],
      child: Column(
        children: [
          Text(
            "Made with ❤️ at Hacklahoma 2026",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          Image.asset('assets/images/BeeLogo.png'),
          SizedBox(height: 16),
          Card(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Text("@TeamLifeDash - 2026"),
            ),
          ),
        ],
      ),
    );
  }
}


