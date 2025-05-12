import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gloryai/const/design_const.dart';
import 'package:gloryai/routing/app_navigator.dart';
import 'package:toastification/toastification.dart';
import 'package:url_launcher/url_launcher.dart';

class BottomSheetsAndDialogs {
  static void showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(
          child: Container(
            width: 65,
            height: 65,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12), // Rounded corners
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: const Center(child: CupertinoActivityIndicator(radius: 12)),
          ),
        );
      },
    );
  }

  static void shareDialogBox(
    BuildContext context, {
    required VoidCallback onShare,
    VoidCallback? onCancel,
  }) {
    showCupertinoDialog(
      context: context,
      builder:
          (BuildContext context) => CupertinoAlertDialog(
            title: Text(
              'Your words could be just what someone needs to hear today',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: DesignConstants.kTextPurpleColor,
              ),
            ),
            actions: [
              CupertinoDialogAction(
                onPressed: onShare,
                isDefaultAction: true,
                child: Text(
                  'Not Now',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.blue,
                  ),
                ),
              ),
              CupertinoDialogAction(
                onPressed:
                    onCancel ??
                    () {
                      Navigator.pop(context);
                    },
                child: Text(
                  'Share Now',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.blue,
                    height: 1.4,
                  ),
                ),
              ),
            ],
          ),
    );
  }

  static void showLoadingDialogTitle(
    BuildContext context, {
    required String title,
  }) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(
            title,
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
          content: const CupertinoActivityIndicator(),
        );
      },
    );
  }

  // Show Logout Modal PopUp
  static void showLogoutDialog(
    BuildContext context, {
    required final VoidCallback onConfirm,
  }) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(
            "Are you sure you want to log out?",
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          actions: <Widget>[
            // YES button
            CupertinoDialogAction(
              onPressed: onConfirm,
              child: Text(
                "Yes",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: DesignConstants.kPrimaryColor,
                ),
              ),
            ),
            // NO button
            CupertinoDialogAction(
              child: Text(
                "No",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.red,
                ),
              ),
              onPressed: () => AppNavigation.goBack(),
            ),
          ],
        );
      },
    );
  }

  static void notificationDialogBox(
    BuildContext context, {
    required VoidCallback onAccept,
    VoidCallback? onCancel,
  }) {
    showCupertinoDialog(
      context: context,
      builder:
          (BuildContext context) => CupertinoAlertDialog(
            title: Text(
              'The "Glory" app wants to send you notifications. Notifications may include alerts, sounds, and badges on icons. You can configurethem in Settings.',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: DesignConstants.kTextPurpleColor,
              ),
            ),
            actions: [
              CupertinoDialogAction(
                onPressed:
                    onCancel ??
                    () {
                      Navigator.pop(context);
                    },
                isDefaultAction: true,
                child: Text(
                  'Deny',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.blue,
                  ),
                ),
              ),
              CupertinoDialogAction(
                onPressed: onAccept,
                child: Text(
                  'Allow',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.blue,
                    height: 1.4,
                  ),
                ),
              ),
            ],
          ),
    );
  }

  static void deleteAccountDialog(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder:
          (BuildContext context) => CupertinoAlertDialog(
            title: const Text('Delete Account'),
            content: const Text(
              'Are you sure you want to delete your account? This action cannot be undone.',
            ),
            actions: [
              CupertinoDialogAction(
                onPressed: () => Navigator.pop(context),
                isDefaultAction: true,
                child: const Text('No'),
              ),
              CupertinoDialogAction(
                onPressed: () async {
                  // Close the dialog
                  AppNavigation.goBack();

                  // Show loading dialog
                  showLoadingDialog(context);

                  // Simulate API call or processing
                  await Future.delayed(const Duration(seconds: 2));
                  AppNavigation.goBack();
                  // Close loading dialog
                  await Future.delayed(const Duration(seconds: 1));

                  HelperFunctions.displayToastMessage(
                    "Request submitted",
                    ToastificationType.success,
                    notificationStyle: ToastificationStyle.flat,
                  );
                },
                isDestructiveAction: true,
                child: const Text('Yes'),
              ),
            ],
          ),
    );
  }
}

class HelperFunctions {
  static Future<void> launchEmail(BuildContext context) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'support@gloryai.com',
      queryParameters: {
        'subject': 'Support Request - GloryAI App',
        'body':
            'Hello GloryAI Team,\n\nI need assistance with:\n\n[Please describe your issue in detail]\n\n\nApp Version: [Your Version]\nDevice: [Your Device]',
      },
    );
    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(emailLaunchUri);
    } else {
      HelperFunctions.displayToastMessage(
        "Could not launch email",
        ToastificationType.info,
      );
    }
  }

  // Toast Message
  static void displayToastMessage(
    String message,
    ToastificationType notificationType, {
    ToastificationStyle notificationStyle = ToastificationStyle.fillColored,
    Duration duration = const Duration(milliseconds: 2000),
  }) {
    // Dismiss the previous notification then make new
    toastification.dismissAll();

    ///////////////////////////////////////////////
    toastification.show(
      context: AppNavigation.navigatorKey.currentContext,
      title:
          notificationType == ToastificationType.error
              ? const Text(
                "An Error Occured",
                softWrap: true,
                maxLines: null,
                overflow: TextOverflow.visible,
              )
              : Text(
                message,
                softWrap: true,
                maxLines: null,
                overflow: TextOverflow.visible,
              ),
      description:
          notificationType == ToastificationType.error ? Text(message) : null,
      type: notificationType,
      style: notificationStyle,
      alignment: Alignment.topCenter,
      autoCloseDuration: duration,
      animationDuration: const Duration(milliseconds: 400),
      showProgressBar: true,
      closeOnClick: true,
    );
  }

  static Future<void> launchLink(
    BuildContext context, {
    required String url,
  }) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }
}
