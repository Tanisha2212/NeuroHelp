import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class CommunitySupportPage extends StatelessWidget {
  const CommunitySupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Community Support')),
      body: Column(
        children: [
          // Title
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Job Listings in Mumbai',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          // Map Container
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: const Color.fromARGB(255, 72, 169, 249), width: 2),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: FlutterMap(
                  options: MapOptions(
                    center: LatLng(19.0760, 72.8777), // Mumbai
                    zoom: 11.0,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                      subdomains: const ['a', 'b', 'c'],
                    ),
                    MarkerLayer(
                      markers: _getMumbaiJobListings(context),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Marker> _getMumbaiJobListings(BuildContext parentContext) {
    // Define 50+ dummy job locations in and around Mumbai.
    List<LatLng> jobLocations = [
      LatLng(19.0760, 72.8777), // Mumbai Center
      LatLng(19.0910, 72.8640), // Andheri
      LatLng(19.0728, 72.8826), // Bandra
      LatLng(19.0176, 72.8562), // Dadar
      LatLng(18.9647, 72.8258), // Colaba
      LatLng(19.1869, 72.8484), // Malad
      LatLng(19.1551, 72.8497), // Goregaon
      LatLng(19.1200, 72.8493), // Jogeshwari
      LatLng(19.1076, 72.8373), // Vile Parle
      LatLng(19.0000, 72.8258), // Marine Drive
      LatLng(19.0167, 72.8300), // Lower Parel
      LatLng(19.0400, 72.8550), // Parel
      LatLng(19.1000, 72.8330), // Santacruz
      LatLng(19.1121, 72.8697), // Khar
      LatLng(19.2307, 72.8544), // Borivali
      LatLng(19.2403, 72.8589), // Dahisar
      LatLng(19.2800, 72.8800), // Mira Road
      LatLng(19.2132, 72.8400), // Kandivali
      LatLng(19.0300, 72.8800), // Sion
      LatLng(19.0500, 72.9200), // Chembur
      LatLng(19.0600, 72.8900), // Kurla
      LatLng(19.0800, 72.9000), // Ghatkopar
      LatLng(19.1100, 72.9100), // Vikhroli
      LatLng(19.1200, 72.9200), // Bhandup
      LatLng(19.1400, 72.9300), // Mulund
      LatLng(19.1800, 72.9500), // Thane
      LatLng(19.1600, 72.8600), // Powai
      LatLng(19.1700, 72.8400), // Hiranandani
      LatLng(19.1800, 72.8100), // Airoli
      LatLng(19.1200, 72.9700), // Nerul
      LatLng(19.1300, 72.9900), // Seawoods
      LatLng(19.1400, 73.0000), // Belapur
      LatLng(19.1800, 73.0200), // Panvel
      LatLng(19.0800, 72.9700), // Vashi
      LatLng(19.0900, 72.9800), // Sanpada
      LatLng(19.1000, 72.9900), // Kharghar
      LatLng(19.1100, 73.0000), // Kamothe
      LatLng(19.1200, 73.0100), // Taloja
      LatLng(19.1300, 73.0200), // Kalamboli
      LatLng(19.1400, 73.0300), // Khandeshwar
      LatLng(19.1500, 73.0400), // Ulwe
      LatLng(19.1600, 73.0500), // Jui Nagar
      LatLng(19.1700, 73.0600), // CBD Belapur
      LatLng(19.1800, 73.0700), // Turbhe
      LatLng(19.1900, 73.0800), // Rabale
      LatLng(19.2000, 73.0900), // Ghansoli
      // You can add more locations if needed.
    ];

    // Dummy data for random job details.
    final companies = [
      'Acme Corp',
      'Tech Solutions',
      'InnovateX',
      'Alpha Beta',
      'Global Soft',
      'FutureWorks',
      'NextGen Labs',
      'Prime Technologies',
      'Quantum Systems',
      'Creative Minds'
    ];
    final positions = [
      'Software Engineer',
      'Product Manager',
      'Data Analyst',
      'UI/UX Designer',
      'DevOps Engineer',
      'Quality Analyst',
      'Business Analyst',
      'Project Manager',
      'System Administrator',
      'Technical Lead'
    ];
    final salaries = [
      '₹8-12 LPA',
      '₹10-15 LPA',
      '₹6-9 LPA',
      '₹12-18 LPA',
      '₹7-11 LPA',
      '₹9-14 LPA'
    ];
    final experiences = [
      '2-5 years',
      '3-6 years',
      '1-3 years',
      '4-7 years',
      '2-4 years',
      '3-5 years'
    ];

    final random = Random();

    return List.generate(jobLocations.length, (index) {
      final location = jobLocations[index];
      // Randomly pick details from lists.
      final company = companies[random.nextInt(companies.length)];
      final position = positions[random.nextInt(positions.length)];
      final salary = salaries[random.nextInt(salaries.length)];
      final experience = experiences[random.nextInt(experiences.length)];

      return Marker(
        point: location,
        builder: (ctx) => GestureDetector(
          onTap: () {
            showDialog(
              context: parentContext,
              builder: (context) {
                return Dialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: const BorderSide(color: Colors.blue, width: 2),
                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 30), // Space for close button
                            Text(
                              "Job Details #${index + 1}",
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text("Company: $company"),
                            const SizedBox(height: 4),
                            Text("Position: $position"),
                            const SizedBox(height: 4),
                            const Text("Location: Mumbai"),
                            const SizedBox(height: 4),
                            Text("Salary: $salary"),
                            const SizedBox(height: 4),
                            Text("Experience: $experience"),
                          ],
                        ),
                      ),
                      // Close icon in top right corner.
                      Positioned(
                        right: 0,
                        child: IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
          child: const Icon(
            Icons.work,
            color: Colors.green,
            size: 25,
          ),
        ),
      );
    });
  }
}
