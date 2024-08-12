part of 'on_boarding_cubit.dart';

sealed class OnBoardingState {}

final class OnBoardingInitial extends OnBoardingState {}

final class OnBoardingPageChanged extends OnBoardingState {
  final int currentPage;

  OnBoardingPageChanged(this.currentPage);
}

final class OnBoardingCompleted extends OnBoardingState {}
