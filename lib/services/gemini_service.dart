import 'package:gloryai/models/user_profile_model.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiService {
  final String apiKey;

  GeminiService({required this.apiKey});

  Future<String> generateVerse(UserProfile? userProfile) async {
    try {
      final model = GenerativeModel(model: 'gemini-2.0-flash', apiKey: apiKey);
      
      final prompt = """
      Generate an inspirational Bible verse with interpretation based on the user's profile.
      User details: 
      - Christian Tradition: ${userProfile?.christianTradition ?? 'Not specified'}
      - Prayer Frequency: ${userProfile?.prayerFrequency ?? 'Not specified'}
      - Support Needed: ${userProfile?.supportNeeded ?? 'Not specified'}
      
      Respond in this exact format:
      
      **Verse**: *"Exact verse quote" - Book 1:1*
      
      **Meaning**: Brief explanation (1-2 sentences)
      
      **Application**: Practical way to apply this today (start with "▶ ")
      """;

      final response = await model.generateContent([Content.text(prompt)]);
      print("response.text)");
      print(response.text);
      return response.text ?? "**Verse**: *'The Lord is my shepherd, I lack nothing.' - Psalm 23:1*";
    } catch (e) {
      throw Exception('Failed to generate verse: $e');
    }
  }
}