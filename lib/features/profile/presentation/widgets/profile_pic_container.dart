import 'package:flutter/material.dart';
import 'package:one_pass/core/theme/app_colors.dart';

class ProfilePicContainer extends StatelessWidget {
  const ProfilePicContainer({
    super.key,
    double avatarSize = 150.0,
    required String profileAvatarPath,
  }) : _avatarSize = avatarSize,
       _profileAvatarPath = profileAvatarPath;

  final double _avatarSize;
  final String _profileAvatarPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _avatarSize,
      height: _avatarSize,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primary, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(_profileAvatarPath, fit: BoxFit.cover),
      ),
    );
  }
}
