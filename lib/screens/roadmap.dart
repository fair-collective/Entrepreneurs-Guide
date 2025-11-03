import 'package:flutter/material.dart';
import '../utils/ethics_check.dart';

class RoadmapScreen extends StatelessWidget {
  final List<String> roadmap;
  const RoadmapScreen({super.key, required this.roadmap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Roadmap')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: roadmap.length,
        itemBuilder: (context, i) {
          final step = roadmap[i];
          final isEthics = step.contains('ETHICS');
          return Card(
            color: isEthics ? Colors.purple[900] : Colors.grey[900],
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: isEthics ? Colors.purple : Colors.cyan,
                child: Text('${i + 1}'),
              ),
              title: Text(step, style: const TextStyle(color: Colors.white)),
              trailing: isEthics ? const Icon(Icons.shield, color: Colors.green) : null,
            ),
          );
        },
      ),
    );
  }
}
