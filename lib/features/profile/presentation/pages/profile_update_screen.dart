import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:one_pass/core/shared/presentation/widgets/app_text_field.dart';
import 'package:one_pass/core/theme/app_colors.dart';
import 'package:one_pass/features/profile/presentation/widgets/profile_pic_container.dart';

class ProfileUpdateScreen extends StatefulWidget {
  static const name = "/profile-update";
  const ProfileUpdateScreen({super.key});

  @override
  State<ProfileUpdateScreen> createState() => _ProfileUpdateScreenState();
}

class _ProfileUpdateScreenState extends State<ProfileUpdateScreen> {
  static const _profileAvatarPath = 'assets/images/profile_avatar.jpg';
  final _nameTEController = TextEditingController();
  final _fromKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Form(
            key: _fromKey,
            child: Column(
              children: [
                Gap(50),
                Text(
                  "EDIT PROFILE",
                  style: textTheme.headlineLarge!.copyWith(
                    color: AppColors.slate,
                  ),
                ),
                Gap(50),
                Column(
                  children: [
                    Center(
                      child: ProfilePicContainer(
                        profileAvatarPath: _profileAvatarPath,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Change Picture",
                        style: textTheme.bodySmall!.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                    Gap(33),
                    AppTextField(
                      headingText: "NAME",
                      hintText: "John Doe",
                      controller: _nameTEController,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
