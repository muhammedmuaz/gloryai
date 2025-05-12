import 'package:flutter/material.dart';
import 'package:gloryai/const/design_const.dart';

class NotificationListScreen extends StatelessWidget {
  const NotificationListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DesignConstants.kWhiteLinen,
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: DesignConstants.kTextPurpleColor,
              ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: Hero(
          tag: 'heading',
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
            color: DesignConstants.kScarletGum,
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(gradient: DesignConstants.backgroundGradient),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                children: [
                  // Today Section
                  _buildSectionHeader('Today'),
                  const NotificationItem(
                    title: 'New Message',
                    message: 'You have received a new message from Dr. Smith',
                    time: '10:30 AM',
                    isRead: true,
                  ),
                  const NotificationItem(
                    title: 'Appointment Confirmed',
                    message: 'Your appointment for today has been confirmed',
                    time: '9:15 AM',
                    isRead: true,
                  ),
                  const SizedBox(height: 16),
                  
                  // Yesterday Section
                  _buildSectionHeader('Yesterday'),
                  const NotificationItem(
                    title: 'Appointment Reminder',
                    message: 'Your appointment is scheduled for tomorrow at 2:00 PM',
                    time: '5:30 PM',
                    isRead: true,
                  ),
                  const NotificationItem(
                    title: 'Medication Alert',
                    message: 'Don\'t forget to take your medication',
                    time: '12:00 PM',
                    isRead: true,
                  ),
                  const SizedBox(height: 16),
                  
                  // Older Section
                  _buildSectionHeader('Older'),
                  const NotificationItem(
                    title: 'New Feature Available',
                    message: 'Check out our new meditation exercises in the app',
                    time: '2 days ago',
                    isRead: true,
                  ),
                  const NotificationItem(
                    title: 'Weekly Summary',
                    message: 'View your weekly health activity summary',
                    time: '3 days ago',
                    isRead: true,
                  ),
                  const NotificationItem(
                    title: 'System Update',
                    message: 'A new version of the app is available for download',
                    time: '1 week ago',
                    isRead: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 12.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: DesignConstants.kScarletGum,
        ),
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  final String title;
  final String message;
  final String time;
  final bool isRead;

  const NotificationItem({
    super.key,
    required this.title,
    required this.message,
    required this.time,
    required this.isRead,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: Colors.white,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          // Handle notification tap
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: isRead
                      ? DesignConstants.kGhost.withOpacity(0.3)
                      : DesignConstants.kPrimaryColor.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.notifications_rounded,
                  color: isRead
                      ? DesignConstants.kAmethystSmoke
                      : DesignConstants.kPrimaryColor,
                  size: 22,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            title,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: isRead
                                  ? DesignConstants.kAmethystSmoke
                                  : DesignConstants.kScarletGum,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          time,
                          style: TextStyle(
                            fontSize: 12,
                            color: DesignConstants.kAmethystSmoke,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      message,
                      style: TextStyle(
                        fontSize: 14,
                        color: DesignConstants.kAmethystSmoke,
                        height: 1.3,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              if (!isRead)
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: DesignConstants.kPrimaryColor,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: DesignConstants.kPrimaryColor.withOpacity(0.3),
                          blurRadius: 4,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}