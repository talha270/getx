
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Localizationservices extends Translations{
  // Default language
  static final locale = Locale('en', 'US');

  // Supported languages
  static final fallbackLocale = Locale('en', 'US');

  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      'hello': 'Hello',
      'change_lang': 'Change Language',
      "title":"Flutter Localization"
    },
    'es_ES': {
      'hello': 'Hola',
      'change_lang': 'Cambiar idioma',
      "title":"Localización de aleteo"
    },
    'fr_FR': {
      'hello': 'Bonjour',
      'change_lang': 'Changer de langue',
      "title":"Localisation du flottement"
    },
  };

}
