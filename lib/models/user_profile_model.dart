class UserProfile {
  final String uid;
  final String? email;
  final String? name;
  final String? photoUrl;
  final String? foundGlory;
  final String? ageCategory;
  String? gender;
  String? christianTradition;
  String? bibleVersion;
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
    this.bibleVersion,
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
      'bibleVersion': bibleVersion,
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
      bibleVersion: map['bibleVersion'],
      practiceDuration: map['practiceDuration'],
      prayerFrequency: map['prayerFrequency'],
      supportNeeded: map['supportNeeded'],
      createdAt: DateTime.parse(map['createdAt']),
    );
  }

  // Add copyWith method if not already present
  UserProfile copyWith({
    String? uid,
    String? email,
    String? name,
    String? photoUrl,
    String? foundGlory,
    String? ageCategory,
    String? gender,
    String? christianTradition,
    String? bibleVersion,
    String? practiceDuration,
    String? prayerFrequency,
    String? supportNeeded,
    DateTime? createdAt,
  }) {
    return UserProfile(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      name: name ?? this.name,
      photoUrl: photoUrl ?? this.photoUrl,
      foundGlory: foundGlory ?? this.foundGlory,
      ageCategory: ageCategory ?? this.ageCategory,
      gender: gender ?? this.gender,
      christianTradition: christianTradition ?? this.christianTradition,
      bibleVersion: bibleVersion ?? this.bibleVersion,
      practiceDuration: practiceDuration ?? this.practiceDuration,
      prayerFrequency: prayerFrequency ?? this.prayerFrequency,
      supportNeeded: supportNeeded ?? this.supportNeeded,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}