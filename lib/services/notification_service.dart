import 'dart:math';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import '../const/design_const.dart';

class NotificationService {
  NotificationService._();
  static final NotificationService _instance = NotificationService._();
  factory NotificationService() => _instance;

  static final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  static RemoteMessage? initialMessage;
  static bool isInForeground = true;

  static void changeStatus(bool status) => isInForeground = status;

  static Future<void> initialize() async {
    final settings = await _fcm.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      announcement: true,
      criticalAlert: true,
      provisional: true,
    );
    
    if (settings.authorizationStatus == AuthorizationStatus.denied) return;

    debugPrint("FCM Token: ${await _fcm.getToken()}");

    try {
      await AwesomeNotifications().initialize(
        'resource://drawable/logo',
        [
          NotificationChannel(
            channelKey: 'high_importance_channel',
            channelName: 'bible',
            channelDescription: 'Notification channel for Glory',
            defaultColor: DesignConstants.kPrimaryColor,
            ledColor: Colors.white,
            importance: NotificationImportance.High,
            channelShowBadge: true,
            onlyAlertOnce: false,
            playSound: true,
            enableVibration: true,
          ),
          NotificationChannel(
            channelKey: 'scheduled_channel',
            channelName: 'Scheduled notifications',
            channelDescription: 'Notification channel for scheduled alerts',
            defaultColor: DesignConstants.kPrimaryColor,
            ledColor: Colors.white,
            importance: NotificationImportance.High,
            locked: true,
          ),
        ],
        debug: false,
      );

      _setupFirebaseListeners();
      
      await AwesomeNotifications().setListeners(
        onActionReceivedMethod: _onActionReceived,
        onNotificationCreatedMethod: _onNotificationCreated,
        onNotificationDisplayedMethod: _onNotificationDisplayed,
        onDismissActionReceivedMethod: _onDismissActionReceived,
      );
    } catch (e) {
      rethrow;
    }
  }

  // Schedule a local notification
  Future<void> scheduleNotification({
    required String title,
    required String body,
    required DateTime scheduledTime,
    Map<String, String>? payload,
    String? channelKey,
    NotificationLayout notificationLayout = NotificationLayout.Default,
    int? id,
  }) async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: id ?? Random().nextInt(100000),
        channelKey: channelKey ?? 'scheduled_channel',
        title: title,
        body: body,
        payload: payload,
        notificationLayout: notificationLayout,
      ),
      schedule: NotificationCalendar.fromDate(
        date: scheduledTime,
        allowWhileIdle: true,
      ),
    );
  }

  // Cancel a scheduled notification by id
  Future<void> cancelScheduledNotification(int id) async {
    await AwesomeNotifications().cancel(id);
  }

  // Cancel all scheduled notifications
  Future<void> cancelAllScheduledNotifications() async {
    await AwesomeNotifications().cancelAllSchedules();
  }

  // Get list of pending notification schedules
  Future<List<NotificationModel>> getPendingNotifications() async {
    return await AwesomeNotifications().listScheduledNotifications();
  }

  static Future<void> _onNotificationCreated(ReceivedNotification notification) async {}
  static Future<void> _onNotificationDisplayed(ReceivedNotification notification) async {}
  static Future<void> _onDismissActionReceived(ReceivedNotification notification) async {}
  static Future<void> _onActionReceived(ReceivedAction action) async {}

  static Future<void> removeNotification(int id) async => AwesomeNotifications().dismiss(id);

  static void _setupFirebaseListeners() async {
    FirebaseMessaging.onMessage.listen((message) => _handleMessage(message));
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      _handleMessage(message, useNotificationData: true);
    });
    
    initialMessage = await _fcm.getInitialMessage();
  }

  static Future<void> _handleMessage(
    RemoteMessage message, {
    bool useNotificationData = false,
  }) async {
    final data = message.data.map((k, v) => MapEntry(k, v.toString()));
    
    if (message.notification != null) {
      createNotification(
        title: useNotificationData 
          ? message.notification!.title ?? ''
          : message.data['title'] ?? '',
        body: useNotificationData
          ? message.notification!.body ?? ''
          : message.data['body'] ?? '',
        payload: data,
      );
    }
  }

  static Future<void> createNotification({
    required String title,
    required String body,
    required Map<String, String> payload,
  }) async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: Random().nextInt(2000),
        channelKey: "high_importance_channel",
        title: title,
        body: body,
        payload: payload,
        category: NotificationCategory.Message,
        notificationLayout: NotificationLayout.Default,
        displayOnForeground: true,
        autoDismissible: false,
        showWhen: true,
        criticalAlert: true,
        wakeUpScreen: true,
      ),
    );
  }

  static Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    await _handleMessage(message, useNotificationData: true);
  }
}