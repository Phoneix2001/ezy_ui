//ColorToast
import 'package:flutter/material.dart';

import '../main.dart';

void toastColor(
    String message, {Color? color}) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    snackBarKey.currentState!.hideCurrentSnackBar();
    snackBarKey.currentState!.showSnackBar(
      SnackBar(
        margin: const EdgeInsets.all(10),
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(color: Colors.transparent)),
        duration: const Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
        content: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: color,
      ),
    );
  });
}

//Error Message
void toastError(String message) {
  // WidgetsBinding.instance.addPostFrameCallback((_) {
  snackBarKey.currentState!.hideCurrentSnackBar();
  snackBarKey.currentState!.showSnackBar(
    SnackBar(
      margin: const EdgeInsets.all(10),
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Colors.transparent)),
      duration: const Duration(seconds: 3),
      behavior: SnackBarBehavior.floating,
      content: Text(message, style: const TextStyle(color: Colors.white)),
      backgroundColor: Colors.red,
    ),
  );
  // });
}

//Hide key board
void hideKeyBoard() {
  //Utils.logD("Hide keyboard", "hideed");
  WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
}