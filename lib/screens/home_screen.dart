import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart'; // This import is not needed

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zap The Gap'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              icon: const Icon(Icons.schedule),
              label: const Text('View Schedule'),
              onPressed: () => Navigator.pushNamed(context, '/schedule'),
            ),
            ElevatedButton.icon(
              icon: const Icon(Icons.task),
              label: const Text('Task Manager'),
              onPressed: () => Navigator.pushNamed(context, '/tasks'),
            ),
            ElevatedButton.icon(
              icon: const Icon(Icons.timer),
              label: const Text('Study Tools'),
              onPressed: () => Navigator.pushNamed(context, '/study'),
            ),
            ElevatedButton.icon(
              icon: const Icon(Icons.notifications),
              label: const Text('Reminders'),
              onPressed: () => Navigator.pushNamed(context, '/reminders'),
            ),
            ElevatedButton.icon(
              icon: const Icon(Icons.settings),
              label: const Text('Settings'),
              onPressed: () => Navigator.pushNamed(context, '/settings'),
            ),
          ],
        ),
      ),
    );
  }
}
