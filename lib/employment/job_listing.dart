import 'package:flutter/material.dart';

class JobListingsPage extends StatelessWidget {
  const JobListingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> jobListings = [
      {
        'title': 'Software Developer',
        'company': 'Inclusive Tech Solutions',
        'location': 'Remote',
        'description': 'Looking for a developer with strong problem-solving skills. Experience with Flutter is a plus.'
      },
      {
        'title': 'Data Analyst',
        'company': 'NeuroData Corp',
        'location': 'New York, NY',
        'description': 'Seeking an analytical mind to interpret data trends and create reports. Neurodiverse-friendly workplace.'
      },
      {
        'title': 'Graphic Designer',
        'company': 'Creative Minds Studio',
        'location': 'San Francisco, CA',
        'description': 'Opportunity for a designer who excels in visual storytelling. Flexible work environment available.'
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Job Listings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: jobListings.length,
          itemBuilder: (context, index) {
            final job = jobListings[index];
            return JobCard(
              title: job['title']!,
              company: job['company']!,
              location: job['location']!,
              description: job['description']!,
            );
          },
        ),
      ),
    );
  }
}

class JobCard extends StatelessWidget {
  final String title;
  final String company;
  final String location;
  final String description;

  const JobCard({
    required this.title,
    required this.company,
    required this.location,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            Text(company, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            const SizedBox(height: 5),
            Text(location, style: TextStyle(fontSize: 14, color: Colors.grey.shade600)),
            const SizedBox(height: 10),
            Text(description, style: const TextStyle(fontSize: 14)),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Application process coming soon!')),
                  );
                },
                child: const Text('Apply Now'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
