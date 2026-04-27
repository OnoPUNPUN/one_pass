import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:one_pass/core/theme/app_colors.dart';
import 'package:one_pass/features/home/data/datasources/home_local_data_source.dart';
import 'package:one_pass/features/home/presentation/widgets/app_search_field.dart';
import 'package:one_pass/features/home/presentation/widgets/counter_card.dart';
import 'package:one_pass/features/home/presentation/widgets/password_card.dart';
import 'package:one_pass/gen/assets.gen.dart';

class HomeScreen extends StatefulWidget {
  static const name = "/home-screen";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeLocalDataSource _localDataSource = const HomeLocalDataSourceImpl();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final passwords = _localDataSource.getPasswords();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 18, 20, 8),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Assets.logo.onboardingLogo.svg(width: 37, height: 20),
              Gap(25),
              Row(
                children: [
                  Expanded(
                    child: CounterCard(
                      count: passwords.length.toString(),
                      cardTopTitle: "Passowrd",
                      cardBottomTitle: "Stored",
                    ),
                  ),
                  Gap(20),
                  Expanded(
                    child: CounterCard(
                      count: "0",
                      cardTopTitle: "Passwords",
                      cardBottomTitle: "Compromised",
                    ),
                  ),
                ],
              ),
              Gap(20),
              AppSearchField(),
              Gap(20),
              Expanded(
                child: passwords.isEmpty
                    ? _buildNoPassword(textTheme)
                    : ListView.builder(
                        padding: const EdgeInsets.only(bottom: 108),
                        itemCount: passwords.length,
                        itemBuilder: (context, index) {
                          final item = passwords[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: PasswordCard(item: item),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column _buildNoPassword(TextTheme textTheme) {
    return Column(
      crossAxisAlignment: .center,
      children: [
        Gap(50),
        Assets.images.noResults.svg(width: 130, height: 146),
        Gap(50),
        Text(
          "NO RESULTS",
          style: textTheme.bodyLarge!.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.slate,
          ),
        ),
        Gap(10),
        Text(
          "We couldn't find anything. Try searching for something\nelse",
          style: textTheme.bodySmall,
          textAlign: .center,
        ),
      ],
    );
  }
}
