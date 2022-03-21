import 'package:flutter_test/flutter_test.dart';
import 'package:quran/app/data/providers/adhan_time_provider.dart';

void main() {
  test('Time test', () async {
    var sd = await AdhanTimeProvider()
        .getAdhanTime(30.15974028753232, 31.762421582349663, DateTime.now());
    var sdsd = formatDuration(
        sd!.fajr.add(Duration(days: 1)).difference(DateTime.now()));
    print(sdsd);
  });
}

String formatDuration(Duration d) {
  var seconds = d.inSeconds;
  final days = seconds ~/ Duration.secondsPerDay;
  seconds -= days * Duration.secondsPerDay;
  final hours = seconds ~/ Duration.secondsPerHour;
  seconds -= hours * Duration.secondsPerHour;
  final minutes = seconds ~/ Duration.secondsPerMinute;
  seconds -= minutes * Duration.secondsPerMinute;

  final List<String> tokens = [];
  if (days != 0) {
    tokens.add('${days}d');
  }
  if (tokens.isNotEmpty || hours != 0) {
    tokens.add('${hours}h');
  }
  if (tokens.isNotEmpty || minutes != 0) {
    tokens.add('${minutes}m');
  }
  tokens.add('${seconds}s');

  return tokens.join(':');
}
