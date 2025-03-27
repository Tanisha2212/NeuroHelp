import 'package:flutter/material.dart';

class SocialEmotionalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Social & Emotional Learning'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Develop Your Social & Emotional Skills',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Interactive modules to help improve communication, problem-solving, and self-regulation skills.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            
            // Skill Categories
            _buildSkillCategory(
              context,
              'Communication Skills',
              Icons.chat_bubble_outline,
              Colors.blue,
              [
                'Active Listening',
                'Clear Expression',
                'Non-verbal Communication',
                'Conflict Resolution',
              ],
            ),
            SizedBox(height: 20),
            _buildSkillCategory(
              context,
              'Problem-Solving Skills',
              Icons.lightbulb_outline,
              Colors.amber,
              [
                'Critical Thinking',
                'Decision Making',
                'Creative Solutions',
                'Analyzing Situations',
              ],
            ),
            SizedBox(height: 20),
            _buildSkillCategory(
              context,
              'Self-Regulation Skills',
              Icons.auto_fix_high,
              Colors.purple,
              [
                'Emotional Control',
                'Stress Management',
                'Focus Techniques',
                'Mindfulness Practices',
              ],
            ),
            SizedBox(height: 20),
            _buildSkillCategory(
              context,
              'Social Awareness',
              Icons.people_outline,
              Colors.green,
              [
                'Empathy Building',
                'Perspective Taking',
                'Social Cues',
                'Relationship Management',
              ],
            ),
            
            SizedBox(height: 30),
            Center(
              child: ElevatedButton.icon(
                icon: Icon(Icons.assessment),
                label: Text('Take Skills Assessment'),
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSkillCategory(
    BuildContext context,
    String title,
    IconData icon,
    Color color,
    List<String> skills,
  ) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: color.withOpacity(0.5)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ExpansionTile(
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.2),
          child: Icon(icon, color: color),
        ),
        title: Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var skill in skills)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0),
                    child: Row(
                      children: [
                        Icon(Icons.check_circle_outline, color: color, size: 20),
                        SizedBox(width: 8),
                        Text(
                          skill,
                          style: TextStyle(fontSize: 16),
                        ),
                        Spacer(),
                        IconButton(
                          icon: Icon(Icons.arrow_forward, size: 18),
                          onPressed: () {},
                          color: color,
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}