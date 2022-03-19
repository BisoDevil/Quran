// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ar locale. All the
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
  String get localeName => 'ar';

  static String m0(duration) => "خلال ${duration} د";

  static String m1(info) => "Last read ${info}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "asr": MessageLookupByLibrary.simpleMessage("asr"),
        "azkarAlmasa": MessageLookupByLibrary.simpleMessage("Azkar Almasa"),
        "azkarAlsabah": MessageLookupByLibrary.simpleMessage("Azkar Alsabah"),
        "dhuhr": MessageLookupByLibrary.simpleMessage("dhuhr"),
        "doaaFromSunna":
            MessageLookupByLibrary.simpleMessage("Doaa from sunna"),
        "fajr": MessageLookupByLibrary.simpleMessage("fajr"),
        "inDurationM": m0,
        "information": MessageLookupByLibrary.simpleMessage("Information"),
        "isha": MessageLookupByLibrary.simpleMessage("isha"),
        "khatma": MessageLookupByLibrary.simpleMessage("Khatma"),
        "lastReadInfo": m1,
        "location": MessageLookupByLibrary.simpleMessage("Location"),
        "maghrib": MessageLookupByLibrary.simpleMessage("maghrib"),
        "quran": MessageLookupByLibrary.simpleMessage("Quran")
      };
}
