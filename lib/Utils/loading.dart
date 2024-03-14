/*
* @Author : Kishan kumar
* Email : ksbmkishan123@gmail.com
* Function : Global loader
* Created Date : 11 March 2024
* */
import 'package:flutter/material.dart';

class GlobalLoader {
  static show(BuildContext context, String message, bool isCancellable) {
    showDialog(
      context: context,
      barrierDismissible: isCancellable,
      builder: (BuildContext context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ),
                SizedBox(width: 16.0),
                Text(message),
              ],
            ),
          ),
        );
      },
    );
  }

  static hide(BuildContext context) {
    Navigator.of(context).pop();
  }
}