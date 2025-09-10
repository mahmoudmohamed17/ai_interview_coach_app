import 'dart:io';
import 'package:ai_interview_coach_app/core/constants/app_assets.dart';
import 'package:flutter/material.dart';

ImageProvider handleUserProfilePicture(String? path) {
  if (path == null || path.isEmpty) {
    return const AssetImage(AppAssets.imagesUserPicture);
  } else if (path.startsWith('http') || path.startsWith('https')) {
    return NetworkImage(path);
  } else if (File(path).existsSync()) {
    return FileImage(File(path));
  } else {
    return const AssetImage(AppAssets.imagesUserPicture);
  }
}
