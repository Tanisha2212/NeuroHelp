import 'package:flutter/material.dart';

class PersonalizedLearningPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personalized Learning'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'AI-Powered Personalized Learning',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 20),
            Text(
              'Your learning journey is unique to you.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            LearningModuleCard(
              title: 'Cognitive Assessment',
              description: 'Discover your learning strengths',
              icon: Icons.analytics,
              color: Colors.blue,
              progress: 0.7,
            ),
            SizedBox(height: 16),
            LearningModuleCard(
              title: 'Tailored Curriculum',
              description: 'Content adapted to your needs',
              icon: Icons.auto_awesome,
              color: Colors.green,
              progress: 0.4,
            ),
            SizedBox(height: 16),
            LearningModuleCard(
              title: 'Progress Tracking',
              description: 'Monitor your learning journey',
              icon: Icons.trending_up,
              color: Colors.orange,
              progress: 0.2,
            ),
            SizedBox(height: 30),
            Text(
              'Current Courses',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            CourseCard(
              title: 'Mathematics Foundations',
              description: 'Visual approach to core concepts',
              progress: 0.65,
            ),
            SizedBox(height: 16),
            CourseCard(
              title: 'Reading Comprehension',
              description: 'Strategies for better understanding',
              progress: 0.4,
            ),
            SizedBox(height: 30),
            Center(
              child: ElevatedButton.icon(
                icon: Icon(Icons.add),
                label: Text('Add New Course'),
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
}

class LearningModuleCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final Color color;
  final double progress;

  const LearningModuleCard({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: color, size: 28),
                SizedBox(width: 12),
                Text(
                  title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(description),
            SizedBox(height: 12),
            LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey.shade200,
              valueColor: AlwaysStoppedAnimation<Color>(color),
              minHeight: 8,
              borderRadius: BorderRadius.circular(4),
            ),
            SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: Text('${(progress * 100).toInt()}%'),
            ),
          ],
        ),
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  final String title;
  final String description;
  final double progress;

  const CourseCard({
    required this.title,
    required this.description,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(description),
            SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  flex: 7,
                  child: LinearProgressIndicator(
                    value: progress,
                    backgroundColor: Colors.grey.shade200,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.teal),
                    minHeight: 8,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                SizedBox(width: 12),
                Text(
                  '${(progress * 100).toInt()}%',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text('Resume'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}