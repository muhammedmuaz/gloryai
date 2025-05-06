import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class AppNotification {
  final String id;
  final String userId;
  final String title;
  final String body;
  final DateTime scheduledTime;
  final bool isCompleted;
  final DateTime createdAt;
  final String? prayerType;

  AppNotification({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
    required this.scheduledTime,
    this.isCompleted = false,
    required this.createdAt,
    this.prayerType,
  });

  factory AppNotification.fromMap(Map<String, dynamic> map) {
    return AppNotification(
      id: map['id'],
      userId: map['userId'],
      title: map['title'],
      body: map['body'],
      scheduledTime: (map['scheduledTime'] as Timestamp).toDate(),
      isCompleted: map['isCompleted'],
      createdAt: (map['createdAt'] as Timestamp).toDate(),
      prayerType: map['prayerType'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'title': title,
      'body': body,
      'scheduledTime': Timestamp.fromDate(scheduledTime),
      'isCompleted': isCompleted,
      'createdAt': Timestamp.fromDate(createdAt),
      'prayerType': prayerType,
    };
  }

  String get formattedTime => DateFormat.jm().format(scheduledTime);
  String get formattedDate => DateFormat.yMMMd().format(scheduledTime);
}