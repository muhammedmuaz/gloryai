import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:gloryai/const/data_const.dart';
import 'package:gloryai/providers/user_provider.dart';
import 'package:gloryai/routing/app_navigator.dart';
import 'package:gloryai/routing/app_route_names.dart';
import 'package:gloryai/utils/gloryai_storage.dart';
import 'package:gloryai/utils/helper_functions.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:toastification/toastification.dart';

class AuthenticationProvider extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FacebookAuth _facebookAuth = FacebookAuth.instance;
  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Reactive user state
  final Rx<User?> _firebaseUser = Rx<User?>(null);
  User? get user => _firebaseUser.value;

  // Form data
  final RxMap<String, dynamic> _formData = <String, dynamic>{}.obs;
  Map<String, dynamic> get formData => _formData;

  // Loading states
  final RxBool _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  final RxBool _isSigningIn = false.obs;
  bool get isSigningIn => _isSigningIn.value;

  @override
  void onInit() {
    _firebaseUser.bindStream(_auth.authStateChanges());
    super.onInit();
  }

  // Save form answers
  void saveFormAnswer(String key, dynamic value) {
    _formData[key] = value;
    print("print(element);");
    for (var element in _formData.values) {
      print(element);
    }
  }

  Future<bool> checkUserExists(String userId) async {
    if (userId.isEmpty) return false;

    try {
      final doc =
          await FirebaseFirestore.instance
              .collection('users')
              .doc(userId)
              .get();
      return doc.exists;
    } catch (e) {
      return false;
    }
  }

  Future<void> _handleSuccessfulAuth(UserCredential userCredential) async {
    final userExists = await checkUserExists(userCredential.user?.uid ?? '');

    if (!userExists && isClickedInLogin) {
      AppNavigation.goBack();
      Get.snackbar(
        'Welcome!',
        'Please complete your signup as this is your first time',
        snackPosition: SnackPosition.TOP,
      );
      // You might want to navigate to a signup screen here
      // AppNavigation.navigateTo(AppRoutesNames.signUpScreen);
      return;
    } else if (!userExists && !isClickedInLogin) {
      // If user exists, proceed with creating profile or navigation
      await Get.find<UserProvider>().createUserProfile(_formData);
    }
    await GloryAiStorage.setValue(DataConstants.storageUserId, '1');
    if (isClickedInLogin == true) {
      AppNavigation.removeAllRoutes(AppRoutesNames.homeScreen2);
    } else {
      AppNavigation.navigateTo(AppRoutesNames.introEmbarkSacredScreen);
    }
    _formData.clear();
  }

  Future<void> signInWithGoogle() async {
    try {
      _isSigningIn.value = true;

      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential = await _auth.signInWithCredential(
        credential,
      );

      await _handleSuccessfulAuth(userCredential);
    } catch (e) {
      HelperFunctions.displayToastMessage(
        "Failed to sign in with Google",
        ToastificationType.error,
        notificationStyle: ToastificationStyle.flat,
      );
      rethrow;
    } finally {
      _isSigningIn.value = false;
    }
  }

  // Sign in with Apple
  Future<void> signInWithApple() async {
    try {
      _isSigningIn.value = true;

      // Perform the sign-in request
      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      // Create an OAuth credential from the Apple credential
      final oauthCredential = OAuthProvider("apple.com").credential(
        idToken: appleCredential.identityToken,
        accessToken: appleCredential.authorizationCode,
      );

      // Sign in to Firebase with the Apple credential
      UserCredential userCredential = await _auth.signInWithCredential(
        oauthCredential,
      );

      await _handleSuccessfulAuth(userCredential);
    } catch (e) {
      Get.snackbar('Error', 'Failed to sign in with Apple: ${e.toString()}');
      rethrow;
    } finally {
      _isSigningIn.value = false;
    }
  }

  // Sign in with Facebook
  Future<void> signInWithFacebook() async {
    try {
      _isSigningIn.value = true;

      // Trigger the Facebook login flow
      final LoginResult loginResult = await _facebookAuth.login(
        permissions: ['email', 'public_profile'],
      );

      if (loginResult.accessToken == null) {
        throw Exception('Facebook login was cancelled');
      }

      // Create a credential from the access token
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential("");

      // Sign in to Firebase with the Facebook credential
      UserCredential userCredential = await _auth.signInWithCredential(
        facebookAuthCredential,
      );

      await _handleSuccessfulAuth(userCredential);
    } catch (e) {
      Get.snackbar('Error', 'Failed to sign in with Facebook: ${e.toString()}');
      rethrow;
    } finally {
      _isSigningIn.value = false;
    }
  }

  // Sign out
  Future<void> signOut() async {
    try {
      await _auth.signOut();
      await _googleSignIn.signOut();
      // await _facebookAuth.logOut();
      Get.find<UserProvider>().clearUserData();
      await GloryAiStorage.cleanData();
      AppNavigation.removeAllRoutes(AppRoutesNames.introScreen);
    } catch (e) {
      Get.snackbar('Error', 'Failed to sign out: ${e.toString()}');
    }
  }
}
