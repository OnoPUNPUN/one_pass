import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:one_pass/core/di/injection_container.dart';
import 'package:one_pass/core/theme/app_colors.dart';
import 'package:one_pass/features/home/domain/entities/password_item.dart';
import 'package:one_pass/features/home/presentation/bloc/home_bloc.dart';
import 'package:one_pass/features/home/presentation/widgets/app_search_field.dart';
import 'package:one_pass/features/home/presentation/widgets/counter_card.dart';
import 'package:one_pass/features/home/presentation/widgets/password_card.dart';
import 'package:one_pass/gen/assets.gen.dart';

class HomeScreen extends StatelessWidget {
  static const name = "/home-screen";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: sl<HomeBloc>()..add(LoadPasswords()),
      child: const _HomeScreenContent(),
    );
  }
}

class _HomeScreenContent extends StatefulWidget {
  const _HomeScreenContent();

  @override
  State<_HomeScreenContent> createState() => _HomeScreenContentState();
}

class _HomeScreenContentState extends State<_HomeScreenContent> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 18, 20, 8),
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              List<PasswordItem> passwords = [];
              if (state is HomeLoaded) {
                passwords = state.passwords;
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Assets.logo.onboardingLogo.svg(width: 37, height: 20),
                  const Gap(25),
                  Row(
                    children: [
                      Expanded(
                        child: CounterCard(
                          count: passwords.length.toString(),
                          cardTopTitle: "Password",
                          cardBottomTitle: "Stored",
                        ),
                      ),
                      const Gap(20),
                      Expanded(
                        child: CounterCard(
                          count: "0",
                          cardTopTitle: "Passwords",
                          cardBottomTitle: "Compromised",
                        ),
                      ),
                    ],
                  ),
                  const Gap(20),
                  const AppSearchField(),
                  const Gap(20),
                  Expanded(
                    child: _buildBody(state, passwords, textTheme),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildBody(HomeState state, List<PasswordItem> passwords, TextTheme textTheme) {
    if (state is HomeLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (state is HomeError) {
      return Center(
        child: Text(
          "Error: ${state.message}",
          style: textTheme.bodyLarge!.copyWith(color: Colors.red),
        ),
      );
    } else {
      if (passwords.isEmpty) {
        return _buildNoPassword(textTheme);
      }
      return ListView.builder(
        padding: const EdgeInsets.only(bottom: 108),
        itemCount: passwords.length,
        itemBuilder: (context, index) {
          final item = passwords[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: PasswordCard(item: item),
          );
        },
      );
    }
  }

  Column _buildNoPassword(TextTheme textTheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Gap(50),
        Assets.images.noResults.svg(width: 130, height: 146),
        const Gap(50),
        Text(
          "NO RESULTS",
          style: textTheme.bodyLarge!.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.slate,
          ),
        ),
        const Gap(10),
        Text(
          "We couldn't find anything. Try searching for something\nelse",
          style: textTheme.bodySmall,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
