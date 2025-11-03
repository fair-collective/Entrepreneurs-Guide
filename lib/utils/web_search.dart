import 'package:google_generative_ai/google_generative_ai.dart';

class WebSearch {
  static final model = GenerativeModel(
    model: 'gemini-1.5-flash',
    apiKey: 'YOUR_GEMINI_KEY', // Free tier: 15 RPM
  );

  static Future<List<String>> generateRoadmap(String business) async {
    final prompt = '''
    Generate a 4-week, no-money startup roadmap for "$business" in 2025.
    Use real successful examples from the web.
    Free tools only. Ethical. Step-by-step.
    Include one ETHICS CHECK per week.
    Format: Week 1: Step 1 | Week 1: Step 2 | ...
    ''';

    try {
      final response = await model.generateContent([Content.text(prompt)]);
      return response.text!.split('|').map((s) => s.trim()).toList();
    } catch (e) {
      return ['Error: Check internet', 'Try again later'];
    }
  }
}
