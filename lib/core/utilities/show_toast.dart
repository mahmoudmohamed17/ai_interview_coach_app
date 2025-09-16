import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

void showToast(
  BuildContext context, {
  String? title,
  ToastificationType? type,
}) {
  toastification.show(
    context: context,
    title: Text(
      title!,
      style: Theme.of(context).textTheme.labelLarge?.copyWith(
        color: Theme.of(context).colorScheme.onPrimaryFixedVariant,
      ),
    ),
    type: type,
    style: ToastificationStyle.flat,
    autoCloseDuration: const Duration(milliseconds: 3500),
    showProgressBar: true,
  );
}
