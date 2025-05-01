import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gloryai/models/user_profile_model.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // Temporary storage for form data before signup
  Map<String, dynamic> _formData = {};

  // Store form answers
  void saveFormAnswer(String key, dynamic value) {
    _formData[key] = value;
  }

  // Get all form answers
  Map<String, dynamic> getFormAnswers() {
    return _formData;
  }

  // Sign in with Google and save all collected data
  Future<UserProfile?> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return null;

      // Obtain the auth details
      final GoogleSignInAuthentication googleAuth = 
          await googleUser.authentication;

      // Create a new credential
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase
      UserCredential userCredential = 
          await _auth.signInWithCredential(credential);

      // Create user profile with all collected data
      UserProfile userProfile = UserProfile(
        uid: userCredential.user!.uid,
        email: userCredential.user!.email,
        name: userCredential.user!.displayName,
        photoUrl: userCredential.user!.photoURL,
        foundGlory: _formData['foundGlory'],
        ageCategory: _formData['ageCategory'],
        gender: _formData['gender'],
        christianTradition: _formData['christianTradition'],
        practiceDuration: _formData['practiceDuration'],
        prayerFrequency: _formData['prayerFrequency'],
        supportNeeded: _formData['supportNeeded'],
        createdAt: DateTime.now(),
      );

      // Save to Firestore
      await _firestore
          .collection('users')
          .doc(userCredential.user!.uid)
          .set(userProfile.toMap());

      // Clear temporary form data
      _formData = {};

      return userProfile;
    } catch (e) {
      print('Error signing in with Google: $e');
      return null;
    }
  }

  // Get current user profile
  Future<UserProfile?> getCurrentUserProfile() async {
    User? user = _auth.currentUser;
    if (user == null) return null;

    DocumentSnapshot doc = 
        await _firestore.collection('users').doc(user.uid).get();
    if (doc.exists) {
      return UserProfile.fromMap(doc.data() as Map<String, dynamic>);
    }
    return null;
  }

  // Sign out
  Future<void> signOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
  }
}