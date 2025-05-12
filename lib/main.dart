import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:gloryai/firebase_options.dart';
import 'package:gloryai/routing/app_navigator.dart';
import 'package:gloryai/routing/app_route_generator.dart';
import 'package:gloryai/routing/app_route_names.dart';
import 'package:gloryai/screens/home_screen2.dart';
import 'package:gloryai/services/api_links.dart';
import 'package:gloryai/services/notification_service.dart';
import 'package:gloryai/theme/gloryai_theme.dart';
import 'package:gloryai/utils/image_preloader.dart';
import 'package:toastification/toastification.dart';


class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  ApiLinks.init(environment: currentEnvironment);
  HttpOverrides.global = MyHttpOverrides();
   // Preload images before running app
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
    .then((_) async {
      await ImagePreloader.preloadImages();
      await NotificationService.initialize();
      runApp(const GloryApp());
    });
  
}

class GloryApp extends StatefulWidget {
  const GloryApp({super.key});

  @override
  State<GloryApp> createState() => _GloryAppState();
}

class _GloryAppState extends State<GloryApp> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      child: GetMaterialApp(
        title: 'Glory.ai',
        debugShowCheckedModeBanner: false,
        theme: GloyAiTheme.lightTheme,
         initialRoute: AppRoutesNames.initial,
          navigatorKey: AppNavigation.navigatorKey,
          onGenerateRoute: RouteGenerator.generateRoute,
        // home: HomeScreen2(),
      ),
    );
  }
}
  






// // Database Model
// class Conversation {
//   final int? id;
//   final String userInput;
//   final String aiResponse;
//   final DateTime createdAt;

//   Conversation({
//     this.id,
//     required this.userInput,
//     required this.aiResponse,
//     required this.createdAt,
//   });

//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'userInput': userInput,
//       'aiResponse': aiResponse,
//       'createdAt': createdAt.toIso8601String(),
//     };
//   }

//   factory Conversation.fromMap(Map<String, dynamic> map) {
//     return Conversation(
//       id: map['id'],
//       userInput: map['userInput'],
//       aiResponse: map['aiResponse'],
//       createdAt: DateTime.parse(map['createdAt']),
//     );
//   }
// }

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
//   final TextEditingController _inputController = TextEditingController();
//   String _response = "How are you feeling today?";
//   bool _loading = false;
//   List<String> _suggestions = [
//     "I'm feeling anxious about...",
//     "I'm struggling with...",
//     "I need guidance about...",
//     "I'm grateful for...",
//   ];
//   List<Conversation> _conversations = [];
//   late AnimationController _animationController;
//   late Database _database;
//   bool _showHistory = false;

//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 500),
//     );
//     _initDatabase();
//   }

//   Future<void> _initDatabase() async {
//     final databasePath = await getDatabasesPath();
//     final path = join(databasePath, 'glory_ai.db');

//     _database = await openDatabase(
//       path,
//       version: 1,
//       onCreate: (db, version) async {
//         await db.execute('''
//           CREATE TABLE conversations(
//             id INTEGER PRIMARY KEY AUTOINCREMENT,
//             userInput TEXT,
//             aiResponse TEXT,
//             createdAt TEXT
//           )
//         ''');
//       },
//     );

//     _loadConversations();
//   }

//   Future<void> _loadConversations() async {
//     final List<Map<String, dynamic>> maps = await _database.query(
//       'conversations',
//       orderBy: 'createdAt DESC',
//     );
//     setState(() {
//       _conversations = List.generate(maps.length, (i) {
//         return Conversation.fromMap(maps[i]);
//       });
//     });
//   }

//   Future<void> _saveConversation(String userInput, String aiResponse) async {
//     await _database.insert(
//       'conversations',
//       Conversation(
//         userInput: userInput,
//         aiResponse: aiResponse,
//         createdAt: DateTime.now(),
//       ).toMap(),
//     );
//     await _loadConversations();
//   }

//   TextSpan _formatResponse(String text) {
//     final List<TextSpan> spans = [];
//     final lines = text.split('\n');

//     for (var line in lines) {
//       if (line.startsWith('**Verse**:')) {
//         final parts = line.split(':');
//         spans.add(
//           TextSpan(
//             text: '${parts[0]}:',
//             style: const TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 16,
//               color: Colors.deepPurple,
//             ),
//           ),
//         );
//         spans.add(
//           TextSpan(
//             text: parts[1],
//             style: const TextStyle(
//               fontSize: 16,
//               color: Colors.black87,
//               fontStyle: FontStyle.italic,
//             ),
//           ),
//         );
//       } else if (line.startsWith('**') && line.contains('**')) {
//         final boldText = line.substring(2, line.indexOf('**', 2));
//         final remainingText = line.substring(line.indexOf('**', 2) + 2);
//         spans.add(
//           TextSpan(
//             text: boldText,
//             style: const TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 16,
//               color: Colors.deepPurple,
//             ),
//           ),
//         );
//         spans.add(
//           TextSpan(
//             text: remainingText,
//             style: const TextStyle(
//               fontSize: 16,
//               color: Colors.black87,
//             ),
//           ),
//         );
//       } else if (line.startsWith('▶')) {
//         spans.add(
//           TextSpan(
//             text: line,
//             style: const TextStyle(
//               fontSize: 16,
//               color: Colors.green,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//         );
//       } else {
//         spans.add(
//           TextSpan(
//             text: line,
//             style: const TextStyle(
//               fontSize: 16,
//               color: Colors.black87,
//             ),
//           ),
//         );
//       }
//       spans.add(const TextSpan(text: '\n'));
//     }

//     return TextSpan(children: spans);
//   }

//   Future<void> _fetchVerse() async {
//     if (_inputController.text.isEmpty) return;
//     setState(() => _loading = true);

//     const apiKey = 'AIzaSyDG06EjCBBQSLpS-3dwVkrL43ZtbuAJq3s';
//     final model = GenerativeModel(model: 'gemini-2.0-flash', apiKey: apiKey);

//     try {
//       final emotionPrompt = """
//       Analyze this text for primary emotion: "${_inputController.text}"
//       Respond with ONLY ONE word from this list:
//       [joy, sadness, anger, fear, love, guilt, shame, peace, anxiety, hope]
//       """;

//       final emotionResponse = await model.generateContent([
//         Content.text(emotionPrompt),
//       ]);
//       final emotion = emotionResponse.text?.toLowerCase().trim() ?? 'neutral';

//       final versePrompt = """
//       You are a compassionate Bible assistant. The user feels $emotion about: "${_inputController.text}".
      
//       Respond in THIS EXACT FORMAT:
      
//       **Verse**: *"Exact verse quote" - Book 1:1*
      
//       **Meaning**: One sentence connecting the verse to their $emotion.
      
//       **Action**: ▶ One practical step (start with this arrow)
      
//       **Follow-up**: Suggest 1 question to deepen reflection, starting with "Maybe ask yourself: "
//       """;

//       final verseResponse = await model.generateContent([
//         Content.text(versePrompt),
//       ]);

//       final suggestionsPrompt = """
//       Based on this conversation:
//       User: "${_inputController.text}"
//       Your Response: "${verseResponse.text}"
      
//       Suggest 3 short prompts the user might say next as bullet points.
//       Format exactly like:
//       - Suggestion 1
//       - Suggestion 2
//       - Suggestion 3
//       """;

//       final suggestionsResponse = await model.generateContent([
//         Content.text(suggestionsPrompt),
//       ]);
//       final newSuggestions = suggestionsResponse.text?.split('\n') ?? _suggestions;

//       setState(() {
//         _response = verseResponse.text ?? "Let's explore this together...";
//         _suggestions = newSuggestions
//             .where((s) => s.startsWith('- '))
//             .map((s) => s.substring(2))
//             .toList();
//       });

//       await _saveConversation(_inputController.text, _response);
//       _inputController.clear();
//     } catch (e) {
//       setState(() => _response = "Let's try again: ${e.toString()}");
//     } finally {
//       setState(() => _loading = false);
//     }
//   }

//   void _toggleHistory() {
//     setState(() {
//       _showHistory = !_showHistory;
//       if (_showHistory) {
//         _animationController.forward();
//       } else {
//         _animationController.reverse();
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Glory.ai',
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 24,
//           ),
//         ),
//         centerTitle: true,
//         actions: [
//           IconButton(
//             icon: Icon(_showHistory ? Icons.chat : Icons.history),
//             onPressed: _toggleHistory,
//           ),
//         ],
//       ),
//       body: Stack(
//         children: [
//           // Main Content
//           AnimatedSwitcher(
//             duration: const Duration(milliseconds: 300),
//             child: _showHistory ? _buildHistoryView() : _buildMainView(),
//           ),

//           // Loading Indicator
//           if (_loading)
//             Container(
//               color: Colors.black54,
//               child: Center(
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Lottie.asset(
//                       AppImages.loadingLottie, // Add your loading animation
//                       width: 150,
//                       height: 150,
//                     ),
//                     const SizedBox(height: 16),
//                     const Text(
//                       'Finding the perfect verse...',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 16,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//         ],
//       ),
//     );
//   }

//   Widget _buildMainView() {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         children: [
//           // Animated Header
//           Lottie.asset(
//             AppImages.bibleLottie, // Add your animation
//             width: 200,
//             height: 200,
//           ),

//           // Response Card
//           Expanded(
//             child: AnimationLimiter(
//               child: AnimatedSwitcher(
//                 duration: const Duration(milliseconds: 300),
//                 child: Container(
//                   key: ValueKey(_response),
//                   padding: const EdgeInsets.all(16),
//                   decoration: BoxDecoration(
//                     color: Colors.grey[100],
//                     borderRadius: BorderRadius.circular(16),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.2),
//                         blurRadius: 10,
//                         spreadRadius: 2,
//                       ),
//                     ],
//                   ),
//                   child: SingleChildScrollView(
//                     child: RichText(
//                       text: _formatResponse(_response),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),

//           // Suggestions
//           if (!_loading) ...[
//             const SizedBox(height: 10),
//             AnimationLimiter(
//               child: Wrap(
//                 spacing: 8,
//                 runSpacing: 8,
//                 children: AnimationConfiguration.toStaggeredList(
//                   duration: const Duration(milliseconds: 375),
//                   childAnimationBuilder: (widget) => SlideAnimation(
//                     horizontalOffset: 50.0,
//                     child: FadeInAnimation(
//                       child: widget,
//                     ),
//                   ),
//                   children: _suggestions
//                       .map(
//                         (suggestion) => ActionChip(
//                           label: Text(suggestion),
//                           backgroundColor: Colors.deepPurple.withOpacity(0.1),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                           onPressed: () {
//                             _inputController.text = suggestion;
//                             _fetchVerse();
//                           },
//                         ),
//                       )
//                       .toList(),
//                 ),
//               ),
//             ),
//           ],

//           // Input Area
//           Padding(
//             padding: const EdgeInsets.only(top: 16, bottom: 16),
//             child: Material(
//               elevation: 4,
//               borderRadius: BorderRadius.circular(24),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: TextField(
//                       controller: _inputController,
//                       decoration: InputDecoration(
//                         hintText: "Share what's on your heart...",
//                         border: InputBorder.none,
//                         contentPadding: const EdgeInsets.symmetric(
//                           horizontal: 16,
//                           vertical: 16,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(right: 8),
//                     child: IconButton(
//                       icon: const Icon(Icons.send, color: Colors.deepPurple),
//                       onPressed: _loading ? null : _fetchVerse,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildHistoryView() {
//     return AnimationLimiter(
//       child: ListView.builder(
//         padding: const EdgeInsets.all(16),
//         itemCount: _conversations.length,
//         itemBuilder: (context, index) {
//           return AnimationConfiguration.staggeredList(
//             position: index,
//             duration: const Duration(milliseconds: 375),
//             child: SlideAnimation(
//               verticalOffset: 50.0,
//               child: FadeInAnimation(
//                 child: Card(
//                   margin: const EdgeInsets.only(bottom: 16),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(16),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           _conversations[index].userInput,
//                           style: const TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: Colors.deepPurple,
//                           ),
//                         ),
//                         const SizedBox(height: 8),
//                         RichText(
//                           text: _formatResponse(_conversations[index].aiResponse),
//                         ),
//                         const SizedBox(height: 8),
//                         Text(
//                           _formatDate(_conversations[index].createdAt),
//                           style: TextStyle(
//                             color: Colors.grey[600],
//                             fontSize: 12,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   String _formatDate(DateTime date) {
//     return '${date.day}/${date.month}/${date.year} ${date.hour}:${date.minute.toString().padLeft(2, '0')}';
//   }

//   @override
//   void dispose() {
//     _animationController.dispose();
//     _inputController.dispose();
//     _database.close();
//     super.dispose();
//   }
// }
