import 'package:flutter/material.dart';
import 'package:gloryai/const/design_const.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSupportScreen extends StatelessWidget {
  const ContactSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    
    return Scaffold(
      appBar: _buildAppBar(isDarkMode),
      body: Container(
        decoration: BoxDecoration(
          gradient: isDarkMode 
              ? LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    DesignConstants.kScarletGum.withOpacity(0.8),
                    DesignConstants.kScarletGum,
                  ],
                )
              : DesignConstants.backgroundGradient,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: Column(
              children: [
                _buildHeaderSection(isDarkMode),
                const SizedBox(height: 40),
                _buildContactOptions(context, isDarkMode),
                const SizedBox(height: 32),
                _buildAlternativeOptions(isDarkMode),
              ],
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(bool isDarkMode) {
    return AppBar(
      title: Text(
        'Contact Support',
        style: TextStyle(
          color: isDarkMode ? Colors.white : DesignConstants.kScarletGum,
          fontWeight: FontWeight.w600,
        ),
      ),
      backgroundColor: isDarkMode 
          ? DesignConstants.kScarletGum 
          : Colors.white,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: isDarkMode ? Colors.white : DesignConstants.kScarletGum,
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildHeaderSection(bool isDarkMode) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: isDarkMode
                ? Colors.white.withOpacity(0.1)
                : DesignConstants.kPrimaryColor.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.help_outline_rounded,
            size: 40,
            color: isDarkMode 
                ? Colors.white 
                : DesignConstants.kPrimaryColor,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'How can we help you?',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: isDarkMode ? Colors.white : DesignConstants.kScarletGum,
            height: 1.3,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 12),
        Text(
          'Our team is available to assist with any questions or issues you may encounter.',
          style: TextStyle(
            fontSize: 16,
            color: isDarkMode 
                ? Colors.white.withOpacity(0.8)
                : DesignConstants.kAmethystSmoke,
            height: 1.5,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildContactOptions(BuildContext context, bool isDarkMode) {
    return Column(
      children: [
        _buildContactCard(
          context,
          icon: Icons.email_rounded,
          title: 'Email Us',
          subtitle: 'Get a detailed response within 24 hours',
          color: DesignConstants.kSecondaryColor,
          isDarkMode: isDarkMode,
          onTap: () => _launchEmail(context),
        ),
        const SizedBox(height: 16),
        _buildContactCard(
          context,
          icon: Icons.phone_rounded,
          title: 'Call Support',
          subtitle: 'Available weekdays 9AM - 5PM',
          color: DesignConstants.kCaribbeanGreen,
          isDarkMode: isDarkMode,
          onTap: () => _launchPhone(context),
        ),
        const SizedBox(height: 16),
        _buildContactCard(
          context,
          icon: Icons.forum_rounded,
          title: 'Live Chat',
          subtitle: 'Instant connection with an agent',
          color: DesignConstants.kTrendyPink,
          isDarkMode: isDarkMode,
          onTap: () => _launchChat(context),
        ),
      ],
    );
  }

  Widget _buildContactCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required bool isDarkMode,
    required VoidCallback onTap,
  }) {
    return Material(
      color: isDarkMode 
          ? Colors.white.withOpacity(0.08)
          : Colors.white,
      borderRadius: BorderRadius.circular(16),
      elevation: isDarkMode ? 0 : 2,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: isDarkMode
                ? Border.all(
                    color: Colors.white.withOpacity(0.1),
                    width: 1,
                  )
                : null,
          ),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: isDarkMode
                      ? color.withOpacity(0.2)
                      : color.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  color: color,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: isDarkMode 
                            ? Colors.white 
                            : DesignConstants.kScarletGum,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 14,
                        color: isDarkMode
                            ? Colors.white.withOpacity(0.7)
                            : DesignConstants.kAmethystSmoke,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 16,
                color: isDarkMode
                    ? Colors.white.withOpacity(0.5)
                    : DesignConstants.kAmethystSmoke,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAlternativeOptions(bool isDarkMode) {
    return Column(
      children: [
        Divider(
          color: isDarkMode 
              ? Colors.white.withOpacity(0.1)
              : Colors.grey.withOpacity(0.2),
          height: 1,
        ),
        const SizedBox(height: 24),
        Text(
          'Other support options',
          style: TextStyle(
            color: isDarkMode
                ? Colors.white.withOpacity(0.7)
                : DesignConstants.kAmethystSmoke,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 16),
        OutlinedButton(
          onPressed: () {
            // Navigate to FAQ screen
          },
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            side: BorderSide(
              color: isDarkMode
                  ? Colors.white.withOpacity(0.3)
                  : DesignConstants.kPrimaryColor,
            ),
          ),
          child: Text(
            'Visit Help Center',
            style: TextStyle(
              color: isDarkMode 
                  ? Colors.white 
                  : DesignConstants.kPrimaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 16),
        TextButton(
          onPressed: () {
            // Show contact form
          },
          child: Text(
            'Submit a Request',
            style: TextStyle(
              color: isDarkMode
                  ? Colors.white.withOpacity(0.8)
                  : DesignConstants.kPrimaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _launchEmail(BuildContext context) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'support@gloryai.com',
      queryParameters: {
        'subject': 'Support Request - GloryAI App',
        'body': 'Hello GloryAI Team,\n\nI need assistance with:\n\n[Please describe your issue in detail]\n\n\nApp Version: [Your Version]\nDevice: [Your Device]',
      },
    );

    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(emailLaunchUri);
    } else {
      _showErrorSnackbar(context, 'Could not launch email client');
    }
  }

  Future<void> _launchPhone(BuildContext context) async {
    const phoneNumber = 'tel:+18005551234';
    if (await canLaunchUrl(Uri.parse(phoneNumber))) {
      await launchUrl(Uri.parse(phoneNumber));
    } else {
      _showErrorSnackbar(context, 'Could not launch phone app');
    }
  }

  Future<void> _launchChat(BuildContext context) async {
    // In a real app, this would connect to your chat service
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.4),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 24),
            Icon(
              Icons.forum_rounded,
              size: 48,
              color: DesignConstants.kTrendyPink,
            ),
            const SizedBox(height: 16),
            Text(
              'Start Live Chat',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).textTheme.titleLarge?.color,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'You\'ll be connected to the next available support agent',
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyMedium?.color?.withOpacity(0.7),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: DesignConstants.kTrendyPink,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  // Implement actual chat connection
                },
                child: const Text(
                  'CONNECT NOW',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Cancel',
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodyMedium?.color?.withOpacity(0.7),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showErrorSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        margin: const EdgeInsets.all(16),
      ),
    );
  }
}