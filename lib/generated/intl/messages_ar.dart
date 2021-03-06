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

  static String m0(count) => "${count} ايه";

  static String m1(duration) => "منذ ${duration}";

  static String m2(duration) => "خلال ${duration}";

  static String m3(info) => "اخر قراءة ${info}";

  static String m4(repeat) => "${repeat} مرات";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "asr": MessageLookupByLibrary.simpleMessage("العصر"),
        "azkarAlmasa": MessageLookupByLibrary.simpleMessage("اذكار المساء"),
        "azkarAlsabah": MessageLookupByLibrary.simpleMessage("اذكار الصباح"),
        "bookmark": MessageLookupByLibrary.simpleMessage("حفظ"),
        "countAyat": m0,
        "dhuhr": MessageLookupByLibrary.simpleMessage("الظهر"),
        "doaaFromSunna": MessageLookupByLibrary.simpleMessage("ادعية من السنة"),
        "explaination": MessageLookupByLibrary.simpleMessage("تفسير"),
        "fajr": MessageLookupByLibrary.simpleMessage("الفجر"),
        "fromDuration": m1,
        "inDurationM": m2,
        "information": MessageLookupByLibrary.simpleMessage("معلومات"),
        "isha": MessageLookupByLibrary.simpleMessage("العشاء"),
        "khatma": MessageLookupByLibrary.simpleMessage("الختمة"),
        "lastReadInfo": m3,
        "location": MessageLookupByLibrary.simpleMessage("الموقع"),
        "maghrib": MessageLookupByLibrary.simpleMessage("المغرب"),
        "prayerTime": MessageLookupByLibrary.simpleMessage("اوقات الصلاه"),
        "quran": MessageLookupByLibrary.simpleMessage("القران"),
        "repeatTimes": m4,
        "share": MessageLookupByLibrary.simpleMessage("مشاركة"),
        "startYoutKhatma": MessageLookupByLibrary.simpleMessage("ابدا الختمه"),
        "youreDone": MessageLookupByLibrary.simpleMessage("اكتمل يومك")
      };
}
