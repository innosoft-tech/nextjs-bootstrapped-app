import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NPN The Legacy Church'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome to NPN The Legacy Church',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              'Latest Sermon',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            // Placeholder for latest sermon widget
            Container(
              height: 150,
              color: Colors.grey[300],
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: const Center(child: Text('Latest Sermon Video Placeholder')),
            ),
            const SizedBox(height: 20),
            const Text(
              'Upcoming Events',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            // Placeholder for events list
            Container(
              height: 150,
              color: Colors.grey[300],
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: const Center(child: Text('Upcoming Events List Placeholder')),
            ),
            const SizedBox(height: 20),
            const Text(
              'Quick Links',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            Wrap(
              spacing: 10,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/sermons');
                  },
                  child: const Text('Sermons'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/events');
                  },
                  child: const Text('Events'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/prayer-requests');
                  },
                  child: const Text('Prayer Requests'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/leadership');
                  },
                  child: const Text('Leadership'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/notes');
                  },
                  child: const Text('Notes'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
