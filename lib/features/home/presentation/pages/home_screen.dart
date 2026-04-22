import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:one_pass/features/home/presentation/models/password_item.dart';
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
  @override
  Widget build(BuildContext context) {
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
                      count: "5",
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
                child: ListView.builder(
                  itemCount: dummyPasswords.length,
                  itemBuilder: (context, index) {
                    final item = dummyPasswords[index];
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
}
