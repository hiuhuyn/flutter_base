import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeDataRequested>(_onHomeDataRequested);
  }

  Future<void> _onHomeDataRequested(
    HomeDataRequested event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoading());

    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 1));

      emit(HomeSuccess());
    } catch (e) {
      emit(HomeFailure(e.toString()));
    }
  }
}
