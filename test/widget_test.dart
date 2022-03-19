import 'package:flutter_test/flutter_test.dart';
import 'package:quran/app/data/providers/adhan_time_provider.dart';

void main() {
  test('Time test', () async {
    var sd = await AdhanTimeProvider()
        .getAdhanTime(30.15974028753232, 31.762421582349663);

    print(sd?.asr);
  });
}
