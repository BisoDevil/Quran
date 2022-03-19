class Azkar {
  late String zekr;
  late int repeat;
  late String bless;

  Azkar.fromJson(Map<String, dynamic> json) {
    zekr = json['zekr'];
    repeat = json['repeat'];
    bless = json['bless'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['zekr'] = zekr;
    data['repeat'] = repeat;
    data['bless'] = bless;
    return data;
  }
}
