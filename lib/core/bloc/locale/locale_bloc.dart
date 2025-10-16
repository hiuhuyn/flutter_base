import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../services/locale_service.dart';

part 'locale_event.dart';
part 'locale_state.dart';

class LocaleBloc extends Bloc<LocaleEvent, LocaleState> {
  final LocaleService _localeService;

  LocaleBloc(this._localeService) : super(LocaleInitial()) {
    on<LocaleChanged>(_onLocaleChanged);
    on<LocaleLoadRequested>(_onLocaleLoadRequested);
  }

  Future<void> _onLocaleChanged(
    LocaleChanged event,
    Emitter<LocaleState> emit,
  ) async {
    emit(LocaleLoading());

    try {
      await _localeService.saveLocale(event.locale);
      emit(LocaleSuccess(event.locale));
    } catch (e) {
      emit(LocaleFailure(e.toString()));
    }
  }

  Future<void> _onLocaleLoadRequested(
    LocaleLoadRequested event,
    Emitter<LocaleState> emit,
  ) async {
    emit(LocaleLoading());

    try {
      final locale = await _localeService.getSavedLocale();
      emit(LocaleSuccess(locale));
    } catch (e) {
      emit(LocaleFailure(e.toString()));
    }
  }
}
