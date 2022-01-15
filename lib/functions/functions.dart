import 'package:mail/globals/globals.dart';

String getFlagIconByState(var language) {
  switch (language) {
    case languages.en:
      return 'assets/icons/usa_icon.png';
    case languages.es:
      return 'assets/icons/spain_icon.png';
    case languages.fr:
      return 'assets/icons/france_icon.png';
    case languages.de:
      return 'assets/icons/germany_icon.png';
  }
  return '';
}

String getLanguageCodeFromEnum(var language) {
  switch (language) {
    case languages.en:
      return 'en';
    case languages.es:
      return 'es';
    case languages.fr:
      return 'fr';
    case languages.de:
      return 'de';
  }
  return '';
}

languages getEnumFromLanguageCode(var language) {
  switch (language.toString()) {
    case 'en':
      return languages.en;
    case 'es':
      return languages.es;
    case 'fr':
      return languages.fr;
    case 'de':
      return languages.de;
  }
  return languages.en;
}