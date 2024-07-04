//ColorToast
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

import '../main.dart';

void toastColor(
    String message) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
toastification.dismissAll(delayForAnimation: false);
    toastification.show(
      type: ToastificationType.success,
      style: ToastificationStyle.flat,
      description: Text(message),
      alignment: Alignment.topCenter,
      autoCloseDuration: const Duration(seconds: 3),
      borderRadius: BorderRadius.circular(12.0),
      boxShadow: lowModeShadow,
      showProgressBar: true,
      closeButtonShowType: CloseButtonShowType.onHover,
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