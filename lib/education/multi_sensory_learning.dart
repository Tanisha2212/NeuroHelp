import 'package:flutter/material.dart';

class MultiSensoryLearningPage extends StatefulWidget {
  @override
  _MultiSensoryLearningPageState createState() => _MultiSensoryLearningPageState();
}

class _MultiSensoryLearningPageState extends State<MultiSensoryLearningPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Multi-Sensory Learning'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(icon: Icon(Icons.visibility), text: 'Visual'),
            Tab(icon: Icon(Icons.hearing), text: 'Auditory'),
            Tab(icon: Icon(Icons.touch_app), text: 'Interactive'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildVisualTab(),
          _buildAuditoryTab(),
          _buildInteractiveTab(),
        ],
      ),
    );
  }

  Widget _buildVisualTab() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Visual Learning Resources',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          _buildResourceCard(
            'Mind Maps',
            'Visual representation of concepts and connections',
            Icons.bubble_chart,
            Colors.purple,
          ),
          SizedBox(height: 12),
          _buildResourceCard(
            'Infographics',
            'Visual breakdown of complex information',
            Icons.insert_chart,
            Colors.blue,
          ),
          SizedBox(height: 12),
          _buildResourceCard(
            'Video Tutorials',
            'Visual demonstrations with captions',
            Icons.video_library,
            Colors.red,
          ),
          SizedBox(height: 12),
          _buildResourceCard(
            'Color Coding',
            'Information organized by color categories',
            Icons.color_lens,
            Colors.amber,
          ),
        ],
      ),
    );
  }

  Widget _buildAuditoryTab() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Auditory Learning Resources',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          _buildResourceCard(
            'Audio Lessons',
            'Narrated explanations of concepts',
            Icons.headphones,
            Colors.green,
          ),
          SizedBox(height: 12),
          _buildResourceCard(
            'Podcasts',
            'Educational discussions and interviews',
            Icons.mic,
            Colors.orange,
          ),
          SizedBox(height: 12),
          _buildResourceCard(
            'Music & Rhymes',
            'Concepts set to music for better retention',
            Icons.music_note,
            Colors.pink,
          ),
          SizedBox(height: 12),
          _buildResourceCard(
            'Guided Discussions',
            'Interactive dialogue-based learning',
            Icons.record_voice_over,
            Colors.cyan,
          ),
        ],
      ),
    );
  }

  Widget _buildInteractiveTab() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Interactive Learning Resources',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          _buildResourceCard(
            'Simulations',
            'Virtual environments for practical learning',
            Icons.public,
            Colors.indigo,
          ),
          SizedBox(height: 12),
          _buildResourceCard(
            'Interactive Games',
            'Learning through play and exploration',
            Icons.games,
            Colors.deepOrange,
          ),
          SizedBox(height: 12),
          _buildResourceCard(
            'Hands-on Activities',
            'Physical exercises to reinforce concepts',
            Icons.build,
            Colors.brown,
          ),
          SizedBox(height: 12),
          _buildResourceCard(
            'Quizzes & Challenges',
            'Test knowledge through interactive formats',
            Icons.quiz,
            Colors.teal,
          ),
        ],
      ),
    );
  }

  Widget _buildResourceCard(String title, String description, IconData icon, Color color) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.2),
          child: Icon(icon, color: color),
        ),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(description),
        trailing: Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {},
      ),
    );
  }
}