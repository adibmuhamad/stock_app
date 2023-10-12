import 'package:flutter_bloc/flutter_bloc.dart';

class HomeState {
  final int currentIndex;

  HomeState({this.currentIndex = 0});
}

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState());

  void updateBottomNavIndex(int index) {
    emit(HomeState(currentIndex: index));
  }
}