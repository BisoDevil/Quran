class AdhanTime {
  AdhanTime({
    required this.fajr,
    required this.dhuhr,
    required this.asr,
    required this.maghrib,
    required this.isha,
  });

  final DateTime fajr;

  final DateTime dhuhr;
  final DateTime asr;

  final DateTime maghrib;
  final DateTime isha;

  factory AdhanTime.fromJson(Map<String, dynamic> json) => AdhanTime(
        fajr: DateTime(
          int.parse(json['data']['date']['gregorian']['year']),
          json['data']['date']['gregorian']['month']['number'],
          int.parse(json['data']['date']['gregorian']['day']),
          int.parse(json['data']['timings']["Fajr"].split(":").first),
          int.parse(json['data']['timings']["Fajr"].split(":").last),
        ),
        dhuhr: DateTime(
          int.parse(json['data']['date']['gregorian']['year']),
          json['data']['date']['gregorian']['month']['number'],
          int.parse(json['data']['date']['gregorian']['day']),
          int.parse(json['data']['timings']["Dhuhr"].split(":").first),
          int.parse(json['data']['timings']["Dhuhr"].split(":").last),
        ),
        asr: DateTime(
          int.parse(json['data']['date']['gregorian']['year']),
          json['data']['date']['gregorian']['month']['number'],
          int.parse(json['data']['date']['gregorian']['day']),
          int.parse(json['data']['timings']["Asr"].split(":").first),
          int.parse(json['data']['timings']["Asr"].split(":").last),
        ),
        maghrib: DateTime(
          int.parse(json['data']['date']['gregorian']['year']),
          json['data']['date']['gregorian']['month']['number'],
          int.parse(json['data']['date']['gregorian']['day']),
          int.parse(json['data']['timings']["Maghrib"].split(":").first),
          int.parse(json['data']['timings']["Maghrib"].split(":").last),
        ),
        isha: DateTime(
          int.parse(json['data']['date']['gregorian']['year']),
          json['data']['date']['gregorian']['month']['number'],
          int.parse(json['data']['date']['gregorian']['day']),
          int.parse(json['data']['timings']["Isha"].split(":").first),
          int.parse(json['data']['timings']["Isha"].split(":").last),
        ),
      );

  Map<String, dynamic> toJson() => {
        "Fajr": fajr,
        "Dhuhr": dhuhr,
        "Asr": asr,
        "Maghrib": maghrib,
        "Isha": isha,
      };
}
