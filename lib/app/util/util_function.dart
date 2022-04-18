extension FormatDuration on Duration {
  String formatDuration() {
    var seconds = inSeconds;
    final days = seconds ~/ Duration.secondsPerDay;
    seconds -= days * Duration.secondsPerDay;
    final hours = seconds ~/ Duration.secondsPerHour;
    seconds -= hours * Duration.secondsPerHour;
    final minutes = seconds ~/ Duration.secondsPerMinute;
    seconds -= minutes * Duration.secondsPerMinute;

    final List<String> tokens = [];
    if (days != 0) {
      tokens.add('$days يوم');
    }
    if (tokens.isNotEmpty || hours != 0) {
      tokens.add('$hours س');
    }
    if (tokens.isNotEmpty || minutes != 0) {
      tokens.add('$minutes د');
    }
    // tokens.add('$seconds s');

    return tokens.join(' : ');
  }
}

String getVerseEndSymbol(int? verseNumber) {
  var arabicNumeric = '';
  var digits = verseNumber.toString().split("").toList();

  for (var e in digits) {
    if (e == "0") {
      arabicNumeric += "٠";
    }
    if (e == "1") {
      arabicNumeric += "۱";
    }
    if (e == "2") {
      arabicNumeric += "۲";
    }
    if (e == "3") {
      arabicNumeric += "۳";
    }
    if (e == "4") {
      arabicNumeric += "٤";
    }
    if (e == "5") {
      arabicNumeric += "۵";
    }
    if (e == "6") {
      arabicNumeric += "٦";
    }
    if (e == "7") {
      arabicNumeric += "۷";
    }
    if (e == "8") {
      arabicNumeric += "۸";
    }
    if (e == "9") {
      arabicNumeric += "۹";
    }
  }

  return arabicNumeric.toString();
}
