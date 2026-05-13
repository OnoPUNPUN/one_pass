import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:one_pass/core/network/token_manager.dart';
import 'package:one_pass/core/theme/app_colors.dart';

class ProfilePicContainer extends StatelessWidget {
  const ProfilePicContainer({
    super.key,
    double avatarSize = 150.0,
    this.profileAvatarPath,
  }) : _avatarSize = avatarSize;

  final double _avatarSize;
  final String? profileAvatarPath;

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
        child: _buildImage(),
      ),
    );
  }

  Widget _buildImage() {
    if (profileAvatarPath == null || profileAvatarPath!.isEmpty) {
      return SvgPicture.asset('assets/images/defult_avatar.svg', fit: BoxFit.cover);
    }

    if (profileAvatarPath!.startsWith('/')) {
      // Local file
      return Image.file(File(profileAvatarPath!), fit: BoxFit.cover);
    }

    // Network image from Supabase (e.g., avatars/xxx)
    final tokenManager = GetIt.instance<TokenManager>();
    
    return FutureBuilder<String?>(
      future: tokenManager.getToken(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        
        final token = snapshot.data;
        final url = 'https://bpmqsohiwjspgtckbjgs.supabase.co/storage/v1/object/$profileAvatarPath';
        
        return Image.network(
          url,
          fit: BoxFit.cover,
          headers: token != null ? {'Authorization': 'Bearer $token'} : null,
          errorBuilder: (context, error, stackTrace) {
            return SvgPicture.asset('assets/images/defult_avatar.svg', fit: BoxFit.cover);
          },
        );
      },
    );
  }
}
