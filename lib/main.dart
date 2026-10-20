import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class LabAssistant {
  final String name;
  final int studentId;
  final double performanceScore;
  final bool isActive;

  const LabAssistant({
    required this.name,
    required this.studentId,
    required this.performanceScore,
    required this.isActive,
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Colors.grey.shade100,
      ),
      home: const LayarUtama(),
    );
  }
}

class LayarUtama extends StatelessWidget {
  const LayarUtama({super.key});

  @override
  Widget build(BuildContext context) {
    const myProfile = LabAssistant(
      name: "Muhammad Hanif Nuruddin Jabbar",
      studentId: 202432042,
      performanceScore: 4.0,
      isActive: true,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Portal SEIC Lab'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: ProfileCard(assistant: myProfile),
        ),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  final LabAssistant assistant;

  const ProfileCard({super.key, required this.assistant});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.teal.shade50,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.teal.shade300, width: 1.5),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.badge, size: 60, color: Colors.teal),
            const SizedBox(height: 16),
            Text(
              assistant.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'NIM: ${assistant.studentId}',
              style: const TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildInfoItem(
                    Icons.star, 
                    'Rating', 
                    assistant.performanceScore.toString()
                ),
                _buildInfoItem(
                    Icons.work_history, 
                    'Status', 
                    assistant.isActive ? "Aktif" : "Cuti"
                ),
              ],
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                debugPrint("ABSENSI DICATAT UNTUK: ${assistant.studentId}");
              },
              child: const Text(
                "Catat Kehadiran Asisten",
                style: TextStyle(fontSize: 16),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildInfoItem(IconData icon, String label, String value) {
    return Column(
      children: [
        Icon(icon, color: Colors.teal.shade700, size: 26),
        const SizedBox(height: 6),
        Text(
          label, 
          style: const TextStyle(fontSize: 12, color: Colors.black54)
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.teal,
          ),
        ),
      ],
    );
  }
}