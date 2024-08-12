import 'package:flutter_bloc/flutter_bloc.dart';
part 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnBoardingInitial());

  final int totalPages = 3;

  void onPageChanged(int index) {
    emit(OnBoardingPageChanged(index));
  }

  void onNextPage(int currentPage) {
    if (currentPage < totalPages - 1) {
      emit(OnBoardingPageChanged(currentPage + 1));
    } else {
      emit(OnBoardingCompleted());
    }
  }

  void onBackPage(int currentPage) {
    if (currentPage > 0) {
      emit(OnBoardingPageChanged(currentPage - 1));
    }
  }

  void onSkip() {
    emit(OnBoardingCompleted());
  }
}