import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'onborading_state.dart';

class OnboradingCubitCubit extends Cubit<OnboradingCubitState> {
  final int totalPages;
  OnboradingCubitCubit({required this.totalPages})
    : super(OnboradingCubitInitialState());

  void onPageChaged(int index) {
    emit(
      OnboradingCubitLoadedState(
        pageIndex: index,
        isLastPage: index == totalPages - 1,
      ),
    );
  }

  void nextPage() {
    final current = state.pageIndex;

    if (current < totalPages - 1) {
      final next = current + 1;

      emit(
        OnboradingCubitLoadedState(
          pageIndex: next,
          isLastPage: next == totalPages - 1,
        ),
      );
    }
  }

  void skip() {
    final last = totalPages - 1;

    emit(OnboradingCubitLoadedState(pageIndex: last, isLastPage: true));
  }
}
