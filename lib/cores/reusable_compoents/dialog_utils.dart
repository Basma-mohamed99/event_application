import 'package:flutter/material.dart';

class DialogUtils {
  static showLoadingDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [CircularProgressIndicator()],
        ),
      ),
    );
  }

  static showExptionDialog({
    required BuildContext context,
    required String message,
    required String messageOfButtonPostive,
    required void Function() functionOfButtonPostive,
     String? messageOfButtonNegative,
     void Function()? functionOfButtonNegative,
  }) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        actions: [
          TextButton(
            onPressed: functionOfButtonPostive,
            child: Text(messageOfButtonPostive),
          ),
          if(messageOfButtonNegative!=null)
          TextButton(
            onPressed: functionOfButtonNegative,
            child: Text(messageOfButtonNegative),
          ),
        ],
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(message, style: Theme.of(context).textTheme.titleSmall),
          ],
        ),
      ),
    );
  }
}
