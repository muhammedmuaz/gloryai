import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:gloryai/models/user_profile_model.dart';
import 'package:gloryai/providers/auth_provider.dart';
import 'package:gloryai/services/gemini_service.dart';
import 'package:gloryai/utils/helper_functions.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:toastification/toastification.dart';

class UserProvider extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Current user profile
  UserProfile? _userProfile;
  UserProfile? get userProfile => _userProfile;

  // Loading state
  final RxBool _isProfileLoading = false.obs;
  bool get isProfileLoading => _isProfileLoading.value;

  bool _isProfileFetching = true;
  bool get isProfileFetching => _isProfileFetching;

  bool _isUpdateingChristanTradition = false;
  bool get isUpdateingChristanTradition => _isUpdateingChristanTradition;

  bool _isUpdateingGender = false;
  bool get isUpdateingGender => _isUpdateingGender;

  bool _isUpdatingBibleVersion = false;
  bool get isUpdatingBibleVersion => _isUpdatingBibleVersion;

  // Add these new variables to your UserProvider class
  bool _isFetchingDailyVerse = false;
  bool get isFetchingDailyVerse => _isFetchingDailyVerse;

  String? _dailyVerse;
  String? get dailyVerse => _dailyVerse;
  String? _verseFrom;
  String? get verseFrom => _verseFrom;

  DateTime? _lastVerseFetchDate;
  DateTime? get lastVerseFetchDate => _lastVerseFetchDate;

  final GeminiService _geminiService = GeminiService(
  apiKey: 'AIzaSyDG06EjCBBQSLpS-3dwVkrL43ZtbuAJq3s', // Replace with your actual API key
);

  // Create or update user profile with form data
  Future<void> createUserProfile(Map<String, dynamic> formData) async {
    try {
      _isProfileLoading.value = true;

      final user = Get.find<AuthenticationProvider>().user;
      if (user == null) throw Exception('No authenticated user');

      final userProfile = UserProfile(
        uid: user.uid,
        email: user.email,
        name: user.displayName,
        photoUrl: user.photoURL,
        foundGlory: formData['foundGlory'],
        ageCategory: formData['ageCategory'],
        gender: formData['gender'],
        christianTradition: formData['christianTradition'],
        practiceDuration: formData['practiceDuration'],
        prayerFrequency: formData['prayerFrequency'],
        supportNeeded: formData['supportNeeded'],
        createdAt: DateTime.now(),
      );

      await _firestore
          .collection('users')
          .doc(user.uid)
          .set(userProfile.toMap());

      _userProfile = userProfile;
      update();
    } catch (e) {
      Get.snackbar('Error', 'Failed to create profile: ${e.toString()}');
      rethrow;
    } finally {
      _isProfileLoading.value = false;
    }
  }

  // Update Christian tradition only
  Future<void> updateChristianTradition(String newTradition) async {
    try {
      _isUpdateingChristanTradition = true;
      update();
      final user = Get.find<AuthenticationProvider>().user;
      if (user == null) throw Exception('No authenticated user');

      await _firestore.collection('users').doc(user.uid).update({
        'christianTradition': newTradition,
        'updatedAt': DateTime.now(),
      });

      // Update local profile if it exists
      if (_userProfile != null) {
        _userProfile?.christianTradition = newTradition;
        update();
        HelperFunctions.displayToastMessage(
          "Tradition updated",
          ToastificationType.success,
          notificationStyle: ToastificationStyle.flat,
        );
      }

      update();
    } catch (e) {
      Get.snackbar('Error', 'Failed to update tradition: ${e.toString()}');
      rethrow;
    } finally {
      _isUpdateingChristanTradition = false;
      update();
    }
  }

  // Update gender only
  Future<void> updateGender(String newGender) async {
    try {
      _isUpdateingGender = true;
      update();

      final user = Get.find<AuthenticationProvider>().user;
      if (user == null) throw Exception('No authenticated user');

      await _firestore.collection('users').doc(user.uid).update({
        'gender': newGender,
        'updatedAt': DateTime.now(),
      });

      // Update local profile
      if (_userProfile != null) {
        _userProfile!.gender = newGender;
        update();

        // = _userProfile!.copyWith(gender: newGender);
        HelperFunctions.displayToastMessage(
          "Gender updated successfully",
          ToastificationType.success,
          notificationStyle: ToastificationStyle.flat,
        );
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to update gender: ${e.toString()}');
      rethrow;
    } finally {
      _isUpdateingGender = false;
      update();
    }
  }

  Future<void> updateBibleVersion(String newVersion) async {
    try {
      _isUpdatingBibleVersion = true;
      update();

      final user = Get.find<AuthenticationProvider>().user;
      if (user == null) throw Exception('No authenticated user');

      await _firestore.collection('users').doc(user.uid).update({
        'bibleVersion': newVersion,
        'updatedAt': DateTime.now(),
      });

      // Update local profile
      if (_userProfile != null) {
        _userProfile = _userProfile!.copyWith(bibleVersion: newVersion);
        HelperFunctions.displayToastMessage(
          "Bible version updated to $newVersion",
          ToastificationType.success,
          notificationStyle: ToastificationStyle.flat,
        );
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to update Bible version: ${e.toString()}');
      rethrow;
    } finally {
      _isUpdatingBibleVersion = false;
      update();
    }
  }

  // Fetch current user profile
  Future<void> fetchUserProfile() async {
    try {
      // _isProfileFetching = true;
      // update();
      final user = Get.find<AuthenticationProvider>().user;
      if (user == null) return;

      final doc = await _firestore.collection('users').doc(user.uid).get();
      if (doc.exists) {
        _userProfile = UserProfile.fromMap(doc.data()!);
        update();
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch profile: ${e.toString()}');
    } finally {
      _isProfileFetching = false;
      update();
    }
  }


  Future<void> fetchDailyVerse() async {
  try {
    _isFetchingDailyVerse = true;
    update();

    // Check if we already have today's verse
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    
    if (_lastVerseFetchDate != null && _lastVerseFetchDate!.isAtSameMomentAs(today)) {
    
    
      return; // Already fetched today's verse


    }

    // Check Firestore for today's verse
    final verseDoc = await _firestore
        .collection('daily_verses')
        .doc(today.toIso8601String().split('T').first)
        .get();

    // if (verseDoc.exists) {


    //   _dailyVerse = verseDoc.data()?['verse'];
    //   _lastVerseFetchDate = today;
    //   update();
    //   return;
    // }

    // If no verse exists for today, generate a new one
    const apiKey = 'AIzaSyDG06EjCBBQSLpS-3dwVkrL43ZtbuAJq3s'; // Replace with your actual API key
    final model = GenerativeModel(model: 'gemini-pro', apiKey: apiKey);
    
    final prompt = """
    Generate an inspirational Bible verse with interpretation based on the user's profile.
    User details: 
    - Christian Tradition: ${_userProfile?.christianTradition ?? 'Not specified'}
    - Prayer Frequency: ${_userProfile?.prayerFrequency ?? 'Not specified'}
    - Support Needed: ${_userProfile?.supportNeeded ?? 'Not specified'}
    - Age Category: ${_userProfile?.ageCategory ?? 'Not specified'}
    - Bible Version: ${_userProfile?.bibleVersion ?? 'Not specified'}
    - Practice Duration: ${_userProfile?.practiceDuration ?? 'Not specified'}
    
    Respond in this exact format:
    
    "Exact verse quote"|-Book 1:1*
    
    **Meaning**: Brief explanation (1-2 sentences)
    
    **Application**: Practical way to apply this today (start with "▶ ")
    """;

    final response = await model.generateContent([Content.text(prompt)]);
    final verse = response.text ?? "'The Lord is my shepherd, I lack nothing.'|-Psalm 23:1*";
    print("respooonsssee:  $verse");
    // Save the new verse to Firestore for today
    await _firestore
        .collection('daily_verses')
        .doc(today.toIso8601String().split('T').first)
        .set({
          'verse': verse,
          'createdAt': FieldValue.serverTimestamp(),
          'from': verse.split('|-').last,
          'forDate': today,
        });

    _dailyVerse = verse.split('|-').first;
    _verseFrom = verse.split('|-').last;
    _lastVerseFetchDate = today;
    
  } catch (e) {
    // Get.snackbar('Error', 'Failed to fetch daily verse: ${e.toString()}');
    // Fallback verse
    _dailyVerse = "**Verse**: *'The Lord is my shepherd, I lack nothing.' - Psalm 23:1*";
  } finally {
    _isFetchingDailyVerse = false;
    update();
  }
}
  // Clear user data
  void clearUserData() {
    _userProfile = null;
  }
}
