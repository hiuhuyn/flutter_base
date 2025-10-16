part of 'locale_bloc.dart';

abstract class LocaleState extends Equatable {
  const LocaleState();

  @override
  List<Object> get props => [];
}

class LocaleInitial extends LocaleState {}

class LocaleLoading extends LocaleState {}

class LocaleSuccess extends LocaleState {
  final Locale locale;

  const LocaleSuccess(this.locale);

  @override
  List<Object> get props => [locale];
}

class LocaleFailure extends LocaleState {
  final String message;

  const LocaleFailure(this.message);

  @override
  List<Object> get props => [message];
}
