class Data {
  DateTime? time = DateTime(2021, 4, 21);
  int aqi = 10;
  double co2 = 205, co = 10, pm = 3, temperature = 32.1, humidity = 60;
  Data({this.aqi = 10, this.time});

  factory Data.fromJson(Map<String, dynamic> json) {
    if (json == null) return Data();
    Data data = Data();
    data.aqi = json['aqi'];
    data.time = DateTime.fromMillisecondsSinceEpoch(json['time'] as int);
    data.co2 = json['co2'];
    data.co = json['co'];
    data.pm = json['pm'];
    data.temperature = json['temperature'];
    data.humidity = json['humidity'];
    return data;
  }

}