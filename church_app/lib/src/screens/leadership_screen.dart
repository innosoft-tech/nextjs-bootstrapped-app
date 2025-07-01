import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LeadershipScreen extends StatefulWidget {
  const LeadershipScreen({Key? key}) : super(key: key);

  @override
  _LeadershipScreenState createState() => _LeadershipScreenState();
}

class _LeadershipScreenState extends State<LeadershipScreen> {
  final _supabase = Supabase.instance.client;
  List<Map<String, dynamic>> _leaders = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadLeaders();
  }

  Future<void> _loadLeaders() async {
    final response = await _supabase.from('leadership').select().execute();
    if (response.error == null && response.data != null) {
      setState(() {
        _leaders = List<Map<String, dynamic>>.from(response.data);
        _loading = false;
      });
    } else {
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
    if (_leaders.isEmpty) {
      return const Scaffold(
        body: Center(child: Text('No leadership data available')),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leadership'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _leaders.length,
        itemBuilder: (context, index) {
          final leader = _leaders[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(leader['photo_url'] ?? ''),
                radius: 30,
              ),
              title: Text(leader['name'] ?? 'No Name'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(leader['role'] ?? ''),
                  const SizedBox(height: 4),
                  Text(leader['bio'] ?? ''),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
