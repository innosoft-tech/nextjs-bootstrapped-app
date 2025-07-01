import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SermonsScreen extends StatefulWidget {
  const SermonsScreen({Key? key}) : super(key: key);

  @override
  _SermonsScreenState createState() => _SermonsScreenState();
}

class _SermonsScreenState extends State<SermonsScreen> {
  late YoutubePlayerController _controller;
  final _supabase = Supabase.instance.client;
  List<Map<String, dynamic>> _sermons = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadSermons();
  }

  Future<void> _loadSermons() async {
    final response = await _supabase
        .from('church_streams')
        .select()
        .order('published_date', ascending: false)
        .execute();

    if (response.error == null && response.data != null) {
      setState(() {
        _sermons = List<Map<String, dynamic>>.from(response.data);
        if (_sermons.isNotEmpty) {
          _controller = YoutubePlayerController(
            initialVideoId: _sermons[0]['video_id'],
            params: const YoutubePlayerParams(
              showControls: true,
              showFullscreenButton: true,
            ),
          );
        }
        _loading = false;
      });
    } else {
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  void _playVideo(String videoId) {
    _controller.loadVideoById(videoId: videoId);
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
    if (_sermons.isEmpty) {
      return const Scaffold(
        body: Center(child: Text('No sermons available')),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sermons'),
      ),
      body: Column(
        children: [
          YoutubePlayerIFrame(controller: _controller),
          Expanded(
            child: ListView.builder(
              itemCount: _sermons.length,
              itemBuilder: (context, index) {
                final sermon = _sermons[index];
                return ListTile(
                  title: Text(sermon['title'] ?? 'Untitled Sermon'),
                  subtitle: Text(sermon['published_date'] ?? ''),
                  onTap: () => _playVideo(sermon['video_id']),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
