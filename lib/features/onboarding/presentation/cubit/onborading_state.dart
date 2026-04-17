part of 'onborading_cubit.dart';

sealed class OnboradingCubitState extends Equatable {
  final int pageIndex;
  final bool isLastPage;

  const OnboradingCubitState({
    required this.pageIndex,
    required this.isLastPage,
  });

  @override
  List<Object> get props => [pageIndex, isLastPage];
}

final class OnboradingCubitInitialState extends OnboradingCubitState {
  const OnboradingCubitInitialState() : super(pageIndex: 0, isLastPage: false);
}

final class OnboradingCubitLoadedState extends OnboradingCubitState {
  const OnboradingCubitLoadedState({
    required super.pageIndex,
    required super.isLastPage,
  });

  OnboradingCubitLoadedState copyWith({int? pageIndex, bool? isLastPage}) {
    return OnboradingCubitLoadedState(
      pageIndex: pageIndex ?? this.pageIndex,
      isLastPage: isLastPage ?? this.isLastPage,
    );
  }
}
