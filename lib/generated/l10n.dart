// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `in {duration} m`
  String inDurationM(Object duration) {
    return Intl.message(
      'in $duration m',
      name: 'inDurationM',
      desc: '',
      args: [duration],
    );
  }

  /// `Quran`
  String get quran {
    return Intl.message(
      'Quran',
      name: 'quran',
      desc: '',
      args: [],
    );
  }

  /// `Azkar Alsabah`
  String get azkarAlsabah {
    return Intl.message(
      'Azkar Alsabah',
      name: 'azkarAlsabah',
      desc: '',
      args: [],
    );
  }

  /// `Azkar Almasa`
  String get azkarAlmasa {
    return Intl.message(
      'Azkar Almasa',
      name: 'azkarAlmasa',
      desc: '',
      args: [],
    );
  }

  /// `Doaa from sunna`
  String get doaaFromSunna {
    return Intl.message(
      'Doaa from sunna',
      name: 'doaaFromSunna',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get location {
    return Intl.message(
      'Location',
      name: 'location',
      desc: '',
      args: [],
    );
  }

  /// `Information`
  String get information {
    return Intl.message(
      'Information',
      name: 'information',
      desc: '',
      args: [],
    );
  }

  /// `Fajr`
  String get fajr {
    return Intl.message(
      'Fajr',
      name: 'fajr',
      desc: '',
      args: [],
    );
  }

  /// `Dhuhr`
  String get dhuhr {
    return Intl.message(
      'Dhuhr',
      name: 'dhuhr',
      desc: '',
      args: [],
    );
  }

  /// `Asr`
  String get asr {
    return Intl.message(
      'Asr',
      name: 'asr',
      desc: '',
      args: [],
    );
  }

  /// `Maghrib`
  String get maghrib {
    return Intl.message(
      'Maghrib',
      name: 'maghrib',
      desc: '',
      args: [],
    );
  }

  /// `Isha`
  String get isha {
    return Intl.message(
      'Isha',
      name: 'isha',
      desc: '',
      args: [],
    );
  }

  /// `Khatma`
  String get khatma {
    return Intl.message(
      'Khatma',
      name: 'khatma',
      desc: '',
      args: [],
    );
  }

  /// `Last read {info}`
  String lastReadInfo(Object info) {
    return Intl.message(
      'Last read $info',
      name: 'lastReadInfo',
      desc: '',
      args: [info],
    );
  }

  /// `You're done!`
  String get youreDone {
    return Intl.message(
      'You\'re done!',
      name: 'youreDone',
      desc: '',
      args: [],
    );
  }

  /// `{count} Ayat`
  String countAyat(Object count) {
    return Intl.message(
      '$count Ayat',
      name: 'countAyat',
      desc: '',
      args: [count],
    );
  }

  /// `{repeat} times`
  String repeatTimes(Object repeat) {
    return Intl.message(
      '$repeat times',
      name: 'repeatTimes',
      desc: '',
      args: [repeat],
    );
  }

  /// `Share`
  String get share {
    return Intl.message(
      'Share',
      name: 'share',
      desc: '',
      args: [],
    );
  }

  /// `Bookmark`
  String get bookmark {
    return Intl.message(
      'Bookmark',
      name: 'bookmark',
      desc: '',
      args: [],
    );
  }

  /// `Prayer time`
  String get prayerTime {
    return Intl.message(
      'Prayer time',
      name: 'prayerTime',
      desc: '',
      args: [],
    );
  }

  /// `from {duration}`
  String fromDuration(Object duration) {
    return Intl.message(
      'from $duration',
      name: 'fromDuration',
      desc: '',
      args: [duration],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
