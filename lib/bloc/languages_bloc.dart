import 'package:mail/globals/globals.dart';
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

abstract class LanguagesEvent {}
class EnglishPressed extends LanguagesEvent {}
class SpanishPressed extends LanguagesEvent {}
class FrenchPressed extends LanguagesEvent {}
class GermanPressed extends LanguagesEvent {}
class ResetState extends LanguagesEvent {}
class ConfirmPressed extends LanguagesEvent {}

class LanguagesBloc extends Bloc<LanguagesEvent, languages?> {
  LanguagesBloc() : super(confirmedLanguage) {
    on<EnglishPressed>((event, emit) => emit(languages.en));
    on<SpanishPressed>((event, emit) => emit(languages.es));
    on<FrenchPressed>((event, emit) => emit(languages.fr));
    on<GermanPressed>((event, emit) => emit(languages.de));

    on<ResetState>((event, emit) => emit(null));
    on<ConfirmPressed>((event, emit) => emit(confirmedLanguage));
  }
}
