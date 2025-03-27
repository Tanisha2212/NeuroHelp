import 'package:flutter/material.dart';
import 'community_support.dart';
import 'job_listing.dart';

class EmploymentHomePage extends StatelessWidget {
  const EmploymentHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Get Employed',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  EducationFeatureCard(
                    title: 'Community Support',
                    description: 'Connect with others and get help',
                    icon: Icons.psychology,
                    color: Colors.blue,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CommunitySupportPage()),
                      );
                    },
                  ),
                  SizedBox(height: 16),
                  EducationFeatureCard(
                    title: 'Job Listings',
                    description: 'Find your dream job',
                    icon: Icons.diversity_3,
                    color: Colors.green,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => JobListingsPage()),
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