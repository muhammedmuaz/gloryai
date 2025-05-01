class UserProfile {
  final String uid;
  final String? email;
  final String? name;
  final String? photoUrl;
  final String? foundGlory;
  final String? ageCategory;
  final String? gender;
  final String? christianTradition;
  final String? practiceDuration;
  final String? prayerFrequency;
  final String? supportNeeded;
  final DateTime createdAt;

  UserProfile({
    required this.uid,
    this.email,
    this.name,
    this.photoUrl,
    this.foundGlory,
    this.ageCategory,
    this.gender,
    this.christianTradition,
    this.practiceDuration,
    this.prayerFrequency,
    this.supportNeeded,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'photoUrl': photoUrl,
      'foundGlory': foundGlory,
      'ageCategory': ageCategory,
      'gender': gender,
      'christianTradition': christianTradition,
      'practiceDuration': practiceDuration,
      'prayerFrequency': prayerFrequency,
      'supportNeeded': supportNeeded,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory UserProfile.fromMap(Map<String, dynamic> map) {
    return UserProfile(
      uid: map['uid'],
      email: map['email'],
      name: map['name'],
      photoUrl: map['photoUrl'],
      foundGlory: map['foundGlory'],
      ageCategory: map['ageCategory'],
      gender: map['gender'],
      christianTradition: map['christianTradition'],
      practiceDuration: map['practiceDuration'],
      prayerFrequency: map['prayerFrequency'],
      supportNeeded: map['supportNeeded'],
      createdAt: DateTime.parse(map['createdAt']),
    );
  }
}