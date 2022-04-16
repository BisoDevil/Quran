// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(count) => "${count} Ayat";

  static String m1(duration) => "from ${duration}";

  static String m2(duration) => "in ${duration} m";

  static String m3(info) => "Last read ${info}";

  static String m4(repeat) => "${repeat} times";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "asr": MessageLookupByLibrary.simpleMessage("Asr"),
        "azkarAlmasa": MessageLookupByLibrary.simpleMessage("Azkar Almasa"),
        "azkarAlsabah": MessageLookupByLibrary.simpleMessage("Azkar Alsabah"),
        "bookmark": MessageLookupByLibrary.simpleMessage("Bookmark"),
        "countAyat": m0,
        "dhuhr": MessageLookupByLibrary.simpleMessage("Dhuhr"),
        "doaaFromSunna":
            MessageLookupByLibrary.simpleMessage("Doaa from sunna"),
        "explaination": MessageLookupByLibrary.simpleMessage("Explaination"),
        "fajr": MessageLookupByLibrary.simpleMessage("Fajr"),
        "fromDuration": m1,
        "inDurationM": m2,
        "information": MessageLookupByLibrary.simpleMessage("Information"),
        "isha": MessageLookupByLibrary.simpleMessage("Isha"),
        "khatma": MessageLookupByLibrary.simpleMessage("Khatma"),
        "lastReadInfo": m3,
        "location": MessageLookupByLibrary.simpleMessage("Location"),
        "maghrib": MessageLookupByLibrary.simpleMessage("Maghrib"),
        "prayerTime": MessageLookupByLibrary.simpleMessage("Prayer time"),
        "quran": MessageLookupByLibrary.simpleMessage("Quran"),
        "repeatTimes": m4,
        "share": MessageLookupByLibrary.simpleMessage("Share"),
        "youreDone": MessageLookupByLibrary.simpleMessage("You\'re done!")
      };
}
