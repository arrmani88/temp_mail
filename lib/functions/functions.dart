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