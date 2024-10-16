import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'es', 'fr', 'ar', 'sw'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? esText = '',
    String? frText = '',
    String? arText = '',
    String? swText = '',
  }) =>
      [enText, esText, frText, arText, swText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Start
  {
    'ogc6h2r9': {
      'en': 'Welcome.',
      'ar': 'مرحباً.',
      'es': 'Bienvenido.',
      'fr': 'Accueillir.',
      'sw': 'Karibu.',
    },
    '4iq7slee': {
      'en':
          'Your guide to discovering the amazing projects and innovations of our talented students!',
      'ar': 'دليلك لاكتشاف المشاريع والابتكارات المذهلة لطلابنا الموهوبين!',
      'es':
          '¡Tu guía para descubrir los increíbles proyectos e innovaciones de nuestros talentosos estudiantes!',
      'fr':
          'Votre guide pour découvrir les projets et innovations étonnants de nos étudiants talentueux !',
      'sw':
          'Mwongozo wako wa kugundua miradi ya ajabu na ubunifu wa wanafunzi wetu wenye vipaji!',
    },
    'ged41go0': {
      'en': 'Welcome.',
      'ar': 'مرحباً.',
      'es': 'Bienvenido.',
      'fr': 'Accueillir.',
      'sw': 'Karibu.',
    },
    'b3rg1k23': {
      'en':
          'Your guide to discovering the amazing projects and innovations of our talented students!',
      'ar': 'دليلك لاكتشاف المشاريع والابتكارات المذهلة لطلابنا الموهوبين!',
      'es':
          '¡Tu guía para descubrir los increíbles proyectos e innovaciones de nuestros talentosos estudiantes!',
      'fr':
          'Votre guide pour découvrir les projets et innovations étonnants de nos étudiants talentueux !',
      'sw':
          'Mwongozo wako wa kugundua miradi ya ajabu na ubunifu wa wanafunzi wetu wenye vipaji!',
    },
    '2g8gfwix': {
      'en': 'Welcome.',
      'ar': 'مرحباً.',
      'es': 'Bienvenido.',
      'fr': 'Accueillir.',
      'sw': 'Karibu.',
    },
    'gf0cozt6': {
      'en':
          'Your guide to discovering the amazing projects and innovations from our talented students!',
      'ar': 'دليلك لاكتشاف المشاريع والابتكارات المذهلة لطلابنا الموهوبين!',
      'es':
          '¡Tu guía para descubrir los increíbles proyectos e innovaciones de nuestros talentosos estudiantes!',
      'fr':
          'Votre guide pour découvrir les projets et innovations étonnants de nos étudiants talentueux !',
      'sw':
          'Mwongozo wako wa kugundua miradi ya ajabu na ubunifu kutoka kwa wanafunzi wetu wenye vipaji!',
    },
    'ieysq8ov': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'sw': 'Nyumbani',
    },
  },
  // LoginMethod
  {
    'k0nviovj': {
      'en': 'Let’s get you in',
      'ar': 'دعونا ندخلك',
      'es': 'Vamos a llevarte adentro',
      'fr': 'Laissez-nous vous accueillir',
      'sw': 'Hebu tuingize ndani',
    },
    'oudo6rps': {
      'en': 'Sign in with email',
      'ar': 'تسجيل الدخول بالبريد الإلكتروني',
      'es': 'Iniciar sesión con correo electrónico',
      'fr': 'Connectez-vous avec votre e-mail',
      'sw': 'Ingia kwa kutumia barua pepe',
    },
    'tdtto5un': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'sw': 'Nyumbani',
    },
  },
  // OnBoarding
  {
    'i74467xr': {
      'en': 'Get Started',
      'ar': 'البدء',
      'es': 'Empezar',
      'fr': 'Commencer',
      'sw': 'Anza',
    },
    'lc4263su': {
      'en':
          'Explore a variety of student projects across different categories, share your work and receive feedback from peers and teachers',
      'ar':
          'استكشف مجموعة متنوعة من مشاريع الطلاب عبر فئات مختلفة، وشارك عملك واحصل على تعليقات من الزملاء والمعلمين',
      'es':
          'Explora una variedad de proyectos estudiantiles en diferentes categorías, comparte tu trabajo y recibe comentarios de tus compañeros y profesores.',
      'fr':
          'Explorez une variété de projets étudiants dans différentes catégories, partagez votre travail et recevez les commentaires de vos pairs et de vos enseignants',
      'sw':
          'Gundua miradi mbalimbali ya wanafunzi katika kategoria tofauti, shiriki kazi yako na upokee maoni kutoka kwa wenzako na walimu',
    },
    '7hqn9soo': {
      'en': 'Mission Statement',
      'ar': 'بيان المهمة',
      'es': 'Declaración de misión',
      'fr': 'Énoncé de mission',
      'sw': 'Taarifa ya Ujumbe',
    },
    'tnxo13x1': {
      'en':
          'To be the leading international School in Africa, transforming the Hearts, Minds, Bodies and Souls of tomorrow\'s leaders.',
      'ar':
          'أن نكون المدرسة الدولية الرائدة في أفريقيا، والتي تعمل على تحويل قلوب وعقول وأجساد وأرواح قادة الغد.',
      'es':
          'Ser la escuela internacional líder en África, transformando los corazones, las mentes, los cuerpos y las almas de los líderes del mañana.',
      'fr':
          'Être l’école internationale leader en Afrique, transformant les cœurs, les esprits, les corps et les âmes des dirigeants de demain.',
      'sw':
          'Kuwa Shule inayoongoza ya kimataifa barani Afrika, inayobadilisha Mioyo, Akili, Miili na Roho za viongozi wa kesho.',
    },
    '39yd2a4n': {
      'en': 'Vision',
      'ar': 'رؤية',
      'es': 'Visión',
      'fr': 'Vision',
      'sw': 'Maono',
    },
    'wwlz7lve': {
      'en':
          'Seeking the highest for every individual with Christ as our guide.',
      'ar': 'السعي لتحقيق الأفضل لكل فرد مع المسيح كمرشد لنا.',
      'es':
          'Buscando lo máximo para cada individuo con Cristo como nuestro guía.',
      'fr':
          'Rechercher le plus haut pour chaque individu avec le Christ comme guide.',
      'sw':
          'Kutafuta yaliyo juu zaidi kwa kila mtu binafsi na Kristo kama kiongozi wetu.',
    },
    'ztazuz7n': {
      'en': 'Skip',
      'ar': 'يتخطى',
      'es': 'Saltar',
      'fr': 'Sauter',
      'sw': 'Ruka',
    },
    '07geo164': {
      'en': 'World of inspiration',
      'ar': 'عالم الإلهام',
      'es': 'Mundo de inspiración',
      'fr': 'Un monde d\'inspiration',
      'sw': 'Ulimwengu wa msukumo',
    },
    '3knytz9d': {
      'en':
          'Explore a variety of student projects across different categories, share your work and receive feedback from peers and teachers',
      'ar':
          'استكشف مجموعة متنوعة من مشاريع الطلاب عبر فئات مختلفة، وشارك عملك واحصل على تعليقات من الزملاء والمعلمين',
      'es':
          'Explora una variedad de proyectos estudiantiles en diferentes categorías, comparte tu trabajo y recibe comentarios de tus compañeros y profesores.',
      'fr':
          'Explorez une variété de projets étudiants dans différentes catégories, partagez votre travail et recevez les commentaires de vos pairs et de vos enseignants',
      'sw':
          'Gundua miradi mbalimbali ya wanafunzi katika kategoria tofauti, shiriki kazi yako na upokee maoni kutoka kwa wenzako na walimu',
    },
    'g1a4r1in': {
      'en': 'Mission statement',
      'ar': 'بيان المهمة',
      'es': 'Declaración de misión',
      'fr': 'Déclaration de mission',
      'sw': 'Taarifa ya utume',
    },
    'n38pbffk': {
      'en':
          'To be the leading international School in Africa, transforming the Hearts, Minds, Bodies and Souls of tomorrow\'s leaders.',
      'ar':
          'أن نكون المدرسة الدولية الرائدة في أفريقيا، والتي تعمل على تحويل قلوب وعقول وأجساد وأرواح قادة الغد.',
      'es':
          'Ser la escuela internacional líder en África, transformando los corazones, las mentes, los cuerpos y las almas de los líderes del mañana.',
      'fr':
          'Être l’école internationale leader en Afrique, transformant les cœurs, les esprits, les corps et les âmes des dirigeants de demain.',
      'sw':
          'Kuwa Shule inayoongoza ya kimataifa barani Afrika, inayobadilisha Mioyo, Akili, Miili na Roho za viongozi wa kesho.',
    },
    'dkojy6h8': {
      'en': 'Vision',
      'ar': 'رؤية',
      'es': 'Visión',
      'fr': 'Vision',
      'sw': 'Maono',
    },
    'zip2qnyc': {
      'en':
          'Seeking the highest for every individual with Christ as our guide.',
      'ar': 'السعي لتحقيق الأفضل لكل فرد مع المسيح كمرشد لنا.',
      'es':
          'Buscando lo máximo para cada individuo con Cristo como nuestro guía.',
      'fr':
          'Rechercher le plus haut pour chaque individu avec le Christ comme guide.',
      'sw':
          'Kutafuta yaliyo juu zaidi kwa kila mtu binafsi na Kristo kama kiongozi wetu.',
    },
    'ikoqbna0': {
      'en': 'Skip',
      'ar': 'يتخطى',
      'es': 'Saltar',
      'fr': 'Sauter',
      'sw': 'Ruka',
    },
    'cl1kaywu': {
      'en': 'World of inspiration',
      'ar': 'عالم الإلهام',
      'es': 'Mundo de inspiración',
      'fr': 'Un monde d\'inspiration',
      'sw': 'Ulimwengu wa msukumo',
    },
    'dpl2fnt8': {
      'en':
          'Explore a variety of student projects across different categories, share your work and receive feedback from peers and teachers',
      'ar':
          'استكشف مجموعة متنوعة من مشاريع الطلاب عبر فئات مختلفة، وشارك عملك واحصل على تعليقات من الزملاء والمعلمين',
      'es':
          'Explora una variedad de proyectos estudiantiles en diferentes categorías, comparte tu trabajo y recibe comentarios de tus compañeros y profesores.',
      'fr':
          'Explorez une variété de projets étudiants dans différentes catégories, partagez votre travail et recevez les commentaires de vos pairs et de vos enseignants',
      'sw':
          'Gundua miradi mbalimbali ya wanafunzi katika kategoria tofauti, shiriki kazi yako na upokee maoni kutoka kwa wenzako na walimu',
    },
    '2drvuhmg': {
      'en': 'Mission Statement',
      'ar': 'بيان المهمة',
      'es': 'Declaración de misión',
      'fr': 'Énoncé de mission',
      'sw': 'Taarifa ya Ujumbe',
    },
    'ia05q057': {
      'en':
          'To be the leading international School in Africa, transforming the Hearts, Minds, Bodies and Souls of tomorrow\'s leaders.',
      'ar':
          'أن نكون المدرسة الدولية الرائدة في أفريقيا، والتي تعمل على تحويل قلوب وعقول وأجساد وأرواح قادة الغد.',
      'es':
          'Ser la escuela internacional líder en África, transformando los corazones, las mentes, los cuerpos y las almas de los líderes del mañana.',
      'fr':
          'Être l’école internationale leader en Afrique, transformant les cœurs, les esprits, les corps et les âmes des dirigeants de demain.',
      'sw':
          'Kuwa Shule inayoongoza ya kimataifa barani Afrika, inayobadilisha Mioyo, Akili, Miili na Roho za viongozi wa kesho.',
    },
    '5q5cik48': {
      'en': 'Vision',
      'ar': 'رؤية',
      'es': 'Visión',
      'fr': 'Vision',
      'sw': 'Maono',
    },
    'itak83uc': {
      'en':
          'Seeking the highest for every individual with Christ as our guide.',
      'ar': 'السعي لتحقيق الأفضل لكل فرد مع المسيح كمرشد لنا.',
      'es':
          'Buscando lo máximo para cada individuo con Cristo como nuestro guía.',
      'fr':
          'Rechercher le plus haut pour chaque individu avec le Christ comme guide.',
      'sw':
          'Kutafuta yaliyo juu zaidi kwa kila mtu binafsi na Kristo kama kiongozi wetu.',
    },
    'hus0pjk0': {
      'en': 'Skip',
      'ar': 'يتخطى',
      'es': 'Saltar',
      'fr': 'Sauter',
      'sw': 'Ruka',
    },
    '3tja30tz': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'sw': 'Nyumbani',
    },
  },
  // Login
  {
    'ze3m37np': {
      'en': 'Turi Login',
      'ar': 'تسجيل الدخول',
      'es': 'Acceso',
      'fr': 'Se connecter',
      'sw': 'Ingia',
    },
    'm5qo8hnd': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
      'es': 'Correo electrónico',
      'fr': 'E-mail',
      'sw': 'Barua pepe',
    },
    'eefxbplv': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    'yikxp0nv': {
      'en': 'Password',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    '7v52ifuz': {
      'en': 'Remember me',
      'ar': 'تذكرنى',
      'es': 'Acuérdate de mí',
      'fr': 'Souviens-toi de moi',
      'sw': 'Nikumbuke',
    },
    'nflzaz0l': {
      'en': 'Sign in',
      'ar': 'تسجيل الدخول',
      'es': 'Iniciar sesión',
      'fr': 'Se connecter',
      'sw': 'Ingia',
    },
    '1d0ycpt5': {
      'en': 'Forgot the password?',
      'ar': 'نسيت كلمة المرور؟',
      'es': '¿Olvidaste la contraseña?',
      'fr': 'Mot de passe oublié ?',
      'sw': 'Umesahau nenosiri?',
    },
    'vpd2uinh': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
      'sw': 'Sehemu inahitajika',
    },
    'cf6o6r5k': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء اختيار خيار من القائمة المنسدلة',
      'es': 'Por favor, seleccione una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
      'sw': 'Tafadhali chagua chaguo kutoka kwenye menyu kunjuzi',
    },
    'sapcnpa8': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
      'sw': 'Sehemu inahitajika',
    },
    'qhxn38kh': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء اختيار خيار من القائمة المنسدلة',
      'es': 'Por favor, seleccione una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
      'sw': 'Tafadhali chagua chaguo kutoka kwenye menyu kunjuzi',
    },
    'pspy3emu': {
      'en': 'Login',
      'ar': 'تسجيل الدخول',
      'es': 'Acceso',
      'fr': 'Se connecter',
      'sw': 'Ingia',
    },
    'oh9swbkb': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
      'es': 'Correo electrónico',
      'fr': 'E-mail',
      'sw': 'Barua pepe',
    },
    'd0rhpyjv': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    'w5b5s9qo': {
      'en': 'Password',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    '735ncl8j': {
      'en': 'Remember me',
      'ar': 'تذكرنى',
      'es': 'Acuérdate de mí',
      'fr': 'Souviens-toi de moi',
      'sw': 'Nikumbuke',
    },
    'uo7tnbsi': {
      'en': 'Sign in',
      'ar': 'تسجيل الدخول',
      'es': 'Iniciar sesión',
      'fr': 'Se connecter',
      'sw': 'Ingia',
    },
    '7mse0knh': {
      'en': 'Forgot the password?',
      'ar': 'نسيت كلمة المرور؟',
      'es': '¿Olvidaste la contraseña?',
      'fr': 'Mot de passe oublié ?',
      'sw': 'Umesahau nenosiri?',
    },
    '4ekxafjp': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
      'sw': 'Sehemu inahitajika',
    },
    'sjqvwzeu': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء اختيار خيار من القائمة المنسدلة',
      'es': 'Por favor, seleccione una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
      'sw': 'Tafadhali chagua chaguo kutoka kwenye menyu kunjuzi',
    },
    'wuz1kp5a': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
      'sw': 'Sehemu inahitajika',
    },
    '8mls8xgr': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء اختيار خيار من القائمة المنسدلة',
      'es': 'Por favor, seleccione una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
      'sw': 'Tafadhali chagua chaguo kutoka kwenye menyu kunjuzi',
    },
    't312y3jm': {
      'en': 'Login',
      'ar': 'تسجيل الدخول',
      'es': 'Acceso',
      'fr': 'Se connecter',
      'sw': 'Ingia',
    },
    'rnhtnff8': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
      'es': 'Correo electrónico',
      'fr': 'E-mail',
      'sw': 'Barua pepe',
    },
    'eosbeduu': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    '1vhm6g9q': {
      'en': 'Password',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    'yr0c5j83': {
      'en': 'Remember me',
      'ar': 'تذكرنى',
      'es': 'Acuérdate de mí',
      'fr': 'Souviens-toi de moi',
      'sw': 'Nikumbuke',
    },
    'thg5yqot': {
      'en': 'Sign in',
      'ar': 'تسجيل الدخول',
      'es': 'Iniciar sesión',
      'fr': 'Se connecter',
      'sw': 'Ingia',
    },
    'zgduk5qu': {
      'en': 'Forgot the password?',
      'ar': 'نسيت كلمة المرور؟',
      'es': '¿Olvidaste la contraseña?',
      'fr': 'Mot de passe oublié ?',
      'sw': 'Umesahau nenosiri?',
    },
    'jc24qt69': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
      'sw': 'Sehemu inahitajika',
    },
    'v2wc6j0o': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء اختيار خيار من القائمة المنسدلة',
      'es': 'Por favor, seleccione una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
      'sw': 'Tafadhali chagua chaguo kutoka kwenye menyu kunjuzi',
    },
    '2a23tco4': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
      'sw': 'Sehemu inahitajika',
    },
    'fr3aoyz2': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء اختيار خيار من القائمة المنسدلة',
      'es': 'Por favor, seleccione una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
      'sw': 'Tafadhali chagua chaguo kutoka kwenye menyu kunjuzi',
    },
    'f4f5yys3': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'sw': 'Nyumbani',
    },
  },
  // onBoard_Profile
  {
    '91bw3rji': {
      'en': 'Complete Your Profile',
      'ar': 'أكمل ملفك الشخصي',
      'es': 'Completa tu perfil',
      'fr': 'Complétez votre profil',
      'sw': 'Kamilisha Wasifu Wako',
    },
    '0j9b3tya': {
      'en': 'Full Name',
      'ar': 'الاسم الكامل',
      'es': 'Nombre completo',
      'fr': 'Nom et prénom',
      'sw': 'Jina Kamili',
    },
    '6pd5svw3': {
      'en': 'User Name',
      'ar': 'اسم المستخدم',
      'es': 'Nombre de usuario',
      'fr': 'Nom d\'utilisateur',
      'sw': 'Jina la mtumiaji',
    },
    'jkvasdhi': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
      'es': 'Correo electrónico',
      'fr': 'E-mail',
      'sw': 'Barua pepe',
    },
    'wkhri8fk': {
      'en': 'Male',
      'ar': 'ذكر',
      'es': 'Masculino',
      'fr': 'Mâle',
      'sw': 'Mwanaume',
    },
    'oaisacjy': {
      'en': 'Female',
      'ar': 'أنثى',
      'es': 'Femenino',
      'fr': 'Femelle',
      'sw': 'Kike',
    },
    'r08pyo3b': {
      'en': 'Other',
      'ar': 'آخر',
      'es': 'Otro',
      'fr': 'Autre',
      'sw': 'Nyingine',
    },
    'tmuiwm99': {
      'en': 'Gender',
      'ar': 'جنس',
      'es': 'Género',
      'fr': 'Genre',
      'sw': 'Jinsia',
    },
    '5n8x2g4l': {
      'en': 'Search for an item...',
      'ar': 'البحث عن العنصر...',
      'es': 'Buscar un artículo...',
      'fr': 'Rechercher un article...',
      'sw': 'Tafuta kipengee...',
    },
    'om3iob1g': {
      'en': 'Bio',
      'ar': 'السيرة الذاتية',
      'es': 'Biografía',
      'fr': 'Biographie',
      'sw': 'Wasifu',
    },
    '9dyjpeqh': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
      'sw': 'Sehemu inahitajika',
    },
    'x0bohqc8': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء اختيار خيار من القائمة المنسدلة',
      'es': 'Por favor, seleccione una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
      'sw': 'Tafadhali chagua chaguo kutoka kwenye menyu kunjuzi',
    },
    'ndlygltm': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
      'sw': 'Sehemu inahitajika',
    },
    '64m1o5fr': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء اختيار خيار من القائمة المنسدلة',
      'es': 'Por favor, seleccione una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
      'sw': 'Tafadhali chagua chaguo kutoka kwenye menyu kunjuzi',
    },
    'qemubkgi': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
      'sw': 'Sehemu inahitajika',
    },
    '3tzewo4c': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء اختيار خيار من القائمة المنسدلة',
      'es': 'Por favor, seleccione una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
      'sw': 'Tafadhali chagua chaguo kutoka kwenye menyu kunjuzi',
    },
    'b1bjuo7w': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
      'sw': 'Sehemu inahitajika',
    },
    '2qey04bw': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء اختيار خيار من القائمة المنسدلة',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
      'sw': 'Tafadhali chagua chaguo kutoka kwenye menyu kunjuzi',
    },
    'qpeypoks': {
      'en': 'Continue',
      'ar': 'يكمل',
      'es': 'Continuar',
      'fr': 'Continuer',
      'sw': 'Endelea',
    },
    'lnb8l6m1': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'sw': 'Nyumbani',
    },
  },
  // ForgotPass
  {
    '77w38e6m': {
      'en': 'Forgot Password',
      'ar': 'هل نسيت كلمة السر',
      'es': 'Has olvidado tu contraseña',
      'fr': 'Mot de passe oublié',
      'sw': 'Umesahau Nenosiri',
    },
    '8xwi23a0': {
      'en': 'Select which contact details should we use to reset your password',
      'ar':
          'حدد تفاصيل الاتصال التي يجب أن نستخدمها لإعادة تعيين كلمة المرور الخاصة بك',
      'es':
          'Seleccione qué datos de contacto debemos utilizar para restablecer su contraseña',
      'fr':
          'Sélectionnez les coordonnées que nous devons utiliser pour réinitialiser votre mot de passe',
      'sw':
          'Chagua ni maelezo gani ya mawasiliano tunapaswa kutumia kuweka upya nenosiri lako',
    },
    'ax3mwrz0': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
      'es': 'Correo electrónico',
      'fr': 'E-mail',
      'sw': 'Barua pepe',
    },
    '0lpnh5xu': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
      'sw': 'Sehemu inahitajika',
    },
    '0qht8p3m': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء اختيار خيار من القائمة المنسدلة',
      'es': 'Por favor, seleccione una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
      'sw': 'Tafadhali chagua chaguo kutoka kwenye menyu kunjuzi',
    },
    '11bg6jt3': {
      'en': 'Select which contact details should we use to reset your password',
      'ar':
          'حدد تفاصيل الاتصال التي يجب أن نستخدمها لإعادة تعيين كلمة المرور الخاصة بك',
      'es':
          'Seleccione qué datos de contacto debemos utilizar para restablecer su contraseña',
      'fr':
          'Sélectionnez les coordonnées que nous devons utiliser pour réinitialiser votre mot de passe',
      'sw':
          'Chagua ni maelezo gani ya mawasiliano tunapaswa kutumia kuweka upya nenosiri lako',
    },
    '0w0bcik1': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
      'es': 'Correo electrónico',
      'fr': 'E-mail',
      'sw': 'Barua pepe',
    },
    '1eyd09a2': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
      'sw': 'Sehemu inahitajika',
    },
    'n5dia5r0': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء اختيار خيار من القائمة المنسدلة',
      'es': 'Por favor, seleccione una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
      'sw': 'Tafadhali chagua chaguo kutoka kwenye menyu kunjuzi',
    },
    're9lfyww': {
      'en': 'Select which contact details should we use to reset your password',
      'ar':
          'حدد تفاصيل الاتصال التي يجب أن نستخدمها لإعادة تعيين كلمة المرور الخاصة بك',
      'es':
          'Seleccione qué datos de contacto debemos utilizar para restablecer su contraseña',
      'fr':
          'Sélectionnez les coordonnées que nous devons utiliser pour réinitialiser votre mot de passe',
      'sw':
          'Chagua ni maelezo gani ya mawasiliano tunapaswa kutumia kuweka upya nenosiri lako',
    },
    'nh6dj66y': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
      'es': 'Correo electrónico',
      'fr': 'E-mail',
      'sw': 'Barua pepe',
    },
    'rp50w534': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
      'sw': 'Sehemu inahitajika',
    },
    'qf4zm582': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء اختيار خيار من القائمة المنسدلة',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
      'sw': 'Tafadhali chagua chaguo kutoka kwenye menyu kunjuzi',
    },
    '8nrbmp0g': {
      'en': 'Continue',
      'ar': 'يكمل',
      'es': 'Continuar',
      'fr': 'Continuer',
      'sw': 'Endelea',
    },
    'm4h4jnz9': {
      'en': 'Continue',
      'ar': 'يكمل',
      'es': 'Continuar',
      'fr': 'Continuer',
      'sw': 'Endelea',
    },
    '42pnql6x': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'sw': 'Nyumbani',
    },
  },
  // Home
  {
    'ucghgl2i': {
      'en': 'Welcome.',
      'ar': 'مرحباً.',
      'es': 'Bienvenido.',
      'fr': 'Accueillir.',
      'sw': 'Karibu.',
    },
    'p27evm8c': {
      'en': 'Search',
      'ar': 'يبحث',
      'es': 'Buscar',
      'fr': 'Recherche',
      'sw': 'Tafuta',
    },
    'lbdslgd2': {
      'en': 'School Initiatives',
      'ar': 'مبادرات المدرسة',
      'es': 'Iniciativas escolares',
      'fr': 'Initiatives scolaires',
      'sw': 'Mipango ya Shule',
    },
    '01ug56a5': {
      'en': 'See All',
      'ar': 'انظر الكل',
      'es': 'Ver todo',
      'fr': 'Tout voir',
      'sw': 'Tazama Yote',
    },
    '3sij1y1o': {
      'en': 'See All',
      'ar': 'انظر الكل',
      'es': 'Ver todo',
      'fr': 'Tout voir',
      'sw': 'Tazama Yote',
    },
    'o4957ied': {
      'en': 'Student Council',
      'ar': 'مجلس الطلاب',
      'es': 'Consejo estudiantil',
      'fr': 'Conseil des étudiants',
      'sw': 'Baraza la Wanafunzi',
    },
    '9go13jj7': {
      'en': 'Anti-Bullying',
      'ar': 'مكافحة التنمر',
      'es': 'Anti-bullying',
      'fr': 'Lutte contre l\'intimidation',
      'sw': 'Kupinga Uonevu',
    },
    'xucw9fi6': {
      'en': 'E-Safety',
      'ar': 'السلامة الإلكترونية',
      'es': 'Seguridad electrónica',
      'fr': 'Sécurité électronique',
      'sw': 'E-Usalama',
    },
    'vpfirjqr': {
      'en': 'Round Square',
      'ar': 'مربع دائري',
      'es': 'Cuadrado redondo',
      'fr': 'Rond Carré',
      'sw': 'Mraba wa pande zote',
    },
    'wfuqrhyk': {
      'en': 'Charity',
      'ar': 'صدقة',
      'es': 'Caridad',
      'fr': 'Charité',
      'sw': 'Hisani',
    },
    '3dmdiwiv': {
      'en': 'Mental Health',
      'ar': 'الصحة العقلية',
      'es': 'Salud mental',
      'fr': 'Santé mentale',
      'sw': 'Afya ya Akili',
    },
    '3znc0wo2': {
      'en': 'Contraband',
      'ar': 'التهريب',
      'es': 'Contrabando',
      'fr': 'Contrebande',
      'sw': 'Usafirishaji haramu',
    },
    'uxrsau31': {
      'en': 'Prefects',
      'ar': 'الولاة',
      'es': 'Prefectos',
      'fr': 'Préfets',
      'sw': 'Wakuu',
    },
    'vrtk1u2f': {
      'en': 'Prefects Team',
      'ar': 'فريق الولاة',
      'es': 'Equipo de prefectos',
      'fr': 'Equipe des préfets',
      'sw': 'Timu ya Prefects',
    },
    'g0a7bh29': {
      'en': 'Prefects',
      'ar': 'الولاة',
      'es': 'Prefectos',
      'fr': 'Préfets',
      'sw': 'Wakuu',
    },
    'xnpo2tqf': {
      'en': 'Faith Factor',
      'ar': 'عامل الإيمان',
      'es': 'Factor fe',
      'fr': 'Facteur de foi',
      'sw': 'Sababu ya Imani',
    },
    'e718124z': {
      'en': 'Faith Factor Committee',
      'ar': 'لجنة عامل الإيمان',
      'es': 'Comité del factor fe',
      'fr': 'Comité du facteur foi',
      'sw': 'Kamati ya Mambo ya Imani',
    },
    'zuqx9bs7': {
      'en': 'Faith Factor',
      'ar': 'عامل الإيمان',
      'es': 'Factor fe',
      'fr': 'Facteur de foi',
      'sw': 'Sababu ya Imani',
    },
    'xs9mbtdm': {
      'en': 'Sustainability',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    '2v9gqm9i': {
      'en': 'Sustainability Committee',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    '3ziszsmh': {
      'en': 'Sustainability',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    'ua2v5an4': {
      'en': 'Library',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    'koxavsn3': {
      'en': 'Library Committee',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    'ny9lepbw': {
      'en': 'Library',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    'aszp23yf': {
      'en': 'Most Recent',
      'ar': 'الأحدث',
      'es': 'Lo más reciente',
      'fr': 'Le plus récent',
      'sw': 'Hivi Karibuni',
    },
    'ipp5knbn': {
      'en': 'See All',
      'ar': 'انظر الكل',
      'es': 'Ver todo',
      'fr': 'Tout voir',
      'sw': 'Tazama Yote',
    },
    '0skwsop6': {
      'en': 'All',
      'ar': 'الجميع',
      'es': 'Todo',
      'fr': 'Tous',
      'sw': 'Wote',
    },
    'c9kfadko': {
      'en': 'Cloths',
      'ar': 'الملابس',
      'es': 'Paños',
      'fr': 'Chiffons',
      'sw': 'Nguo',
    },
    'unlzowsm': {
      'en': 'Shoes',
      'ar': 'أحذية',
      'es': 'Zapatos',
      'fr': 'Chaussures',
      'sw': 'Viatu',
    },
    '06oiemum': {
      'en': 'House',
      'ar': 'منزل',
      'es': 'Casa',
      'fr': 'Maison',
      'sw': 'Nyumba',
    },
    'uruostoc': {
      'en': 'All',
      'ar': 'الجميع',
      'es': 'Todo',
      'fr': 'Tous',
      'sw': 'Wote',
    },
    'ng3f0im0': {
      'en': 'Liked Projects',
      'ar': 'المشاريع المفضلة',
      'es': 'Proyectos que me gustaron',
      'fr': 'Projets aimés',
      'sw': 'Miradi Iliyopendwa',
    },
    'q2qulga1': {
      'en': 'See All',
      'ar': 'انظر الكل',
      'es': 'Ver todo',
      'fr': 'Tout voir',
      'sw': 'Tazama Yote',
    },
    'dxm0v6yd': {
      'en': 'All',
      'ar': 'الجميع',
      'es': 'Todo',
      'fr': 'Tous',
      'sw': 'Wote',
    },
    '3olt7l6r': {
      'en': 'Cloths',
      'ar': 'الملابس',
      'es': 'Paños',
      'fr': 'Chiffons',
      'sw': 'Nguo',
    },
    'ro50qw2v': {
      'en': 'Shoes',
      'ar': 'أحذية',
      'es': 'Zapatos',
      'fr': 'Chaussures',
      'sw': 'Viatu',
    },
    '718h6d44': {
      'en': 'House',
      'ar': 'منزل',
      'es': 'Casa',
      'fr': 'Maison',
      'sw': 'Nyumba',
    },
    'pwhldtcf': {
      'en': 'All',
      'ar': 'الجميع',
      'es': 'Todo',
      'fr': 'Tous',
      'sw': 'Wote',
    },
    'xtinlnl2': {
      'en': 'Search',
      'ar': 'يبحث',
      'es': 'Buscar',
      'fr': 'Recherche',
      'sw': 'Tafuta',
    },
    'mqvueu06': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'sw': 'Nyumbani',
    },
  },
  // Bookmark
  {
    '8v6q167c': {
      'en': 'Bookmarked Projects',
      'ar': 'المشاريع التي تم وضع إشارة مرجعية عليها',
      'es': 'Proyectos marcados como favoritos',
      'fr': 'Projets marqués d\'un signet',
      'sw': 'Miradi Iliyoalamishwa',
    },
    'yy5gzy0a': {
      'en': 'Add Project',
      'ar': 'إضافة مشروع',
      'es': 'Agregar proyecto',
      'fr': 'Ajouter un projet',
      'sw': 'Ongeza Mradi',
    },
    'm0wx4dh4': {
      'en': 'Cart',
      'ar': 'العربة',
      'es': 'Carro',
      'fr': 'Panier',
      'sw': 'Mkokoteni',
    },
  },
  // Notifications
  {
    '03vq7asq': {
      'en': 'Notifications',
      'ar': 'إشعارات',
      'es': 'Notificaciones',
      'fr': 'Notifications',
      'sw': 'Arifa',
    },
    'gnsmzrop': {
      'en': 'New',
      'ar': 'جديد',
      'es': 'Nuevo',
      'fr': 'Nouveau',
      'sw': 'Mpya',
    },
    'z5cmvjlf': {
      'en': 'Seen',
      'ar': 'مرئي',
      'es': 'Visto',
      'fr': 'Vu',
      'sw': 'Imeonekana',
    },
    'mk8tsw4k': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'sw': 'Nyumbani',
    },
  },
  // Favourites
  {
    '62s61p38': {
      'en': 'My Liked Committees',
      'ar': 'اللجان المفضلة لدي',
      'es': 'Mis comités favoritos',
      'fr': 'Mes comités préférés',
      'sw': 'Kamati Ninazozipenda',
    },
    'eh0ixqg8': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'sw': 'Nyumbani',
    },
  },
  // Committees
  {
    'h7pm8ha0': {
      'en': 'Committees',
      'ar': 'اللجان',
      'es': 'Comités',
      'fr': 'Comités',
      'sw': 'Kamati',
    },
    'drtfgb0f': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'sw': 'Nyumbani',
    },
  },
  // Projects
  {
    'j4ql5ja1': {
      'en': 'All',
      'ar': 'الجميع',
      'es': 'Todo',
      'fr': 'Tous',
      'sw': 'Wote',
    },
    'cbrfrqgs': {
      'en': 'Cloths',
      'ar': 'الملابس',
      'es': 'Paños',
      'fr': 'Chiffons',
      'sw': 'Nguo',
    },
    'ep1xdj7s': {
      'en': 'Shoes',
      'ar': 'أحذية',
      'es': 'Zapatos',
      'fr': 'Chaussures',
      'sw': 'Viatu',
    },
    'tzt6shbw': {
      'en': 'House',
      'ar': 'منزل',
      'es': 'Casa',
      'fr': 'Maison',
      'sw': 'Nyumba',
    },
    'mg686zk8': {
      'en': 'All',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    'rjma57fn': {
      'en': 'Cloths',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    'vtpupow4': {
      'en': 'Shoes',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    'umbn54z7': {
      'en': 'House',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    '8upw0qut': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'sw': 'Nyumbani',
    },
  },
  // Search
  {
    '0qzixbfu': {
      'en': 'Search in projects',
      'ar': 'البحث في المشاريع',
      'es': 'Buscar en proyectos',
      'fr': 'Rechercher dans les projets',
      'sw': 'Tafuta katika miradi',
    },
    'j78klw2g': {
      'en': 'Search',
      'ar': 'يبحث',
      'es': 'Buscar',
      'fr': 'Recherche',
      'sw': 'Tafuta',
    },
    '2i311bt7': {
      'en': 'Clear',
      'ar': 'واضح',
      'es': 'Claro',
      'fr': 'Clair',
      'sw': 'Wazi',
    },
    'u2ud0w1d': {
      'en': 'Recent',
      'ar': 'مؤخرًا',
      'es': 'Reciente',
      'fr': 'Récent',
      'sw': 'Hivi karibuni',
    },
    'fovdu1w3': {
      'en': 'Clear All',
      'ar': 'مسح الكل',
      'es': 'Limpiar todo',
      'fr': 'Tout effacer',
      'sw': 'Futa Zote',
    },
    'ja6kvgid': {
      'en': 'Set Silter',
      'ar': 'مجموعة سيلتر',
      'es': 'Conjunto Silter',
      'fr': 'Ensemble Silter',
      'sw': 'Weka Silter',
    },
    'w1d1a58b': {
      'en': 'Categories',
      'ar': 'فئات',
      'es': 'Categorías',
      'fr': 'Catégories',
      'sw': 'Kategoria',
    },
    'uowa8nmy': {
      'en': 'All',
      'ar': 'الجميع',
      'es': 'Todo',
      'fr': 'Tous',
      'sw': 'Wote',
    },
    'w57psrgq': {
      'en': 'Cloths',
      'ar': 'الملابس',
      'es': 'Paños',
      'fr': 'Chiffons',
      'sw': 'Nguo',
    },
    'p7nrhsmv': {
      'en': 'Shoes',
      'ar': 'أحذية',
      'es': 'Zapatos',
      'fr': 'Chaussures',
      'sw': 'Viatu',
    },
    'jx7t74kq': {
      'en': 'House',
      'ar': 'منزل',
      'es': 'Casa',
      'fr': 'Maison',
      'sw': 'Nyumba',
    },
    'ex9mvks4': {
      'en': 'Price Range',
      'ar': 'نطاق السعر',
      'es': 'Gama de precios',
      'fr': 'Gamme de prix',
      'sw': 'Kiwango cha Bei',
    },
    'saebe8dt': {
      'en': ' Bigger than',
      'ar': 'أكبر من',
      'es': 'Más grande que',
      'fr': 'Plus grand que',
      'sw': 'Kubwa kuliko',
    },
    'gb5tjvja': {
      'en': 'Rating',
      'ar': 'تصنيف',
      'es': 'Clasificación',
      'fr': 'Notation',
      'sw': 'Ukadiriaji',
    },
    '6he5ti4q': {
      'en': 'Reset',
      'ar': 'إعادة ضبط',
      'es': 'Reiniciar',
      'fr': 'Réinitialiser',
      'sw': 'Weka upya',
    },
    'i61rorb6': {
      'en': 'Apply',
      'ar': 'يتقدم',
      'es': 'Aplicar',
      'fr': 'Appliquer',
      'sw': 'Omba',
    },
    '5xuhsyxb': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'sw': 'Nyumbani',
    },
  },
  // Detail
  {
    'o5wkoto8': {
      'en': 'Description',
      'ar': 'وصف',
      'es': 'Descripción',
      'fr': 'Description',
      'sw': 'Maelezo',
    },
    't4bmaz0f': {
      'en': 'Committee Leads',
      'ar': 'قادة المشروع',
      'es': 'Líderes de proyectos',
      'fr': 'Chefs de projet',
      'sw': 'Viongozi wa Mradi',
    },
    '28n06hrc': {
      'en': 'Members',
      'ar': 'أعضاء',
      'es': 'Miembros',
      'fr': 'Membres',
      'sw': 'Wanachama',
    },
    'xic97283': {
      'en': 'Last 3 comments',
      'ar': 'آخر 3 تعليقات',
      'es': 'Últimos 3 comentarios',
      'fr': 'Les 3 derniers commentaires',
      'sw': 'Maoni 3 ya mwisho',
    },
    'gqq3y3bn': {
      'en': 'See All Comment',
      'ar': 'انظر كل التعليقات',
      'es': 'Ver todos los comentarios',
      'fr': 'Voir tous les commentaires',
      'sw': 'Tazama Maoni Yote',
    },
    'rp699b33': {
      'en': 'Give Comment',
      'ar': 'أعطي مراجعة',
      'es': 'Dar reseña',
      'fr': 'Donner un avis',
      'sw': 'Toa Tathmini',
    },
    'ks32533k': {
      'en': 'Bookmark Project',
      'ar': 'مشروع الإشارة المرجعية',
      'es': 'Proyecto de marcadores',
      'fr': 'Projet de marque-page',
      'sw': 'Alamisho Mradi',
    },
    'oi35mceo': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'sw': 'Nyumbani',
    },
  },
  // comment
  {
    'zcp7cypr': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'sw': 'Nyumbani',
    },
  },
  // Profile
  {
    'd7u51fkx': {
      'en': 'Edit Profile',
      'ar': 'تعديل الملف الشخصي',
      'es': 'Editar perfil',
      'fr': 'Modifier le profil',
      'sw': 'Badilisha Wasifu',
    },
    'odkvvo5s': {
      'en': 'Change Password',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    'wdaxbt53': {
      'en': 'Notification Settings',
      'ar': 'إعدادات الإشعارات',
      'es': 'Configuración de notificaciones',
      'fr': 'Paramètres de notification',
      'sw': 'Mipangilio ya Arifa',
    },
    'xavekhvr': {
      'en': 'Privacy Policy',
      'ar': 'سياسة الخصوصية',
      'es': 'política de privacidad',
      'fr': 'politique de confidentialité',
      'sw': 'Sera ya Faragha',
    },
    'eg8f0kw7': {
      'en': 'Help Center',
      'ar': 'مركز المساعدة',
      'es': 'Centro de ayuda',
      'fr': 'Centre d\'aide',
      'sw': 'Kituo cha Usaidizi',
    },
    're3dkt1r': {
      'en': 'Language',
      'ar': 'لغة',
      'es': 'Idioma',
      'fr': 'Langue',
      'sw': 'Lugha',
    },
    'gho3sizt': {
      'en': 'Dark Mode',
      'ar': 'الوضع المظلم',
      'es': 'Modo oscuro',
      'fr': 'Mode sombre',
      'sw': 'Hali ya Giza',
    },
    'v2ce8oo7': {
      'en': 'Logout',
      'ar': 'تسجيل الخروج',
      'es': 'Cerrar sesión',
      'fr': 'Déconnexion',
      'sw': 'Ondoka',
    },
    '0uk7gol4': {
      'en': 'Version 1.0.01 ',
      'ar': 'الإصدار 1.0.01',
      'es': 'Versión 1.0.01',
      'fr': 'Version 1.0.01',
      'sw': 'Toleo la 1.0.01',
    },
    'ksujdsg6': {
      'en': 'Profile',
      'ar': 'حساب تعريفي',
      'es': 'Perfil',
      'fr': 'Profil',
      'sw': 'Wasifu',
    },
  },
  // ProfileEdit
  {
    'tottirw2': {
      'en': 'Edit Profile',
      'ar': 'تعديل الملف الشخصي',
      'es': 'Editar perfil',
      'fr': 'Modifier le profil',
      'sw': 'Badilisha Wasifu',
    },
    'jusrtbjm': {
      'en': 'Full Name',
      'ar': 'الاسم الكامل',
      'es': 'Nombre completo',
      'fr': 'Nom et prénom',
      'sw': 'Jina Kamili',
    },
    'pzwy4ayf': {
      'en': 'User Name',
      'ar': 'اسم المستخدم',
      'es': 'Nombre de usuario',
      'fr': 'Nom d\'utilisateur',
      'sw': 'Jina la mtumiaji',
    },
    'aekq22u1': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
      'es': 'Correo electrónico',
      'fr': 'E-mail',
      'sw': 'Barua pepe',
    },
    'ymwhud55': {
      'en': 'Male',
      'ar': 'ذكر',
      'es': 'Masculino',
      'fr': 'Mâle',
      'sw': 'Mwanaume',
    },
    'xywk2uk2': {
      'en': 'Female',
      'ar': 'أنثى',
      'es': 'Femenino',
      'fr': 'Femelle',
      'sw': 'Kike',
    },
    'k4opv0hy': {
      'en': 'Other',
      'ar': 'آخر',
      'es': 'Otro',
      'fr': 'Autre',
      'sw': 'Nyingine',
    },
    'lqwznadd': {
      'en': 'Gender',
      'ar': 'جنس',
      'es': 'Género',
      'fr': 'Genre',
      'sw': 'Jinsia',
    },
    'exh54exr': {
      'en': 'Search for an item...',
      'ar': 'البحث عن العنصر...',
      'es': 'Buscar un artículo...',
      'fr': 'Rechercher un article...',
      'sw': 'Tafuta kipengee...',
    },
    'gort5wjn': {
      'en': 'Bio',
      'ar': 'السيرة الذاتية',
      'es': 'Biografía',
      'fr': 'Biographie',
      'sw': 'Wasifu',
    },
    'luoj2o3j': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
      'sw': 'Sehemu inahitajika',
    },
    'cm344mut': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء اختيار خيار من القائمة المنسدلة',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
      'sw': 'Tafadhali chagua chaguo kutoka kwenye menyu kunjuzi',
    },
    'w3pxefrr': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
      'sw': 'Sehemu inahitajika',
    },
    'imu046hc': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء اختيار خيار من القائمة المنسدلة',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
      'sw': 'Tafadhali chagua chaguo kutoka kwenye menyu kunjuzi',
    },
    'q6q7tf4d': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
      'sw': 'Sehemu inahitajika',
    },
    't1u4ox74': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء اختيار خيار من القائمة المنسدلة',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
      'sw': 'Tafadhali chagua chaguo kutoka kwenye menyu kunjuzi',
    },
    '9imci6ne': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
      'sw': 'Sehemu inahitajika',
    },
    'fm7iixkz': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء اختيار خيار من القائمة المنسدلة',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
      'sw': 'Tafadhali chagua chaguo kutoka kwenye menyu kunjuzi',
    },
    'x0wogarh': {
      'en': 'Update',
      'ar': 'تحديث',
      'es': 'Actualizar',
      'fr': 'Mise à jour',
      'sw': 'Sasisha',
    },
    '8gdcsc2y': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'sw': 'Nyumbani',
    },
  },
  // SettingNotification
  {
    '5o6xxes2': {
      'en': 'Notification',
      'ar': 'إشعار',
      'es': 'Notificación',
      'fr': 'Notification',
      'sw': 'Arifa',
    },
    'u75lm5yr': {
      'en': 'Configure Notification',
      'ar': 'تكوين الإشعارات',
      'es': 'Configurar Notificación',
      'fr': 'Configurer la notification',
      'sw': 'Sanidi Arifa',
    },
    'bmzfuj0j': {
      'en': 'General Notification',
      'ar': 'إشعار عام',
      'es': 'Notificación general',
      'fr': 'Avis général',
      'sw': 'Taarifa ya Jumla',
    },
    '3pb2p19r': {
      'en': 'Sound',
      'ar': 'صوت',
      'es': 'Sonido',
      'fr': 'Son',
      'sw': 'Sauti',
    },
    'sv3dtx8s': {
      'en': 'Vibrate',
      'ar': 'تذبذب',
      'es': 'Vibrar',
      'fr': 'Vibrer',
      'sw': 'Tetema',
    },
    '88hrozp4': {
      'en': 'New Project',
      'ar': 'مشروع جديد',
      'es': 'Nuevo proyecto',
      'fr': 'Nouveau projet',
      'sw': 'Mradi Mpya',
    },
    'chd8b0nf': {
      'en': 'App Updates',
      'ar': 'تحديثات التطبيق',
      'es': 'Actualizaciones de la aplicación',
      'fr': 'Mises à jour de l\'application',
      'sw': 'Masasisho ya Programu',
    },
    '05bcm3xa': {
      'en': 'New Posts',
      'ar': 'المشاركات الجديدة',
      'es': 'Nuevas publicaciones',
      'fr': 'Nouveaux articles',
      'sw': 'Machapisho Mapya',
    },
    'yojei26s': {
      'en': 'New Tips Available',
      'ar': 'نصائح جديدة متاحة',
      'es': 'Nuevos consejos disponibles',
      'fr': 'Nouveaux conseils disponibles',
      'sw': 'Vidokezo Vipya Vinavyopatikana',
    },
    'k1bv65hz': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'sw': 'Nyumbani',
    },
  },
  // Language
  {
    '5fhgfbyz': {
      'en': 'Language',
      'ar': 'لغة',
      'es': 'Idioma',
      'fr': 'Langue',
      'sw': 'Lugha',
    },
    'ekmdo5ts': {
      'en': 'Change Language',
      'ar': 'تغيير اللغة',
      'es': 'Cambiar idioma',
      'fr': 'Changer la langue',
      'sw': 'Badilisha Lugha',
    },
    'c49dobms': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'sw': 'Nyumbani',
    },
  },
  // PrivacyPolicy
  {
    '04ty6g4f': {
      'en': 'Privacy Policy',
      'ar': 'سياسة الخصوصية',
      'es': 'política de privacidad',
      'fr': 'politique de confidentialité',
      'sw': 'Sera ya Faragha',
    },
    '1udz1udi': {
      'en':
          'Effective Date: September 14th 2024\n\n1. Introduction\n\nTPS Hub is committed to protecting your privacy. This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you use our mobile application (\"TPS Hub\"). Please read this policy carefully. If you do not agree with the terms of this policy, please do not use the App.\n\n2. Information We Collect\n\nWe may collect the following types of information:\n\nPersonal Information: Information such as your name, email address, and any other information you voluntarily provide when you register for an account or communicate with us.\n\nUsage Data: Information about your interactions with the App, such as the pages you visit, the time spent on each page, and other usage statistics.\n\nDevice Information: Information about your device, including the device type, operating system, and unique device identifiers.\n\n3. How We Use Your Information\n\nWe use the information we collect for various purposes, including:\n\nTo provide and maintain the App\n\nTo improve and personalize your experience\n\nTo communicate with you, including sending updates and responding to inquiries\n\nTo monitor and analyze usage and trends to improve the App\n\nTo comply with legal obligations and protect our rights\n\n4. Sharing Your Information\n\nWe may share your information with:\n\nService Providers: Third parties who perform services on our behalf, such as hosting and data analysis.\n\nLegal Requirements: When required by law or to protect our rights and safety or the rights and safety of others.\n\n5. Security of Your Information\n\nWe take reasonable measures to protect your information from unauthorized access, use, or disclosure. However, no method of transmission over the internet or electronic storage is 100% secure, and we cannot guarantee absolute security.\n\n6. Your Choices\n\nYou have the following choices regarding your information:\n\nAccess and Update: You can access and update your personal information through your account settings.\n\nOpt-Out: You can opt out of receiving promotional communications from us by following the unsubscribe instructions provided in the communication.\n\n7. Children\'s Privacy\n\nTPS Hub is intended for use by students and members of our school community. We do not knowingly collect personal information from children under the age of 13 without parental consent. If we become aware that we have collected personal information from a child under 13 without verification of parental consent, we will take steps to remove that information.\n\n8. Changes to This Privacy Policy\n\nWe may update this Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page and updating the effective date. You are advised to review this Privacy Policy periodically for any changes.\n\n9. Contact Us\n\nIf you have any questions about this Privacy Policy, please contact us at:\n\nsupport@tpshub.com',
      'ar':
          'تاريخ السريان: 14 سبتمبر 2024\n\n1. المقدمة\n\nتلتزم TPS Hub بحماية خصوصيتك. تشرح سياسة الخصوصية هذه كيفية جمع معلوماتك واستخدامها والإفصاح عنها وحمايتها عند استخدام تطبيق الهاتف المحمول الخاص بنا (\"TPS Hub\"). يرجى قراءة هذه السياسة بعناية. إذا كنت لا توافق على شروط هذه السياسة، يرجى عدم استخدام التطبيق.\n\n2. المعلومات التي نجمعها\n\nقد نجمع الأنواع التالية من المعلومات:\n\nالمعلومات الشخصية: معلومات مثل اسمك وعنوان بريدك الإلكتروني وأي معلومات أخرى تقدمها طواعية عند التسجيل للحصول على حساب أو التواصل معنا.\n\nبيانات الاستخدام: معلومات حول تفاعلاتك مع التطبيق، مثل الصفحات التي تزورها والوقت الذي تقضيه في كل صفحة وإحصائيات الاستخدام الأخرى.\n\nمعلومات الجهاز: معلومات حول جهازك، بما في ذلك نوع الجهاز ونظام التشغيل ومعرفات الجهاز الفريدة.\n\n3. كيف نستخدم معلوماتك\n\nنستخدم المعلومات التي نجمعها لأغراض مختلفة، بما في ذلك:\n\nلتوفير التطبيق وصيانته\n\nلتحسين وتخصيص تجربتك\n\nللتواصل معك، بما في ذلك إرسال التحديثات والرد على الاستفسارات\n\nلمراقبة وتحليل الاستخدام والاتجاهات لتحسين التطبيق\n\nللامتثال للالتزامات القانونية وحماية حقوقنا\n\n4. مشاركة معلوماتك\n\nقد نشارك معلوماتك مع:\n\nمقدمي الخدمة: أطراف ثالثة تؤدي خدمات نيابة عنا، مثل الاستضافة وتحليل البيانات.\n\nالمتطلبات القانونية: عندما يقتضي القانون ذلك أو لحماية حقوقنا وسلامتنا أو حقوق وسلامة الآخرين.\n\n5. أمان معلوماتك\n\nنتخذ تدابير معقولة لحماية معلوماتك من الوصول غير المصرح به أو الاستخدام أو الكشف عنها. ومع ذلك، لا توجد طريقة نقل عبر الإنترنت أو التخزين الإلكتروني آمنة بنسبة 100%، ولا يمكننا ضمان الأمان المطلق.\n\n6. خياراتك\n\nلديك الخيارات التالية فيما يتعلق بمعلوماتك:\n\nالوصول والتحديث: يمكنك الوصول إلى معلوماتك الشخصية وتحديثها من خلال إعدادات حسابك.\n\nإلغاء الاشتراك: يمكنك إلغاء الاشتراك في تلقي الرسائل الترويجية منا باتباع تعليمات إلغاء الاشتراك الواردة في الرسالة.\n\n7. خصوصية الأطفال\n\nيُقصد من TPS Hub أن يستخدمه الطلاب وأعضاء مجتمع مدرستنا. لا نجمع عن علم معلومات شخصية من الأطفال دون سن 13 عامًا دون موافقة الوالدين. إذا علمنا أننا جمعنا معلومات شخصية من طفل دون سن 13 عامًا دون التحقق من موافقة الوالدين، فسنتخذ خطوات لإزالة هذه المعلومات.\n\n8. التغييرات على سياسة الخصوصية هذه\n\nقد نقوم بتحديث سياسة الخصوصية هذه من وقت لآخر. وسنخطرك بأي تغييرات من خلال نشر سياسة الخصوصية الجديدة على هذه الصفحة وتحديث تاريخ السريان. ننصحك بمراجعة سياسة الخصوصية هذه بشكل دوري لمعرفة أي تغييرات.\n\n9. اتصل بنا\n\nإذا كانت لديك أي أسئلة حول سياسة الخصوصية هذه، يرجى الاتصال بنا على:\n\nsupport@tpshub.com',
      'es':
          'Fecha de entrada en vigor: 14 de septiembre de 2024\n\n1. Introducción\n\nTPS Hub se compromete a proteger su privacidad. Esta Política de privacidad explica cómo recopilamos, usamos, divulgamos y salvaguardamos su información cuando utiliza nuestra aplicación móvil (\"TPS Hub\"). Lea esta política detenidamente. Si no está de acuerdo con los términos de esta política, no utilice la aplicación.\n\n2. Información que recopilamos\n\nPodemos recopilar los siguientes tipos de información:\n\nInformación personal: información como su nombre, dirección de correo electrónico y cualquier otra información que proporcione voluntariamente cuando se registra para una cuenta o se comunica con nosotros.\n\nDatos de uso: información sobre sus interacciones con la aplicación, como las páginas que visita, el tiempo que pasa en cada página y otras estadísticas de uso.\n\nInformación del dispositivo: información sobre su dispositivo, incluido el tipo de dispositivo, el sistema operativo y los identificadores únicos del dispositivo.\n\n3. Cómo usamos su información\n\nUsamos la información que recopilamos para diversos fines, entre ellos:\n\nPara proporcionar y mantener la aplicación\n\nPara mejorar y personalizar su experiencia\n\nPara comunicarnos con usted, incluido el envío de actualizaciones y la respuesta a consultas\n\nPara monitorear y analizar el uso y las tendencias para mejorar la aplicación\n\nPara cumplir con las obligaciones legales y proteger nuestros derechos\n\n4. Cómo compartimos su información\n\nPodemos compartir su información con:\n\nProveedores de servicios: terceros que realizan servicios en nuestro nombre, como alojamiento y análisis de datos.\n\nRequisitos legales: cuando lo exija la ley o para proteger nuestros derechos y seguridad o los derechos y seguridad de otros.\n\n5. Seguridad de su información\n\nTomamos medidas razonables para proteger su información del acceso, uso o divulgación no autorizados. Sin embargo, ningún método de transmisión a través de Internet o almacenamiento electrónico es 100 % seguro y no podemos garantizar una seguridad absoluta.\n\n6. Sus opciones\n\nTiene las siguientes opciones con respecto a su información:\n\nAcceso y actualización: puede acceder y actualizar su información personal a través de la configuración de su cuenta.\n\nExclusión voluntaria: Puede optar por no recibir comunicaciones promocionales nuestras siguiendo las instrucciones para cancelar la suscripción que se proporcionan en la comunicación.\n\n7. Privacidad de los niños\n\nTPS Hub está destinado a ser utilizado por estudiantes y miembros de nuestra comunidad escolar. No recopilamos deliberadamente información personal de niños menores de 13 años sin el consentimiento de los padres. Si nos damos cuenta de que hemos recopilado información personal de un niño menor de 13 años sin verificar el consentimiento de los padres, tomaremos medidas para eliminar esa información.\n\n8. Cambios a esta Política de privacidad\n\nPodemos actualizar esta Política de privacidad de vez en cuando. Le notificaremos sobre cualquier cambio publicando la nueva Política de privacidad en esta página y actualizando la fecha de entrada en vigencia. Se recomienda revisar esta Política de privacidad periódicamente para ver si hay cambios.\n\n9. Contáctenos\n\nSi tiene alguna pregunta sobre esta Política de privacidad, contáctenos a:\n\nsupport@tpshub.com',
      'fr':
          'Date d\'entrée en vigueur : 14 septembre 2024\n\n1. Introduction\n\nTPS Hub s\'engage à protéger votre vie privée. Cette politique de confidentialité explique comment nous collectons, utilisons, divulguons et protégeons vos informations lorsque vous utilisez notre application mobile (« TPS Hub »). Veuillez lire attentivement cette politique. Si vous n\'êtes pas d\'accord avec les termes de cette politique, veuillez ne pas utiliser l\'application.\n\n2. Informations que nous collectons\n\nNous pouvons collecter les types d\'informations suivants :\n\nInformations personnelles : informations telles que votre nom, votre adresse e-mail et toute autre information que vous fournissez volontairement lorsque vous créez un compte ou communiquez avec nous.\n\nDonnées d\'utilisation : informations sur vos interactions avec l\'application, telles que les pages que vous visitez, le temps passé sur chaque page et d\'autres statistiques d\'utilisation.\n\nInformations sur l\'appareil : informations sur votre appareil, y compris le type d\'appareil, le système d\'exploitation et les identifiants uniques de l\'appareil.\n\n3. Comment nous utilisons vos informations\n\nNous utilisons les informations que nous collectons à diverses fins, notamment :\n\nPour fournir et maintenir l\'application\n\nPour améliorer et personnaliser votre expérience\n\nPour communiquer avec vous, notamment en vous envoyant des mises à jour et en répondant à vos demandes\n\nPour surveiller et analyser l\'utilisation et les tendances afin d\'améliorer l\'application\n\nPour nous conformer aux obligations légales et protéger nos droits\n\n4. Partage de vos informations\n\nNous pouvons partager vos informations avec :\n\nFournisseurs de services : tiers qui effectuent des services en notre nom, tels que l\'hébergement et l\'analyse de données.\n\nExigences légales : lorsque la loi l\'exige ou pour protéger nos droits et notre sécurité ou les droits et la sécurité d\'autrui.\n\n5. Sécurité de vos informations\n\nNous prenons des mesures raisonnables pour protéger vos informations contre tout accès, utilisation ou divulgation non autorisés. Cependant, aucune méthode de transmission sur Internet ou de stockage électronique n\'est sûre à 100 % et nous ne pouvons pas garantir une sécurité absolue.\n\n6. Vos choix\n\nVous avez les choix suivants concernant vos informations :\n\nAccès et mise à jour : vous pouvez accéder à vos informations personnelles et les mettre à jour via les paramètres de votre compte.\n\nDésinscription : vous pouvez choisir de ne plus recevoir de communications promotionnelles de notre part en suivant les instructions de désabonnement fournies dans la communication.\n\n7. Confidentialité des enfants\n\nTPS Hub est destiné à être utilisé par les étudiants et les membres de notre communauté scolaire. Nous ne collectons pas sciemment d\'informations personnelles auprès d\'enfants de moins de 13 ans sans le consentement des parents. Si nous apprenons que nous avons collecté des informations personnelles auprès d\'un enfant de moins de 13 ans sans vérification du consentement des parents, nous prendrons des mesures pour supprimer ces informations.\n\n8. Modifications de cette politique de confidentialité\n\nNous pouvons mettre à jour cette politique de confidentialité de temps à autre. Nous vous informerons de tout changement en publiant la nouvelle politique de confidentialité sur cette page et en mettant à jour la date d\'entrée en vigueur. Il vous est conseillé de consulter régulièrement cette politique de confidentialité pour tout changement.\n\n9. Nous contacter\n\nSi vous avez des questions sur cette politique de confidentialité, veuillez nous contacter à :\n\nsupport@tpshub.com',
      'sw':
          'Tarehe ya Kutumika: Septemba 14, 2024\n\n1. Utangulizi\n\nTPS Hub imejitolea kulinda faragha yako. Sera hii ya Faragha inafafanua jinsi tunavyokusanya, kutumia, kufichua na kulinda maelezo yako unapotumia programu yetu ya simu (\"TPS Hub\"). Tafadhali soma sera hii kwa makini. Ikiwa hukubaliani na masharti ya sera hii, tafadhali usitumie Programu.\n\n2. Taarifa Tunazokusanya\n\nTunaweza kukusanya aina zifuatazo za habari:\n\nTaarifa za Kibinafsi: Taarifa kama vile jina lako, anwani ya barua pepe, na taarifa nyingine yoyote unayotoa kwa hiari unapojiandikisha kwa ajili ya akaunti au kuwasiliana nasi.\n\nData ya Matumizi: Maelezo kuhusu mwingiliano wako na Programu, kama vile kurasa unazotembelea, muda unaotumika kwenye kila ukurasa na takwimu nyingine za matumizi.\n\nMaelezo ya Kifaa: Maelezo kuhusu kifaa chako, ikijumuisha aina ya kifaa, mfumo wa uendeshaji na vitambulishi vya kipekee vya kifaa.\n\n3. Jinsi Tunavyotumia Taarifa Zako\n\nTunatumia maelezo tunayokusanya kwa madhumuni mbalimbali, ikiwa ni pamoja na:\n\nIli kutoa na kudumisha Programu\n\nIli kuboresha na kubinafsisha matumizi yako\n\nIli kuwasiliana nawe, ikiwa ni pamoja na kutuma masasisho na kujibu maswali\n\nKufuatilia na kuchambua matumizi na mitindo ili kuboresha Programu\n\nKuzingatia wajibu wa kisheria na kulinda haki zetu\n\n4. Kushiriki Taarifa Zako\n\nTunaweza kushiriki maelezo yako na:\n\nWatoa Huduma: Wahusika wengine wanaofanya huduma kwa niaba yetu, kama vile upangishaji na uchanganuzi wa data.\n\nMahitaji ya Kisheria: Inapohitajika kisheria au kulinda haki na usalama wetu au haki na usalama wa wengine.\n\n5. Usalama wa Taarifa Zako\n\nTunachukua hatua zinazofaa ili kulinda maelezo yako dhidi ya ufikiaji, matumizi au ufichuzi ambao haujaidhinishwa. Hata hivyo, hakuna njia ya uwasilishaji kupitia mtandao au hifadhi ya kielektroniki iliyo salama 100%, na hatuwezi kuhakikisha usalama kamili.\n\n6. Chaguo zako\n\nUna chaguo zifuatazo kuhusu maelezo yako:\n\nUfikiaji na Usasishaji: Unaweza kufikia na kusasisha maelezo yako ya kibinafsi kupitia mipangilio ya akaunti yako.\n\nJitoe: Unaweza kuchagua kutopokea mawasiliano ya matangazo kutoka kwetu kwa kufuata maagizo ya kujiondoa yaliyotolewa katika mawasiliano.\n\n7. Faragha ya Watoto\n\nTPS Hub imekusudiwa kutumiwa na wanafunzi na washiriki wa jumuiya yetu ya shule. Hatukusanyi taarifa za kibinafsi kutoka kwa watoto walio chini ya umri wa miaka 13 kwa kujua bila idhini ya mzazi. Tukifahamu kwamba tumekusanya taarifa za kibinafsi kutoka kwa mtoto aliye na umri wa chini ya miaka 13 bila uthibitishaji wa kibali cha mzazi, tutachukua hatua za kuondoa maelezo hayo.\n\n8. Mabadiliko ya Sera hii ya Faragha\n\nTunaweza kusasisha Sera hii ya Faragha mara kwa mara. Tutakuarifu kuhusu mabadiliko yoyote kwa kuchapisha Sera mpya ya Faragha kwenye ukurasa huu na kusasisha tarehe ya kuanza kutumika. Unashauriwa kukagua Sera hii ya Faragha mara kwa mara kwa mabadiliko yoyote.\n\n9. Wasiliana Nasi\n\nIkiwa una maswali yoyote kuhusu Sera hii ya Faragha, tafadhali wasiliana nasi kwa:\n\nsupport@tpshub.com',
    },
    'xltlyert': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'sw': 'Nyumbani',
    },
  },
  // HelpCenter
  {
    '30xieyxq': {
      'en': 'Help Center',
      'ar': 'مركز المساعدة',
      'es': 'Centro de ayuda',
      'fr': 'Centre d\'aide',
      'sw': 'Kituo cha Usaidizi',
    },
    'xbv63ple': {
      'en': 'FAQ',
      'ar': 'التعليمات',
      'es': 'Preguntas frecuentes',
      'fr': 'FAQ',
      'sw': 'Maswali Yanayoulizwa Mara kwa Mara',
    },
    '9lmzwt47': {
      'en': 'What is TPS Hub?',
      'ar': 'ما هو TPS Hub؟',
      'es': '¿Qué es TPS Hub?',
      'fr': 'Qu\'est-ce que TPS Hub ?',
      'sw': 'TPS Hub ni nini?',
    },
    'ho07mkkb': {
      'en':
          'TPS Hub is a mobile app designed to showcase and share the amazing projects and innovations created by students at our school. It serves as an informational hub for discovering and celebrating student achievements.',
      'ar':
          'TPS Hub هو تطبيق جوال مصمم لعرض ومشاركة المشاريع والابتكارات المذهلة التي أنشأها الطلاب في مدرستنا. وهو بمثابة مركز معلوماتي لاكتشاف إنجازات الطلاب والاحتفال بها.',
      'es':
          'TPS Hub es una aplicación móvil diseñada para mostrar y compartir los increíbles proyectos e innovaciones creados por los estudiantes de nuestra escuela. Funciona como un centro de información para descubrir y celebrar los logros de los estudiantes.',
      'fr':
          'TPS Hub est une application mobile conçue pour présenter et partager les projets et innovations incroyables créés par les étudiants de notre école. Elle sert de centre d\'information pour découvrir et célébrer les réalisations des étudiants.',
      'sw':
          'TPS Hub ni programu ya vifaa vya mkononi iliyoundwa ili kuonyesha na kushiriki miradi ya ajabu na ubunifu iliyoundwa na wanafunzi katika shule yetu. Inatumika kama kitovu cha habari cha kugundua na kusherehekea mafanikio ya wanafunzi.',
    },
    'ht8wud6w': {
      'en': 'Who can use the TPS Hub app?',
      'ar': 'من يمكنه مشاهدة المشاريع على TPS Hub؟',
      'es': '¿Quién puede ver los proyectos en TPS Hub?',
      'fr': 'Qui peut consulter les projets sur TPS Hub ?',
      'sw': 'Ni nani anayeweza kutazama miradi kwenye TPS Hub?',
    },
    'q33cnjre': {
      'en':
          'The TPS Hub app is available to students, teachers, and parents of our school community. It provides a platform for students to share their projects and for others to view and celebrate these achievements.',
      'ar':
          'يمكن لمجتمع المدرسة، بما في ذلك الطلاب والمعلمين والموظفين، الاطلاع على المشاريع الموجودة على TPS Hub. وهذا يضمن بيئة داعمة حيث يمكن للأقران استكشاف أعمال بعضهم البعض والاستفادة منها.',
      'es':
          'Los proyectos en TPS Hub están a disposición de la comunidad escolar, incluidos estudiantes, maestros y personal. Esto garantiza un entorno de apoyo donde los compañeros pueden explorar e inspirarse con el trabajo de los demás.',
      'fr':
          'Les projets sur TPS Hub sont visibles par la communauté scolaire, notamment les élèves, les enseignants et le personnel. Cela garantit un environnement favorable où les pairs peuvent explorer et s\'inspirer du travail des autres.',
      'sw':
          'Miradi kwenye TPS Hub inaonekana na jumuiya ya shule, ikiwa ni pamoja na wanafunzi, walimu na wafanyakazi. Hii inahakikisha mazingira ya usaidizi ambapo wenzao wanaweza kuchunguza na kutiwa moyo na kazi ya kila mmoja wao.',
    },
    'u9o7gben': {
      'en': 'How can I provide feedback or report an issue with TPS Hub?',
      'ar': 'كيف يمكنني تقديم ملاحظات أو الإبلاغ عن مشكلة مع TPS Hub؟',
      'es':
          '¿Cómo puedo proporcionar comentarios o informar un problema con TPS Hub?',
      'fr':
          'Comment puis-je fournir des commentaires ou signaler un problème avec TPS Hub ?',
      'sw': 'Je, ninawezaje kutoa maoni au kuripoti tatizo na TPS Hub?',
    },
    'u5cki287': {
      'en':
          'We welcome your feedback and are here to help with any issues. You can contact us by emailing school directly.',
      'ar':
          'نرحب بتعليقاتكم ونحن هنا لمساعدتكم في أي مشكلة. يمكنك الاتصال بنا عبر قسم \"الدعم\" في التطبيق أو مراسلة إدوارد مباشرة عبر البريد الإلكتروني.',
      'es':
          'Agradecemos tus comentarios y estamos aquí para ayudarte con cualquier problema. Puedes contactarnos a través de la sección \"Soporte\" de la aplicación o enviarle un correo electrónico directamente a Edward.',
      'fr':
          'Nous apprécions vos commentaires et sommes là pour vous aider en cas de problème. Vous pouvez nous contacter via la section « Assistance » de l\'application ou envoyer un e-mail directement à Edward.',
      'sw':
          'Tunakaribisha maoni yako na tuko hapa kukusaidia kwa masuala yoyote. Unaweza kuwasiliana nasi kupitia sehemu ya \"Msaada\" katika programu au barua pepe Edward moja kwa moja.',
    },
    'vliar4ae': {
      'en': 'What is the concern reporting interface?',
      'ar': 'ما هي واجهة الإبلاغ عن التنمر؟',
      'es': '¿Qué es la interfaz de denuncia de acoso?',
      'fr': 'Qu\'est-ce que l\'interface de signalement d\'intimidation ?',
      'sw': 'Kiolesura cha kuripoti uonevu ni nini?',
    },
    '9547no1z': {
      'en':
          'The bully reporting interface on TPS Hub allows students to confidentially report any problems they encounter or experience. This helps ensure a safe and supportive environment for everyone.',
      'ar':
          'تتيح واجهة الإبلاغ عن التنمر على TPS Hub للطلاب الإبلاغ بشكل سري عن أي حوادث تنمر يشهدونها أو يتعرضون لها. وهذا يساعد في ضمان بيئة آمنة وداعمة للجميع.',
      'es':
          'La interfaz de denuncia de acoso escolar de TPS Hub permite a los estudiantes denunciar de forma confidencial cualquier incidente de acoso escolar que presencien o experimenten. Esto ayuda a garantizar un entorno seguro y de apoyo para todos.',
      'fr':
          'L\'interface de signalement des cas d\'intimidation sur TPS Hub permet aux élèves de signaler en toute confidentialité tout incident d\'intimidation dont ils sont témoins ou victimes. Cela contribue à garantir un environnement sûr et favorable pour tous.',
      'sw':
          'Kiolesura cha kuripoti uonevu kwenye TPS Hub huruhusu wanafunzi kuripoti kwa siri matukio yoyote ya uchokozi wanayoshuhudia au kupata. Hii husaidia kuhakikisha mazingira salama na yenye usaidizi kwa kila mtu.',
    },
    'p5eusn2y': {
      'en': 'How often is new content added to TPS Hub?',
      'ar': 'هل يمكن للوالدين الوصول إلى TPS Hub؟',
      'es': '¿Pueden los padres acceder a TPS Hub?',
      'fr': 'Les parents peuvent-ils accéder au TPS Hub ?',
      'sw': 'Je, wazazi wanaweza kufikia TPS Hub?',
    },
    'lsy2cp6t': {
      'en':
          'New content is added regularly as students submit their projects. We aim to update the app frequently to ensure that the latest and most exciting projects are showcased.',
      'ar':
          'حاليًا، تم تصميم TPS Hub للاستخدام من قبل الطلاب والمعلمين والموظفين داخل مجتمع المدرسة. يمكن للآباء البقاء على اطلاع من خلال قنوات الاتصال المدرسية الأخرى.',
      'es':
          'Actualmente, TPS Hub está diseñado para que lo utilicen estudiantes, profesores y personal de la comunidad escolar. Los padres pueden mantenerse informados a través de otros canales de comunicación de la escuela.',
      'fr':
          'Actuellement, TPS Hub est conçu pour être utilisé par les élèves, les enseignants et le personnel de la communauté scolaire. Les parents peuvent rester informés via d\'autres canaux de communication de l\'école.',
      'sw':
          'Kwa sasa, TPS Hub imeundwa kutumiwa na wanafunzi, walimu na wafanyakazi ndani ya jumuiya ya shule. Wazazi wanaweza kukaa taarifa kupitia njia nyingine za mawasiliano za shule.',
    },
    '83rfcv9l': {
      'en': 'Who should I contact if I need assistance with using TPS Hub?',
      'ar': 'ما هي أنواع المشاريع التي يمكن تقديمها إلى TPS Hub؟',
      'es': '¿Qué tipos de proyectos se pueden enviar a TPS Hub?',
      'fr': 'Quels types de projets peuvent être soumis au TPS Hub ?',
      'sw': 'Ni aina gani za miradi zinaweza kuwasilishwa kwa TPS Hub?',
    },
    'g1cjmxxl': {
      'en':
          'If you need assistance, please reach out to our support team through the “Help & Support” section in the app. You can also find contact information on our website for additional support.',
      'ar':
          'يرحب مركز TPS بمجموعة واسعة من المشاريع، بما في ذلك على سبيل المثال لا الحصر مشاريع الفن والعلوم والتكنولوجيا والأدب وخدمة المجتمع. إذا لم تكن متأكدًا من ملاءمة مشروعك، فلا تتردد في التواصل معنا للحصول على توضيح.',
      'es':
          'TPS Hub acepta una amplia gama de proyectos, incluidos, entre otros, proyectos de arte, ciencia, tecnología, literatura y servicio comunitario. Si no está seguro de si su proyecto es adecuado, no dude en comunicarse con nosotros para obtener una aclaración.',
      'fr':
          'Le TPS Hub accueille un large éventail de projets, notamment des projets artistiques, scientifiques, technologiques, littéraires et de service communautaire. Si vous n\'êtes pas sûr que votre projet corresponde à nos critères, n\'hésitez pas à nous contacter pour obtenir des éclaircissements.',
      'sw':
          'TPS Hub inakaribisha miradi mingi, ikijumuisha, lakini sio tu, miradi ya sanaa, sayansi, teknolojia, fasihi na huduma za jamii. Ikiwa huna uhakika kama mradi wako unafaa, jisikie huru kuwasiliana nasi kwa ufafanuzi.',
    },
    'dryehphj': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'sw': 'Nyumbani',
    },
  },
  // createpost
  {
    'ktnevd7i': {
      'en': 'Create Post',
      'ar': 'إنشاء مشاركة',
      'es': 'Crear publicación',
      'fr': 'Créer une publication',
      'sw': 'Unda Chapisho',
    },
    'ddr6y3da': {
      'en': 'Create Post',
      'ar': 'إنشاء مشاركة',
      'es': 'Crear publicación',
      'fr': 'Créer une publication',
      'sw': 'Unda Chapisho',
    },
    'hzzg5oea': {
      'en': 'Add image or video here.',
      'ar': 'أضف الصورة أو الفيديو هنا.',
      'es': 'Añade una imagen o un vídeo aquí.',
      'fr': 'Ajoutez une image ou une vidéo ici.',
      'sw': 'Ongeza picha au video hapa.',
    },
    'glcystiv': {
      'en': 'Comment....',
      'ar': 'تعليق....',
      'es': 'Comentario....',
      'fr': 'Commentaire....',
      'sw': 'Maoni....',
    },
    'gdi6bs7b': {
      'en': 'Create Post',
      'ar': 'إنشاء مشاركة',
      'es': 'Crear publicación',
      'fr': 'Créer une publication',
      'sw': 'Unda Chapisho',
    },
    '3tc935hp': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'sw': 'Nyumbani',
    },
  },
  // createStory
  {
    '9qwbyszg': {
      'en': 'Comment....',
      'ar': 'تعليق....',
      'es': 'Comentario....',
      'fr': 'Commentaire....',
      'sw': 'Maoni....',
    },
    '41t9rofq': {
      'en': 'Video',
      'ar': 'فيديو',
      'es': 'Video',
      'fr': 'Vidéo',
      'sw': 'Video',
    },
    'krob781c': {
      'en': 'Photo',
      'ar': 'صورة',
      'es': 'Foto',
      'fr': 'Photo',
      'sw': 'Picha',
    },
    '05spgzlq': {
      'en': 'Create Story',
      'ar': 'إنشاء قصة',
      'es': 'Crear historia',
      'fr': 'Créer une histoire',
      'sw': 'Unda Hadithi',
    },
    '31whtsv7': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'sw': 'Nyumbani',
    },
  },
  // report_concern
  {
    'wt39vaje': {
      'en': 'Report a Concern',
      'ar': 'دردشاتي',
      'es': 'Mis chats',
      'fr': 'Mes conversations',
      'sw': 'Gumzo Zangu',
    },
    'c0hgz9al': {
      'en': 'New Message',
      'ar': 'رسالة جديدة',
      'es': 'Nuevo mensaje',
      'fr': 'Nouveau message',
      'sw': 'Ujumbe Mpya',
    },
    'cgritqkl': {
      'en': 'Group Chat',
      'ar': 'الدردشة الجماعية',
      'es': 'Chat grupal',
      'fr': 'Discussion de groupe',
      'sw': 'Gumzo la Kikundi',
    },
    'yarpq6zc': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'sw': 'Nyumbani',
    },
  },
  // main_Feed
  {
    'p0qsstcp': {
      'en': 'Student Posts',
      'ar': 'مشاركات الطلاب',
      'es': 'Publicaciones de estudiantes',
      'fr': 'Messages des étudiants',
      'sw': 'Machapisho ya Wanafunzi',
    },
    'lftm21rx': {
      'en': 'New Post',
      'ar': 'منشور جديد',
      'es': 'Nueva publicación',
      'fr': 'Nouvelle publication',
      'sw': 'Chapisho Jipya',
    },
    'rz30qq24': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'sw': 'Nyumbani',
    },
  },
  // main_Profile
  {
    'ow13zq8x': {
      'en': 'My Profile',
      'ar': 'الملف الشخصي الخاص بي',
      'es': 'Mi perfil',
      'fr': 'Mon profil',
      'sw': 'Wasifu Wangu',
    },
    'y7xo4sxv': {
      'en': 'Settings',
      'ar': 'إعدادات',
      'es': 'Ajustes',
      'fr': 'Paramètres',
      'sw': 'Mipangilio',
    },
    'd3uth7x2': {
      'en': 'My Posts',
      'ar': 'منشوراتي',
      'es': 'Mis publicaciones',
      'fr': 'Mes articles',
      'sw': 'Machapisho Yangu',
    },
    'mrfutwvv': {
      'en': 'Friends',
      'ar': 'أصدقاء',
      'es': 'Amigos',
      'fr': 'Amis',
      'sw': 'Marafiki',
    },
    '5e3s4ean': {
      'en': 'No Friends',
      'ar': 'لا يوجد أصدقاء',
      'es': 'Sin amigos',
      'fr': 'Pas d\'amis',
      'sw': 'Hakuna Marafiki',
    },
    'ltxmjpz2': {
      'en': 'You don\'t have any friends.',
      'ar': 'ليس لديك أي أصدقاء.',
      'es': 'No tienes amigos',
      'fr': 'Tu n\'as pas d\'amis.',
      'sw': 'Huna marafiki wowote.',
    },
    'wnu0i8gr': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'sw': 'Nyumbani',
    },
  },
  // postDetails_Page
  {
    'oj49qz7x': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'sw': 'Nyumbani',
    },
  },
  // storyDetails
  {
    'zm7udox8': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'sw': 'Nyumbani',
    },
  },
  // viewProfilePageOther
  {
    'f8tc9g79': {
      'en': 'Current Friend',
      'ar': 'صديق حالي',
      'es': 'Amigo actual',
      'fr': 'Ami actuel',
      'sw': 'Rafiki wa Sasa',
    },
    'gp9qrrxd': {
      'en': 'Add Friend',
      'ar': 'أضف صديقًا',
      'es': 'Agregar amigo',
      'fr': 'Ajouter un ami',
      'sw': 'Ongeza Rafiki',
    },
    'g5rytaef': {
      'en': 'Posts',
      'ar': 'دعامات',
      'es': 'Publicaciones',
      'fr': 'Articles',
      'sw': 'Machapisho',
    },
    'lbnrzrvi': {
      'en': '@username',
      'ar': '@اسم المستخدم',
      'es': '@nombre de usuario',
      'fr': '@nom d\'utilisateur',
      'sw': '@jina la mtumiaji',
    },
    '22gzd1i6': {
      'en': '2,493',
      'ar': '2,493',
      'es': '2,493',
      'fr': '2 493',
      'sw': '2,493',
    },
    'brv7ywwj': {
      'en': '4',
      'ar': '4',
      'es': '4',
      'fr': '4',
      'sw': '4',
    },
    'y3pa547n': {
      'en':
          'I\'m back with a super quick Instagram redesign just for the fan. Rounded corners and cute icons, what else do we need, haha.⁣ ',
      'ar':
          'عدت بتصميم سريع للغاية لتطبيق Instagram لمحبيه. زوايا مستديرة وأيقونات لطيفة، ماذا نحتاج أكثر من ذلك، هاهاها.',
      'es':
          'Vuelvo con un rediseño de Instagram súper rápido solo para los fanáticos. Esquinas redondeadas e íconos lindos, ¿qué más necesitamos? Jaja.',
      'fr':
          'Je suis de retour avec une refonte Instagram super rapide juste pour les fans. Des coins arrondis et des icônes mignonnes, de quoi d\'autre avons-nous besoin, haha.',
      'sw':
          'Nimerudi na usanifu upya wa haraka wa Instagram kwa ajili ya shabiki tu. Pembe za mviringo na ikoni nzuri, tunahitaji nini kingine, haha.⁣',
    },
    '7cmo6th5': {
      'en': 'Friends',
      'ar': 'أصدقاء',
      'es': 'Amigos',
      'fr': 'Amis',
      'sw': 'Marafiki',
    },
    'dwzmdau6': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'sw': 'Nyumbani',
    },
  },
  // chat_2_Details
  {
    'dya67rg5': {
      'en': 'Group Chat',
      'ar': 'الدردشة الجماعية',
      'es': 'Chat grupal',
      'fr': 'Discussion de groupe',
      'sw': 'Gumzo la Kikundi',
    },
    's459o701': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'sw': 'Nyumbani',
    },
  },
  // chat_2_InviteUsers
  {
    'zcg05tyw': {
      'en': 'Report Concern',
      'ar': 'دعوة الأصدقاء',
      'es': 'Invitar amigos',
      'fr': 'Inviter des amis',
      'sw': 'Waalike Marafiki',
    },
    'g4a0ukfo': {
      'en': 'Selected',
      'ar': 'تم اختياره',
      'es': 'Seleccionado',
      'fr': 'Choisi',
      'sw': 'Imechaguliwa',
    },
    'thjogp8k': {
      'en': 'No Friends',
      'ar': 'لا يوجد أصدقاء',
      'es': 'Sin amigos',
      'fr': 'Pas d\'amis',
      'sw': 'Hakuna Marafiki',
    },
    'lg9cr8bl': {
      'en': 'No users exist to create a chat with.',
      'ar': 'لا يوجد مستخدمين لإنشاء محادثة معهم.',
      'es': 'No existen usuarios con los que crear un chat.',
      'fr': 'Il n\'existe aucun utilisateur avec qui créer une discussion.',
      'sw': 'Hakuna watumiaji wa kuunda gumzo nao.',
    },
    '8t8mkek3': {
      'en': 'Report Concern',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    'po897hp0': {
      'en': 'Selected',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    '5tz8sn15': {
      'en': 'No Friends',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    'xmrz4xul': {
      'en': 'No users exist to create a chat with.',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    'ccm5sapc': {
      'en': 'Report a concern',
      'ar': 'دعوة الأصدقاء',
      'es': 'Invitar amigos',
      'fr': 'Inviter des amis',
      'sw': 'Waalike Marafiki',
    },
    'k8cf4bvi': {
      'en': 'Select users from below to start a chat.',
      'ar': 'قم بتحديد المستخدمين من الأسفل لبدء الدردشة.',
      'es': 'Seleccione usuarios de abajo para iniciar un chat.',
      'fr':
          'Sélectionnez les utilisateurs ci-dessous pour démarrer une discussion.',
      'sw': 'Chagua watumiaji kutoka chini ili kuanzisha gumzo.',
    },
    '4b35wup5': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'sw': 'Nyumbani',
    },
  },
  // image_Details
  {
    'mn8pb7er': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'sw': 'Nyumbani',
    },
  },
  // onBoardComplete_modal
  {
    'prn4cih5': {
      'en': 'Congratulations!',
      'ar': 'مبروك!',
      'es': '¡Felicidades!',
      'fr': 'Félicitations!',
      'sw': 'Hongera!',
    },
    '7y5lbqhc': {
      'en':
          'Your account is ready to use. You will be redirected to the Home page in a few seconds..',
      'ar':
          'حسابك جاهز للاستخدام. سيتم إعادة توجيهك إلى الصفحة الرئيسية في غضون ثوانٍ قليلة.',
      'es':
          'Su cuenta está lista para usar. Será redirigido a la página de inicio en unos segundos.',
      'fr':
          'Votre compte est prêt à être utilisé. Vous serez redirigé vers la page d\'accueil dans quelques secondes.',
      'sw':
          'Akaunti yako iko tayari kutumika. Utaelekezwa kwenye ukurasa wa Nyumbani baada ya sekunde chache..',
    },
  },
  // RemoveFromCardConfirm
  {
    'pq99mh1o': {
      'en': 'Remove Project?',
      'ar': 'إزالة المشروع؟',
      'es': '¿Eliminar proyecto?',
      'fr': 'Supprimer le projet ?',
      'sw': 'Ungependa kuondoa Mradi?',
    },
    'dhnacgix': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'es': 'Cancelar',
      'fr': 'Annuler',
      'sw': 'Ghairi',
    },
    'es0xob3g': {
      'en': 'Yes, Remove',
      'ar': 'نعم، قم بإزالة',
      'es': 'Sí, eliminar',
      'fr': 'Oui, supprimer',
      'sw': 'Ndiyo, Ondoa',
    },
  },
  // CommentGive
  {
    'b167nkp3': {
      'en': 'Leave a Comment',
      'ar': 'اترك تعليقا',
      'es': 'Deja un comentario',
      'fr': 'Laisser un commentaire',
      'sw': 'Acha Maoni',
    },
    'p4v8fyel': {
      'en': 'Please give your rating & also your comment...',
      'ar': 'يرجى إعطاء تقييمك وتعليقك أيضًا ...',
      'es': 'Por favor danos tu calificación y también tu comentario...',
      'fr': 'S\'il vous plaît donnez votre note et aussi votre commentaire...',
      'sw': 'Tafadhali toa ukadiriaji wako na pia maoni yako...',
    },
    'j2v4qpw3': {
      'en':
          'Some text like: Great project! The creativity and effort are impressive. Looking forward to more like this!',
      'ar':
          'بعض النصوص مثل: مشروع رائع! الإبداع والجهد المبذول مثيران للإعجاب. أتطلع إلى المزيد من هذا!',
      'es':
          'Un texto como: ¡Gran proyecto! La creatividad y el esfuerzo son impresionantes. ¡Espero ver más proyectos como este!',
      'fr':
          'Un texte comme : Super projet ! La créativité et l\'effort sont impressionnants. J\'ai hâte d\'en voir d\'autres comme celui-ci !',
      'sw':
          'Maandishi mengine kama: Mradi mzuri! Ubunifu na juhudi ni ya kuvutia. Kutarajia zaidi kama hii!',
    },
    'pmb9suod': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'es': 'El campo es obligatorio',
      'fr': 'Le champ est obligatoire',
      'sw': 'Sehemu inahitajika',
    },
    'zjspktyl': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء اختيار خيار من القائمة المنسدلة',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
      'sw': 'Tafadhali chagua chaguo kutoka kwenye menyu kunjuzi',
    },
    'oe33acjy': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'es': 'Cancelar',
      'fr': 'Annuler',
      'sw': 'Ghairi',
    },
    'zs6j4hc7': {
      'en': 'Submit',
      'ar': 'يُقدِّم',
      'es': 'Entregar',
      'fr': 'Soumettre',
      'sw': 'Wasilisha',
    },
  },
  // LogoutConfirm_Modal
  {
    'a68c7jwy': {
      'en': 'Logout',
      'ar': 'تسجيل الخروج',
      'es': 'Cerrar sesión',
      'fr': 'Déconnexion',
      'sw': 'Ondoka',
    },
    '50ivrv6h': {
      'en': 'Are you sure you want to log out?',
      'ar': 'هل أنت متأكد أنك تريد تسجيل الخروج؟',
      'es': '¿Estás seguro que deseas cerrar la sesión?',
      'fr': 'Etes-vous sûr de vouloir vous déconnecter ?',
      'sw': 'Je, una uhakika unataka kutoka?',
    },
    'p0z4sjdl': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'es': 'Cancelar',
      'fr': 'Annuler',
      'sw': 'Ghairi',
    },
    'a6j51z22': {
      'en': 'Yes, Logout',
      'ar': 'نعم، تسجيل الخروج',
      'es': 'Sí, cerrar sesión',
      'fr': 'Oui, déconnectez-vous',
      'sw': 'Ndiyo, Ondoka',
    },
  },
  // InfoConfirm_Modal
  {
    '82i39xhd': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'es': 'Cancelar',
      'fr': 'Annuler',
      'sw': 'Ghairi',
    },
    'x4zkf56d': {
      'en': 'Ok, I Undrestand!',
      'ar': 'حسنًا، فهمت!',
      'es': 'Ok, ¡lo entiendo!',
      'fr': 'Ok, je comprends !',
      'sw': 'Sawa, Ninaelewa!',
    },
  },
  // NavBar
  {
    '86ek9ngg': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'sw': 'Nyumbani',
    },
    '11vi9eta': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'sw': 'Nyumbani',
    },
    '2htdxh8c': {
      'en': 'Support',
      'ar': 'يدعم',
      'es': 'Apoyo',
      'fr': 'Soutien',
      'sw': 'Msaada',
    },
    'x4aw2snp': {
      'en': 'Concern?',
      'ar': 'يدعم',
      'es': 'Apoyo',
      'fr': 'Soutien',
      'sw': 'Msaada',
    },
    '05l2rhqe': {
      'en': 'Bookmark',
      'ar': 'علامة مرجعية',
      'es': 'Marcador',
      'fr': 'Marque-page',
      'sw': 'Alamisho',
    },
    't8046srm': {
      'en': 'Bookmark',
      'ar': 'علامة مرجعية',
      'es': 'Marcador',
      'fr': 'Marque-page',
      'sw': 'Alamisho',
    },
    'lpg88ni2': {
      'en': 'Profile',
      'ar': 'حساب تعريفي',
      'es': 'Perfil',
      'fr': 'Profil',
      'sw': 'Wasifu',
    },
    '0zt4rgbu': {
      'en': 'Profile',
      'ar': 'حساب تعريفي',
      'es': 'Perfil',
      'fr': 'Profil',
      'sw': 'Wasifu',
    },
    '0udjv75u': {
      'en': 'School Area',
      'ar': 'منطقة المدرسة',
      'es': 'Área escolar',
      'fr': 'Zone scolaire',
      'sw': 'Eneo la Shule',
    },
  },
  // sidenav
  {
    'qbhgqjor': {
      'en': 'TPS Hub',
      'ar': 'مركز TPS',
      'es': 'Centro TPS',
      'fr': 'Centre TPS',
      'sw': 'Kitovu cha TPS',
    },
    '5qgriffz': {
      'en': '2',
      'ar': '2',
      'es': '2',
      'fr': '2',
      'sw': '2',
    },
    'tyuu2ifj': {
      'en': 'Primary Navigation',
      'ar': 'الملاحة الأساسية',
      'es': 'Navegación principal',
      'fr': 'Navigation principale',
      'sw': 'Urambazaji Msingi',
    },
    'tzhqcovh': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Hogar',
      'fr': 'Maison',
      'sw': 'Nyumbani',
    },
    'fy6xmkjq': {
      'en': 'Bookmarks',
      'ar': 'العلامات المرجعية',
      'es': 'Marcadores',
      'fr': 'Signets',
      'sw': 'Alamisho',
    },
    '39ij5n1x': {
      'en': 'Student Area',
      'ar': 'منطقة الطلاب',
      'es': 'Área de estudiantes',
      'fr': 'Espace Etudiant',
      'sw': 'Eneo la Wanafunzi',
    },
    'iqbx9cor': {
      'en': 'Main Feed',
      'ar': 'التغذية الرئيسية',
      'es': 'Feed principal',
      'fr': 'Flux principal',
      'sw': 'Mlisho Mkuu',
    },
    '4jqvkec8': {
      'en': 'Public profile',
      'ar': 'الملف الشخصي العام',
      'es': 'Perfil público',
      'fr': 'Profil public',
      'sw': 'Wasifu wa umma',
    },
    '1f63xp09': {
      'en': 'Report a Concern',
      'ar': 'الدردشات',
      'es': 'Charlas',
      'fr': 'Chats',
      'sw': 'Soga',
    },
    '7zjcjho7': {
      'en': 'Admin',
      'ar': 'مسؤل',
      'es': 'Administración',
      'fr': 'Administrateur',
      'sw': 'Msimamizi',
    },
    'f53clasr': {
      'en': 'My Profile',
      'ar': 'الملف الشخصي الخاص بي',
      'es': 'Mi perfil',
      'fr': 'Mon profil',
      'sw': 'Wasifu Wangu',
    },
    'qpix3gf4': {
      'en': 'Light Mode',
      'ar': 'وضع الضوء',
      'es': 'Modo claro',
      'fr': 'Mode lumière',
      'sw': 'Hali ya Mwanga',
    },
    'c6wsurvn': {
      'en': 'Dark Mode',
      'ar': 'الوضع المظلم',
      'es': 'Modo oscuro',
      'fr': 'Mode sombre',
      'sw': 'Hali ya Giza',
    },
  },
  // postDetails_Base
  {
    'wq1uqd59': {
      'en': 'Comments',
      'ar': 'تعليقات',
      'es': 'Comentarios',
      'fr': 'Commentaires',
      'sw': 'Maoni',
    },
    'z3wbgc94': {
      'en': 'Posted',
      'ar': 'تم نشره',
      'es': 'Al corriente',
      'fr': 'Publié',
      'sw': 'Iliyotumwa',
    },
    'vxsl4bho': {
      'en': 'Comment here...',
      'ar': 'علق هنا...',
      'es': 'Comenta aquí...',
      'fr': 'Commentez ici...',
      'sw': 'Toa maoni yako hapa...',
    },
    'sszv29t9': {
      'en': 'Post',
      'ar': 'بريد',
      'es': 'Correo',
      'fr': 'Poste',
      'sw': 'Chapisha',
    },
    'c7unruyo': {
      'en': 'Please fill in the comment...',
      'ar': 'من فضلك إملأ التعليق...',
      'es': 'Por favor rellene el comentario...',
      'fr': 'S\'il vous plaît remplir le commentaire...',
      'sw': 'Tafadhali jaza maoni...',
    },
    '4zleq6op': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء اختيار خيار من القائمة المنسدلة',
      'es': 'Por favor, seleccione una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
      'sw': 'Tafadhali chagua chaguo kutoka kwenye menyu kunjuzi',
    },
  },
  // comments
  {
    'viqifom8': {
      'en': 'Comments',
      'ar': 'تعليقات',
      'es': 'Comentarios',
      'fr': 'Commentaires',
      'sw': 'Maoni',
    },
    '6w0tumxj': {
      'en': 'Posted',
      'ar': 'تم نشره',
      'es': 'Al corriente',
      'fr': 'Publié',
      'sw': 'Iliyotumwa',
    },
    'c3nr57ob': {
      'en': 'Comment here...',
      'ar': 'علق هنا...',
      'es': 'Comenta aquí...',
      'fr': 'Commentez ici...',
      'sw': 'Toa maoni yako hapa...',
    },
    'j0ulm0yt': {
      'en': 'Post',
      'ar': 'بريد',
      'es': 'Correo',
      'fr': 'Poste',
      'sw': 'Chapisha',
    },
  },
  // createModal
  {
    'wmqx6ugk': {
      'en': 'Create Story',
      'ar': 'إنشاء قصة',
      'es': 'Crear historia',
      'fr': 'Créer une histoire',
      'sw': 'Unda Hadithi',
    },
    'nojtdemy': {
      'en':
          'Spotlight your achievements, ideas, and school updates with everyone.',
      'ar': 'سلط الضوء على إنجازاتك وأفكارك وتحديثات المدرسة مع الجميع.',
      'es': 'Destaque sus logros, ideas y actualizaciones escolares con todos.',
      'fr':
          'Mettez en valeur vos réalisations, vos idées et les mises à jour de votre école auprès de tout le monde.',
      'sw': 'Angazia mafanikio yako, mawazo na masasisho ya shule na kila mtu.',
    },
    '9c0y0nd2': {
      'en': 'Create Post',
      'ar': 'إنشاء مشاركة',
      'es': 'Crear publicación',
      'fr': 'Créer une publication',
      'sw': 'Unda Chapisho',
    },
    'zhpykwav': {
      'en': 'Capture and share exciting school moments in real-time!',
      'ar': 'التقط لحظات مدرسية مثيرة وشاركها في الوقت الفعلي!',
      'es':
          '¡Captura y comparte momentos escolares emocionantes en tiempo real!',
      'fr':
          'Capturez et partagez des moments scolaires passionnants en temps réel !',
      'sw':
          'Nasa na ushiriki matukio ya shule ya kusisimua katika muda halisi!',
    },
  },
  // deletePost
  {
    'ge5s6yr7': {
      'en': 'Delete Post',
      'ar': 'حذف المنشور',
      'es': 'Eliminar publicación',
      'fr': 'Supprimer la publication',
      'sw': 'Futa Chapisho',
    },
    'eusqu8vl': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'es': 'Cancelar',
      'fr': 'Annuler',
      'sw': 'Ghairi',
    },
  },
  // deleteStory
  {
    'jnv2amun': {
      'en': 'Delete Story',
      'ar': 'حذف القصة',
      'es': 'Eliminar historia',
      'fr': 'Supprimer l\'histoire',
      'sw': 'Futa Hadithi',
    },
    '3dg4cond': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'es': 'Cancelar',
      'fr': 'Annuler',
      'sw': 'Ghairi',
    },
  },
  // emptyList_1
  {
    '6uai7pc9': {
      'en': 'No Posts',
      'ar': 'لا يوجد مشاركات',
      'es': 'No hay publicaciones',
      'fr': 'Aucun message',
      'sw': 'Hakuna Machapisho',
    },
    'pnqlfnlx': {
      'en':
          'It seems that there are no posts here. Check back later to see the latest stuff going on!',
      'ar':
          'يبدو أنه لا توجد مشاركات هنا. راجع مرة أخرى لاحقًا للاطلاع على آخر المستجدات!',
      'es':
          'Parece que no hay publicaciones aquí. ¡Vuelva más tarde para ver las últimas novedades!',
      'fr':
          'Il semble qu\'il n\'y ait aucun article ici. Revenez plus tard pour voir les dernières nouveautés !',
      'sw':
          'Inaonekana hakuna machapisho hapa. Angalia tena baadaye ili kuona mambo mapya zaidi yanayoendelea!',
    },
  },
  // chat_DetailsOverlay
  {
    '1pw2avyf': {
      'en': 'Group Chat ID: ',
      'ar': 'معرف الدردشة الجماعية:',
      'es': 'ID del chat grupal:',
      'fr': 'ID de discussion de groupe :',
      'sw': 'Kitambulisho cha Gumzo la Kikundi:',
    },
    'zyfqn8nd': {
      'en': 'In this chat',
      'ar': 'في هذه الدردشة',
      'es': 'En este chat',
      'fr': 'Dans cette discussion',
      'sw': 'Katika soga hii',
    },
    'tgob1gch': {
      'en': 'Close',
      'ar': 'يغلق',
      'es': 'Cerca',
      'fr': 'Fermer',
      'sw': 'Funga',
    },
  },
  // chat_ThreadComponent
  {
    '636wgddt': {
      'en': 'Start typing here...',
      'ar': 'ابدأ الكتابة هنا...',
      'es': 'Comience a escribir aquí...',
      'fr': 'Commencez à taper ici...',
      'sw': 'Anza kuandika hapa...',
    },
    'rf3zv5m8': {
      'en': 'You must enter a message...',
      'ar': 'يجب عليك إدخال الرسالة...',
      'es': 'Debes ingresar un mensaje...',
      'fr': 'Vous devez entrer un message...',
      'sw': 'Lazima uweke ujumbe...',
    },
    'thw66ge7': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء اختيار خيار من القائمة المنسدلة',
      'es': 'Por favor, seleccione una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
      'sw': 'Tafadhali chagua chaguo kutoka kwenye menyu kunjuzi',
    },
  },
  // deleteDialog
  {
    'cp53890s': {
      'en': 'Options',
      'ar': 'خيارات',
      'es': 'Opciones',
      'fr': 'Options',
      'sw': 'Chaguo',
    },
    'tdmkmmq6': {
      'en': 'Invite Users',
      'ar': 'دعوة المستخدمين',
      'es': 'Invitar usuarios',
      'fr': 'Inviter des utilisateurs',
      'sw': 'Alika Watumiaji',
    },
    'o4jli26q': {
      'en': 'Delete Chat',
      'ar': 'حذف الدردشة',
      'es': 'Eliminar chat',
      'fr': 'Supprimer la discussion',
      'sw': 'Futa Gumzo',
    },
    'ejxj6y5d': {
      'en': 'Confirm Delete',
      'ar': 'تأكيد الحذف',
      'es': 'Confirmar eliminación',
      'fr': 'Confirmer la suppression',
      'sw': 'Thibitisha Futa',
    },
    '86upp5h4': {
      'en': 'You can\'t undo this action.',
      'ar': 'لا يمكنك التراجع عن هذا الإجراء.',
      'es': 'No puedes deshacer esta acción.',
      'fr': 'Vous ne pouvez pas annuler cette action.',
      'sw': 'Huwezi kutendua kitendo hiki.',
    },
    'crqf1dsu': {
      'en': 'Delete',
      'ar': 'يمسح',
      'es': 'Borrar',
      'fr': 'Supprimer',
      'sw': 'Futa',
    },
  },
  // user_ListSmall
  {
    'v9cg93qo': {
      'en': 'ME',
      'ar': 'أنا',
      'es': 'A MÍ',
      'fr': 'MOI',
      'sw': 'MIMI',
    },
  },
  // emptyList_2
  {
    'o71uoeyj': {
      'en': 'No Messages',
      'ar': 'لا توجد رسائل',
      'es': 'No hay mensajes',
      'fr': 'Aucun message',
      'sw': 'Hakuna Ujumbe',
    },
    'mqiroc0w': {
      'en':
          'It seems you don\'t have any messages with other users. Begin a chat above.',
      'ar': 'يبدو أنه ليس لديك أي رسائل مع مستخدمين آخرين. ابدأ محادثة أعلاه.',
      'es':
          'Parece que no tienes mensajes con otros usuarios. Inicia un chat arriba.',
      'fr':
          'Il semble que vous n\'ayez aucun message avec d\'autres utilisateurs. Commencez une discussion ci-dessus.',
      'sw':
          'Inaonekana huna ujumbe wowote na watumiaji wengine. Anzisha gumzo hapo juu.',
    },
  },
  // NavBarSA
  {
    'e2cp4jny': {
      'en': 'Feed',
      'ar': 'التغذية الرئيسية',
      'es': 'Feed principal',
      'fr': 'Flux principal',
      'sw': 'Mlisho Mkuu',
    },
    'pqgadamf': {
      'en': 'Feed',
      'ar': 'التغذية الرئيسية',
      'es': 'Feed principal',
      'fr': 'Flux principal',
      'sw': 'Mlisho Mkuu',
    },
    '8xrbqilk': {
      'en': 'Bookmark',
      'ar': 'علامة مرجعية',
      'es': 'Marcador',
      'fr': 'Marque-page',
      'sw': 'Alamisho',
    },
    '96s8dkzb': {
      'en': 'Bookmark',
      'ar': 'يدعم',
      'es': 'Apoyo',
      'fr': 'Soutien',
      'sw': 'Msaada',
    },
    's7xqn9ku': {
      'en': 'Concern',
      'ar': 'محادثة',
      'es': 'Charlar',
      'fr': 'Chat',
      'sw': 'Soga',
    },
    'scqtxxhe': {
      'en': 'Concern?',
      'ar': 'محادثة',
      'es': 'Charlar',
      'fr': 'Chat',
      'sw': 'Soga',
    },
    '0pddja8j': {
      'en': 'Profile',
      'ar': 'حساب تعريفي',
      'es': 'Perfil',
      'fr': 'Profil',
      'sw': 'Wasifu',
    },
    'a8vl9kjo': {
      'en': 'Profile',
      'ar': 'حساب تعريفي',
      'es': 'Perfil',
      'fr': 'Profil',
      'sw': 'Wasifu',
    },
    'owcsp7tz': {
      'en': 'Student Area',
      'ar': 'منطقة الطلاب',
      'es': 'Área de estudiantes',
      'fr': 'Espace Etudiant',
      'sw': 'Eneo la Wanafunzi',
    },
  },
  // Miscellaneous
  {
    '3xcyhsnv': {
      'en': 'Next',
      'ar': 'التالي',
      'es': 'Próximo',
      'fr': 'Suivant',
      'sw': 'Inayofuata',
    },
    'wdaunoqs': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
      'es': 'Correo electrónico',
      'fr': 'E-mail',
      'sw': 'Barua pepe',
    },
    '2dwdc8yl': {
      'en': 'Full Name',
      'ar': 'الاسم الكامل',
      'es': 'Nombre completo',
      'fr': 'Nom et prénom',
      'sw': 'Jina Kamili',
    },
    '9cp9tnq9': {
      'en': 'Male',
      'ar': 'ذكر',
      'es': 'Masculino',
      'fr': 'Mâle',
      'sw': 'Mwanaume',
    },
    'r0k6dvu6': {
      'en': 'Female',
      'ar': 'أنثى',
      'es': 'Femenino',
      'fr': 'Femelle',
      'sw': 'Kike',
    },
    '3ndtzya4': {
      'en': 'Gender',
      'ar': 'جنس',
      'es': 'Género',
      'fr': 'Genre',
      'sw': 'Jinsia',
    },
    'swm6319t': {
      'en': 'Search for an item...',
      'ar': 'البحث عن العنصر...',
      'es': 'Buscar un artículo...',
      'fr': 'Rechercher un article...',
      'sw': 'Tafuta kipengee...',
    },
    'gpzu150f': {
      'en': 'Search',
      'ar': 'يبحث',
      'es': 'Buscar',
      'fr': 'Recherche',
      'sw': 'Tafuta',
    },
    'ip2a2o8v': {
      'en': 'All',
      'ar': 'الجميع',
      'es': 'Todo',
      'fr': 'Tous',
      'sw': 'Wote',
    },
    '95svkunb': {
      'en': 'Clothes',
      'ar': 'ملابس',
      'es': 'Ropa',
      'fr': 'Vêtements',
      'sw': 'Nguo',
    },
    'p3v8uoen': {
      'en': 'Popular',
      'ar': 'شائع',
      'es': 'Popular',
      'fr': 'Populaire',
      'sw': 'Maarufu',
    },
    '1iw4e130': {
      'en': 'Most Recent',
      'ar': 'الأحدث',
      'es': 'Lo más reciente',
      'fr': 'Le plus récent',
      'sw': 'Hivi Karibuni',
    },
    'dk7ex8cx': {
      'en': 'Reset',
      'ar': 'إعادة ضبط',
      'es': 'Reiniciar',
      'fr': 'Réinitialiser',
      'sw': 'Weka upya',
    },
    'a5iqoo0f': {
      'en': 'Smoe text like: Very good product & fast delivery!',
      'ar': 'أرسل نصًا مثل: منتج جيد جدًا والتسليم سريع!',
      'es': 'Texto similar a: ¡Muy buen producto y entrega rápida!',
      'fr': 'Texte Smoe comme : Très bon produit et livraison rapide !',
      'sw': 'Maandishi ya Smoe kama: Bidhaa nzuri sana na utoaji wa haraka!',
    },
    'lkrp1j91': {
      'en': '\$10',
      'ar': '10 دولار',
      'es': '\$10',
      'fr': '10 \$',
      'sw': '\$10',
    },
    '6mrgpbz0': {
      'en': 'Invite',
      'ar': 'يدعو',
      'es': 'Invitar',
      'fr': 'Inviter',
      'sw': 'Alika',
    },
    'kvc2fy4j': {
      'en': 'Invited',
      'ar': 'مدعو',
      'es': 'Invitado',
      'fr': 'Invité',
      'sw': 'Umealikwa',
    },
    'zwg93n13': {
      'en': '2899 Summer Drive Taylor, PC 48180',
      'ar': '2899 Summer Drive Taylor, PC 48180',
      'es': '2899 Summer Drive Taylor, PC 48180',
      'fr': '2899, promenade Summer, Taylor, PC 48180',
      'sw': '2899 Summer Drive Taylor, PC 48180',
    },
    'b3knti0s': {
      'en': 'All',
      'ar': 'الجميع',
      'es': 'Todo',
      'fr': 'Tous',
      'sw': 'Wote',
    },
    'xvif1n69': {
      'en': 'Art1',
      'ar': 'الفن 1',
      'es': 'Arte 1',
      'fr': 'Art1',
      'sw': 'Sanaa ya 1',
    },
    '251gk4uv': {
      'en': 'Art2',
      'ar': 'الفن 2',
      'es': 'Arte2',
      'fr': 'Art2',
      'sw': 'Sanaa2',
    },
    'rh97ml0k': {
      'en': 'Art3',
      'ar': 'الفن 3',
      'es': 'Arte3',
      'fr': 'Art3',
      'sw': 'Sanaa ya 3',
    },
    'rtt0s3ia': {
      'en': 'Password',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    'v3sxop9c': {
      'en': '111111',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    'qx03qhyp': {
      'en': '',
      'ar':
          'لكي تتمكن من التقاط صورة أو مقطع فيديو، يتطلب هذا التطبيق الإذن للوصول إلى الكاميرا.',
      'es':
          'Para tomar una fotografía o un vídeo, esta aplicación requiere permiso para acceder a la cámara.',
      'fr':
          'Pour prendre une photo ou une vidéo, cette application nécessite une autorisation d\'accès à l\'appareil photo.',
      'sw':
          'Ili kupiga picha au video, programu hii inahitaji ruhusa ya kufikia kamera.',
    },
    'yern1xc3': {
      'en': '',
      'ar':
          'لتسجيل الصوت للفيديو، يتطلب هذا التطبيق الإذن للوصول إلى الميكروفون.',
      'es':
          'Para grabar audio para video, esta aplicación requiere permiso para acceder al micrófono.',
      'fr':
          'Afin d\'enregistrer l\'audio d\'une vidéo, cette application nécessite l\'autorisation d\'accéder au microphone.',
      'sw':
          'Ili kurekodi sauti ya video, programu hii inahitaji ruhusa ya kufikia maikrofoni.',
    },
    'qpnabqqh': {
      'en': '',
      'ar':
          'لكي يتمكن هذا التطبيق من تحميل البيانات، فإنه يحتاج إلى إذن للوصول إلى مكتبة الصور.',
      'es':
          'Para cargar datos, esta aplicación requiere permiso para acceder a la biblioteca de fotos.',
      'fr':
          'Afin de télécharger des données, cette application nécessite une autorisation d\'accès à la photothèque.',
      'sw':
          'Ili kupakia data, programu hii inahitaji ruhusa ya kufikia maktaba ya picha.',
    },
    'zjkwl8p2': {
      'en': 'This app requires contacts access to function properly.',
      'ar': 'يتطلب هذا التطبيق الوصول إلى جهات الاتصال ليعمل بشكل صحيح.',
      'es':
          'Esta aplicación requiere acceso a los contactos para funcionar correctamente.',
      'fr':
          'Cette application nécessite l\'accès aux contacts pour fonctionner correctement.',
      'sw':
          'Programu hii inahitaji ufikiaji wa anwani ili kufanya kazi vizuri.',
    },
    'd87k0ap6': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    '5uwt6n9y': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    'l46gqdxp': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    'hxhmmu6e': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    'ag0mlb7c': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    'fcu9zsgb': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    'mi1gwhj1': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    'vhpv466y': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    '0tfvavw5': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    'i0ayvchq': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    '12fpoh0h': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    'mqo0fjf7': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    'pbruw4is': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    '2ds938sx': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    'f8wsmlub': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    'aa27z1n2': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    'rz28dduj': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    'cq43nzjx': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    'bpv17yg3': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    'xw4eb2cb': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    'h9ohlmo6': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    'expiyj8r': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    'mbakdgif': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    '3ystj7r4': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
    'y65cdfga': {
      'en': '',
      'ar': '',
      'es': '',
      'fr': '',
      'sw': '',
    },
  },
].reduce((a, b) => a..addAll(b));
