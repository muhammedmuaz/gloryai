import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gloryai/const/design_const.dart';

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
}
