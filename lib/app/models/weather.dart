// models/weather_model.dart

class Weather {
  final Location location;
  final Current current;

  Weather({required this.location, required this.current});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      location: Location.fromJson(json['location']),
      current: Current.fromJson(json['current']),
    );
  }
}

class Location {
  final String name;
  final String region;
  final String country;
  final double lat;
  final double lon;
  final String localtime;

  Location({
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
    required this.localtime,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      name: json['name'],
      region: json['region'],
      country: json['country'],
      lat: json['lat'],
      lon: json['lon'],
      localtime: json['localtime'],
    );
  }
}

class Current {
  final double tempC;
  final String conditionText;
  final String conditionIcon;

  Current({
    required this.tempC,
    required this.conditionText,
    required this.conditionIcon,
  });

  factory Current.fromJson(Map<String, dynamic> json) {
    return Current(
      tempC: json['temp_c'],
      conditionText: json['condition']['text'],
      conditionIcon: json['condition']['icon'],
    );
  }
}
