import 'package:bloc/bloc.dart';
import 'package:mail/globals/variables.dart';

abstract class LanguagePressedEvent {}
class EnglishPressed extends LanguagePressedEvent {}
class SpanishPressed extends LanguagePressedEvent {}
class FrenchPressed extends LanguagePressedEvent {}
class GermanPressed extends LanguagePressedEvent {}

class LanguageBloc extends Bloc<LanguagePressedEvent, List<bool>> {
  LanguageBloc(List<bool> languagesState) : super(languagesState) {

    void knowLanguagesState () {
      languagesState.setAll(0, [false, false, false, false]);
      if (selectedLanguage == languages.EN) languagesState[0] = true;
      if (selectedLanguage == languages.ES) languagesState[1] = true;
      if (selectedLanguage == languages.FR) languagesState[2] = true;
      if (selectedLanguage == languages.DE) languagesState[3] = true;
    }

    on<EnglishPressed> ((event, emit) {
      selectedLanguage = languages.EN;
      knowLanguagesState();
      emit(languagesState);
    });

    on<SpanishPressed> ((event, emit) {
      selectedLanguage = languages.ES;
      knowLanguagesState();
      emit(languagesState);
    });

    on<FrenchPressed> ((event, emit) {
      selectedLanguage = languages.FR;
      knowLanguagesState();
      emit(languagesState);

    });

    on<GermanPressed> ((event, emit) {
      selectedLanguage = languages.DE;
      knowLanguagesState();
      emit(languagesState);
    });
  }
}