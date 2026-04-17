import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:one_pass/core/constants/app_strings.dart';
import 'package:one_pass/core/theme/app_colors.dart';
import 'package:one_pass/features/onboarding/presentation/cubit/onborading_cubit.dart';
import 'package:one_pass/features/onboarding/domain/entities/onboradin_item.dart';
import 'package:one_pass/features/onboarding/presentation/widgets/onboarding_card.dart';
import 'package:one_pass/features/onboarding/presentation/widgets/onboarding_page_indicator.dart';
import 'package:one_pass/features/onboarding/presentation/widgets/onborading_back_button.dart';
import 'package:one_pass/features/onboarding/presentation/widgets/onborading_next_button.dart';
import 'package:one_pass/gen/assets.gen.dart';

class OnboradingScreen extends StatefulWidget {
  static const name = "/onborading";
  const OnboradingScreen({super.key});

  @override
  State<OnboradingScreen> createState() => _OnboradingScreenState();
}

class _OnboradingScreenState extends State<OnboradingScreen> {
  late final PageController _pageController;

  final List<OnboradinItem> items = [
    OnboradinItem(
      headLine: AppStrings.onboradingTitleOne,
      subLine: AppStrings.onboradingDescrOne,
    ),
    OnboradinItem(
      headLine: AppStrings.onboradingTitleTwo,
      subLine: AppStrings.onboradingDescrTwo,
    ),
    OnboradinItem(
      headLine: AppStrings.onboradingTitleThree,
      subLine: AppStrings.onboradingDescrThree,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OnboradingCubitCubit(totalPages: items.length),
      child: Builder(
        builder: (providerContext) {
          return BlocListener<OnboradingCubitCubit, OnboradingCubitState>(
            listenWhen: (previous, current) =>
                previous.pageIndex != current.pageIndex,
            listener: (context, state) {
              if (!_pageController.hasClients) {
                return;
              }

              final currentPage = _pageController.page?.round();
              if (currentPage == state.pageIndex) {
                return;
              }

              _pageController.animateToPage(
                state.pageIndex,
                duration: const Duration(milliseconds: 280),
                curve: Curves.easeOutCubic,
              );
            },
            child: Scaffold(
              backgroundColor: AppColors.background,
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 18, 20, 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Assets.logo.onboardingLogo.svg(width: 37, height: 20),
                      const Gap(108),
                      Expanded(
                        child: PageView.builder(
                          controller: _pageController,
                          itemCount: items.length,
                          onPageChanged: providerContext
                              .read<OnboradingCubitCubit>()
                              .onPageChaged,
                          itemBuilder: (context, index) {
                            return OnboardingCard(onboradinItem: items[index]);
                          },
                        ),
                      ),
                      BlocBuilder<OnboradingCubitCubit, OnboradingCubitState>(
                        builder: (context, state) {
                          return OnboardingPageIndicator(
                            currentIndex: state.pageIndex,
                            totalPages: items.length,
                          );
                        },
                      ),
                      const Gap(52),
                      Row(
                        children: [
                          OnboradingBackButton(),
                          const Gap(22),
                          OnboradingNextButton(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
