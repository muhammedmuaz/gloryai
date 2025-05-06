import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:gloryai/models/appNotification_model.dart';
import 'package:gloryai/services/notification_service.dart';
import 'package:intl/intl.dart';

class NotificationProvider extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final NotificationService _notificationService = NotificationService();

  // List of scheduled notifications
  final RxList<AppNotification> _scheduledNotifications =
      <AppNotification>[].obs;
  List<AppNotification> get scheduledNotifications => _scheduledNotifications;

  // Loading state
  final RxBool _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  // Schedule a new notification and save to Firestore
  Future<void> scheduleNotification({
    required String title,
    required String body,
    required DateTime scheduledTime,
    String? prayerType,
  }) async {
    try {
      _isLoading.value = true;

      final user = FirebaseAuth.instance.currentUser;
      if (user == null) throw Exception('User not authenticated');

      // Generate a unique ID for the notification
      final notificationId = DateTime.now().millisecondsSinceEpoch;

      // Schedule the local notification
      await _notificationService.scheduleNotification(
        id: notificationId,
        title: title,
        body: body,
        scheduledTime: scheduledTime,
        payload: {
          'type': 'prayer_reminder',
          'prayerType': prayerType ?? 'general',
        },
      );

      // Create notification model
      final notification = AppNotification(
        id: notificationId.toString(),
        userId: user.uid,
        title: title,
        body: body,
        scheduledTime: scheduledTime,
        isCompleted: false,
        createdAt: DateTime.now(),
        prayerType: prayerType,
      );

      // Save to Firestore
      await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('scheduled_notifications')
          .doc(notificationId.toString())
          .set(notification.toMap());

      // Add to local list
      _scheduledNotifications.add(notification);

      Get.snackbar('Success', 'Notification scheduled successfully');
    } catch (e) {
      Get.snackbar('Error', 'Failed to schedule notification: ${e.toString()}');
      rethrow;
    } finally {
      _isLoading.value = false;
    }
  }

  // Fetch all scheduled notifications for current user
  Future<void> fetchScheduledNotifications() async {
    try {
      _isLoading.value = true;

      final user = FirebaseAuth.instance.currentUser;
      if (user == null) return;

      final snapshot =
          await _firestore
              .collection('users')
              .doc(user.uid)
              .collection('scheduled_notifications')
              .orderBy('scheduledTime')
              .get();

      _scheduledNotifications.assignAll(
        snapshot.docs.map((doc) => AppNotification.fromMap(doc.data())),
      );
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch notifications: ${e.toString()}');
    } finally {
      _isLoading.value = false;
    }
  }

  // Cancel a scheduled notification
  Future<void> cancelNotification(String notificationId) async {
    try {
      _isLoading.value = true;

      final user = FirebaseAuth.instance.currentUser;
      if (user == null) return;

      // Cancel local notification
      await _notificationService.cancelScheduledNotification(
        int.parse(notificationId),
      );

      // Remove from Firestore
      await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('scheduled_notifications')
          .doc(notificationId)
          .delete();

      // Remove from local list
      _scheduledNotifications.removeWhere((n) => n.id == notificationId);

      Get.snackbar('Success', 'Notification cancelled');
    } catch (e) {
      Get.snackbar('Error', 'Failed to cancel notification: ${e.toString()}');
      rethrow;
    } finally {
      _isLoading.value = false;
    }
  }

  // Get notifications for a specific date
  List<AppNotification> getNotificationsForDate(DateTime date) {
    return _scheduledNotifications.where((notification) {
      return notification.scheduledTime.year == date.year &&
          notification.scheduledTime.month == date.month &&
          notification.scheduledTime.day == date.day;
    }).toList();
  }

  @override
  void onReady() {
    fetchScheduledNotifications();
    super.onReady();
  }
}
