import 'package:bloc/bloc.dart';

abstract class LanguagePressedEvent {}
class EnglishPressed extends LanguagePressedEvent {}
class SpanishPressed extends LanguagePressedEvent {}
class FrenchPressed extends LanguagePressedEvent {}
class GermanPressed extends LanguagePressedEvent {}

class LanguageBloc extends Bloc<LanguagePressedEvent, bool> {
  LanguageBloc(bool isLanguageSelected) : super(isLanguageSelected) {

    on<EnglishPressed> ((event, emit) {
      int i = 0;
    });
  }
}