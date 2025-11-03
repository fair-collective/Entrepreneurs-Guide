import 'package:flutter/material.dart';
import '../utils/web_search.dart';
import 'roadmap.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? selectedBusiness;
  final List<String> businesses = [
    'Freelance Writing', 'YouTube Channel', 'Dropshipping', 'Graphic Design',
    'Virtual Assistant', 'Affiliate Blog', 'Podcast', 'TikTok Creator',
    'Print-on-Demand', 'Online Tutoring'
  ];

  void generateRoadmap() async {
    if (selectedBusiness == null) return;
    final roadmap = await WebSearch.generateRoadmap(selectedBusiness!);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => RoadmapScreen(roadmap: roadmap)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bootstrap Blueprint')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text('Pick Your No-Money Business:', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: selectedBusiness,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white10,
              ),
              dropdownColor: Colors.grey[900],
              style: const TextStyle(color: Colors.white),
              items: businesses.map((b) => DropdownMenuItem(value: b, child: Text(b))).toList(),
              onChanged: (v) => setState(() => selectedBusiness = v),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: selectedBusiness == null ? null : generateRoadmap,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.cyan,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
              ),
              child: const Text('GENERATE MY ROADMAP', style: TextStyle(fontSize: 16)),
            ),
            const SizedBox(height: 40),
            const Text('100% Free • No Ads • No Sign-Up', style: TextStyle(color: Colors.cyan)),
          ],
        ),
      ),
    );
  }
}
