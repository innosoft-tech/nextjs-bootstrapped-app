import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PrayerRequestsScreen extends StatefulWidget {
  const PrayerRequestsScreen({Key? key}) : super(key: key);

  @override
  _PrayerRequestsScreenState createState() => _PrayerRequestsScreenState();
}

class _PrayerRequestsScreenState extends State<PrayerRequestsScreen> {
  final _supabase = Supabase.instance.client;
  final _prayerController = TextEditingController();
  bool _loading = false;
  String? _message;

  Future<void> _submitPrayerRequest() async {
    final user = _supabase.auth.currentUser;
    if (user == null) {
      setState(() {
        _message = 'You must be logged in to submit a prayer request.';
      });
      return;
    }
    setState(() {
      _loading = true;
      _message = null;
    });
    final response = await _supabase.from('prayer_requests').insert({
      'user_id': user.id,
      'request': _prayerController.text,
      'created_at': DateTime.now().toIso8601String(),
    }).execute();
    setState(() {
      _loading = false;
    });
    if (response.error != null) {
      setState(() {
        _message = 'Error: ${response.error!.message}';
      });
    } else {
      setState(() {
        _message = 'Prayer request submitted successfully.';
        _prayerController.clear();
      });
    }
  }

  @override
  void dispose() {
    _prayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prayer Requests'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            if (_message != null)
              Text(
                _message!,
                style: TextStyle(
                  color: _message!.startsWith('Error') ? Colors.red : Colors.green,
                ),
              ),
            TextField(
              controller: _prayerController,
              decoration: const InputDecoration(
                labelText: 'Enter your prayer request',
              ),
              maxLines: 4,
            ),
            const SizedBox(height: 20),
            _loading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: _submitPrayerRequest,
                    child: const Text('Submit'),
                  ),
          ],
        ),
      ),
    );
  }
}
