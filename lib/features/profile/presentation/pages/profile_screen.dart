import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:one_pass/core/theme/app_colors.dart';
import 'package:one_pass/features/auth/presentation/pages/login_screen.dart';
import 'package:one_pass/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:one_pass/features/profile/presentation/pages/change_password_screen.dart';
import 'package:one_pass/features/profile/presentation/pages/profile_update_screen.dart';
import 'package:one_pass/features/profile/presentation/widgets/profile_action_tile.dart';
import 'package:one_pass/features/profile/presentation/widgets/profile_pic_container.dart';
import 'package:one_pass/gen/assets.gen.dart';

class ProfileScreen extends StatelessWidget {
  static const name = "/profile-screen";
  const ProfileScreen({super.key});

  static const _avatarSize = 80.0;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BlocProvider(
      create: (context) => GetIt.instance<ProfileBloc>()..add(LoadProfileEvent()),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              String name = "Loading...";
              String email = "Loading...";
              String? avatarUrl;

              if (state is ProfileLoaded) {
                name = state.profile.username ?? "Unknown User";
                email = state.profile.email ?? "No Email";
                avatarUrl = state.profile.avatarUrl;
              } else if (state is ProfileError) {
                name = "Error loading profile";
                email = "Please try again later";
              }

              return SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 18, 20, 128),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "PROFILE",
                      style: textTheme.headlineLarge!.copyWith(
                        color: AppColors.slate,
                      ),
                    ),
                    const Gap(50),
                    Center(
                      child: Column(
                        children: [
                          ProfilePicContainer(
                            avatarSize: _avatarSize,
                            profileAvatarPath: avatarUrl,
                          ),
                          const Gap(11),
                          Text(
                            name.toUpperCase(),
                            style: textTheme.bodyLarge!.copyWith(
                              color: AppColors.slate,
                              fontFamily: 'BebasNeue',
                              height: 1,
                            ),
                          ),
                          const Gap(6),
                          Text(
                            email,
                            style: textTheme.bodySmall!.copyWith(height: 1),
                          ),
                        ],
                      ),
                    ),
                    const Gap(48),
                    Builder(
                      builder: (context) {
                        return ProfileActionTile(
                          icon: Assets.icons.user,
                          label: "Update Profile",
                          onTap: () async {
                            await context.push(ProfileUpdateScreen.name);
                            if (context.mounted) {
                              context.read<ProfileBloc>().add(LoadProfileEvent());
                            }
                          },
                        );
                      }
                    ),
                    const Gap(20),
                    ProfileActionTile(
                      icon: Assets.icons.lock,
                      label: "Change Master Password",
                      onTap: () {
                        context.push(ChangePasswordScreen.name);
                      },
                    ),
                    const Gap(20),
                    ProfileActionTile(
                      icon: Assets.icons.edit,
                      label: "Autofill Settings",
                      onTap: () {},
                    ),
                    const Gap(50),
                    ProfileActionTile(
                      icon: Assets.icons.logout,
                      label: "Logout",
                      onTap: () {
                        context.go(LoginScreen.name);
                      },
                    ),
                    const Gap(124),
                    Text("v 0.1.2", style: textTheme.bodySmall!.copyWith(height: 1)),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
