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
