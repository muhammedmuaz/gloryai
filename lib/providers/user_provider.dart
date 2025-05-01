import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:gloryai/models/user_profile_model.dart';
import 'package:gloryai/providers/auth_provider.dart';

class UserProvider extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  
  // Current user profile
  final Rx<UserProfile?> _userProfile = Rx<UserProfile?>(null);
  UserProfile? get userProfile => _userProfile.value;

  // Loading state
  final RxBool _isProfileLoading = false.obs;
  bool get isProfileLoading => _isProfileLoading.value;

  // Create or update user profile with form data
  Future<void> createUserProfile(Map<String, dynamic> formData) async {
    try {
      print(formData);
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

      _userProfile.value = userProfile;
    } catch (e) {
      Get.snackbar('Error', 'Failed to create profile: ${e.toString()}');
      rethrow;
    } finally {
      _isProfileLoading.value = false;
    }
  }

  // Fetch current user profile
  Future<void> fetchUserProfile() async {
    try {
      _isProfileLoading.value = true;
      
      final user = Get.find<AuthenticationProvider>().user;
      if (user == null) return;

      final doc = await _firestore.collection('users').doc(user.uid).get();
      if (doc.exists) {
        _userProfile.value = UserProfile.fromMap(doc.data()!);
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch profile: ${e.toString()}');
    } finally {
      _isProfileLoading.value = false;
    }
  }

  // Clear user data
  void clearUserData() {
    _userProfile.value = null;
  }
}