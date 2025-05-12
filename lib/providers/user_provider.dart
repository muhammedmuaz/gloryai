import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:gloryai/models/user_profile_model.dart';
import 'package:gloryai/providers/auth_provider.dart';
import 'package:gloryai/utils/helper_functions.dart';
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

  // Clear user data
  void clearUserData() {
    _userProfile = null;
  }
}
