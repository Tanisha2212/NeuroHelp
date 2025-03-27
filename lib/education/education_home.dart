import 'package:flutter/material.dart';
import 'personalized_learning.dart';
import 'multi_sensory_learning.dart';
import 'assistive_tech.dart';
import 'social_emotional.dart';

class EducationHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Education Support'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Personalized Education',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  EducationFeatureCard(
                    title: 'AI-Powered Personalized Learning',
                    description: 'Tailored content based on cognitive strengths and challenges',
                    icon: Icons.psychology,
                    color: Colors.blue,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PersonalizedLearningPage()),
                      );
                    },
                  ),
                  SizedBox(height: 16),
                  EducationFeatureCard(
                    title: 'Multi-Sensory Learning',
                    description: 'Visual, auditory, and interactive elements',
                    icon: Icons.diversity_3,
                    color: Colors.green,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MultiSensoryLearningPage()),
                      );
                    },
                  ),
                  SizedBox(height: 16),
                  EducationFeatureCard(
                    title: 'Assistive Technologies',
                    description: 'Text-to-speech, speech-to-text, and customizable UI',
                    icon: Icons.accessibility_new,
                    color: Colors.orange,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AssistiveTechPage()),
                      );
                    },
                  ),
                  SizedBox(height: 16),
                  EducationFeatureCard(
                    title: 'Social & Emotional Learning',
                    description: 'Improve communication and self-regulation skills',
                    icon: Icons.sentiment_satisfied_alt,
                    color: Colors.purple,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SocialEmotionalPage()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EducationFeatureCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const EducationFeatureCard({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: color.withOpacity(0.5), width: 2),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: color.withOpacity(0.2),
                    radius: 25,
                    child: Icon(icon, color: color, size: 30),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              Text(
                description,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Align(
                alignment: Alignment.centerRight,
                child: Icon(Icons.arrow_forward, color: color),
              ),
            ],
          ),
        ),
      ),
    );
  }
}