import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:one_pass/core/shared/presentation/widgets/app_text_field.dart';
import 'package:one_pass/core/theme/app_colors.dart';
import 'package:one_pass/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:one_pass/features/profile/presentation/widgets/profile_pic_container.dart';

class ProfileUpdateScreen extends StatelessWidget {
  static const name = "/profile-update";
  const ProfileUpdateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.instance<ProfileBloc>()..add(LoadProfileEvent()),
      child: const _ProfileUpdateView(),
    );
  }
}

class _ProfileUpdateView extends StatefulWidget {
  const _ProfileUpdateView();

  @override
  State<_ProfileUpdateView> createState() => _ProfileUpdateViewState();
}

class _ProfileUpdateViewState extends State<_ProfileUpdateView> {
  final _nameTEController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  
  String? _profileAvatarPath;
  String? _pickedImagePath;

  @override
  void dispose() {
    _nameTEController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    if (Theme.of(context).platform == TargetPlatform.android) {
      final androidInfo = await DeviceInfoPlugin().androidInfo;
      if (androidInfo.version.sdkInt >= 33) {
        await Permission.photos.request();
      } else {
        await Permission.storage.request();
      }
    }

    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _pickedImagePath = pickedFile.path;
      });
    }
  }

  void _submitUpdate() {
    if (_formKey.currentState!.validate()) {
      context.read<ProfileBloc>().add(
        UpdateProfileEvent(
          username: _nameTEController.text.trim(),
          imagePath: _pickedImagePath,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "EDIT PROFILE",
          style: textTheme.headlineSmall!.copyWith(
            color: AppColors.slate,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: BlocConsumer<ProfileBloc, ProfileState>(
          listener: (context, state) {
            if (state is ProfileUpdateSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Profile updated successfully!')),
              );
              context.pop();
            } else if (state is ProfileError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            } else if (state is ProfileLoaded) {
              if (_nameTEController.text.isEmpty && state.profile.username != null) {
                _nameTEController.text = state.profile.username!;
              }
              _profileAvatarPath = state.profile.avatarUrl;
            }
          },
          builder: (context, state) {
            final isLoading = state is ProfileLoading;

            return SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const Gap(20),
                    Center(
                      child: ProfilePicContainer(
                        profileAvatarPath: _pickedImagePath ?? _profileAvatarPath,
                      ),
                    ),
                    TextButton(
                      onPressed: isLoading ? null : _pickImage,
                      child: Text(
                        "Change Picture",
                        style: textTheme.bodySmall!.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                    const Gap(33),
                    AppTextField(
                      headingText: "NAME",
                      hintText: "John Doe",
                      controller: _nameTEController,
                    ),
                    const Gap(50),
                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        onPressed: isLoading ? null : _submitUpdate,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: isLoading
                            ? const CircularProgressIndicator(color: Colors.white)
                            : Text(
                                "SAVE",
                                style: textTheme.bodyLarge!.copyWith(
                                  color: Colors.white,
                                  fontFamily: 'BebasNeue',
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
