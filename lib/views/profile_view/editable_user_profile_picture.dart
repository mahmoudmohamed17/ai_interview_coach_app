import 'dart:io';

import 'package:ai_interview_coach_app/core/utilities/handle_user_profile_picture.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class EditableUserProfilePicture extends StatefulWidget {
  const EditableUserProfilePicture({
    super.key,
    required this.userPicture,
    this.onTap,
  });
  final Function(String)? onTap;
  final String userPicture;

  @override
  State<EditableUserProfilePicture> createState() =>
      _EditableUserProfilePictureState();
}

class _EditableUserProfilePictureState
    extends State<EditableUserProfilePicture> {
  File? _imageFile;
  final _imagePicker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? image = await _imagePicker.pickImage(
      source: ImageSource.gallery,
    );
    if (image != null) {
      setState(() {
        _imageFile = File(image.path);
      });
      widget.onTap?.call(_imageFile!.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CircleAvatar(
          radius: 75,
          backgroundImage: _imageFile == null
              ? handleUserProfilePicture(widget.userPicture)
              : FileImage(_imageFile!),
          backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: _pickImage,
              overlayColor: const WidgetStatePropertyAll(Colors.transparent),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.tertiaryContainer,
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                ),
                padding: const EdgeInsets.all(10),
                child: const Icon(FontAwesomeIcons.pen, size: 16),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
