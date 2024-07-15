// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Weatherdetails {
  final Location location;
  final Current current;
  Weatherdetails({
    required this.location,
    required this.current,
  });

  Weatherdetails copyWith({
    Location? location,
    Current? current,
  }) {
    return Weatherdetails(
      location: location ?? this.location,
      current: current ?? this.current,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'location': location.toMap(),
      'current': current.toMap(),
    };
  }

  factory Weatherdetails.fromMap(Map<String, dynamic> map) {
    return Weatherdetails(
      location: Location.fromMap(map['location'] as Map<String, dynamic>),
      current: Current.fromMap(map['current'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Weatherdetails.fromJson(String source) =>
      Weatherdetails.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Weatherdetails(location: $location, current: $current)';

  @override
  bool operator ==(covariant Weatherdetails other) {
    if (identical(this, other)) return true;

    return other.location == location && other.current == current;
  }

  @override
  int get hashCode => location.hashCode ^ current.hashCode;
}

class Location {
  final String name;
  final String region;
  final String country;
  final double lat;
  final double lon;
  final String tzId;
  final int localtimeEpoch;
  final String localtime;
  Location({
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
    required this.tzId,
    required this.localtimeEpoch,
    required this.localtime,
  });

  Location copyWith({
    String? name,
    String? region,
    String? country,
    double? lat,
    double? lon,
    String? tzId,
    int? localtimeEpoch,
    String? localtime,
  }) {
    return Location(
      name: name ?? this.name,
      region: region ?? this.region,
      country: country ?? this.country,
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
      tzId: tzId ?? this.tzId,
      localtimeEpoch: localtimeEpoch ?? this.localtimeEpoch,
      localtime: localtime ?? this.localtime,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'region': region,
      'country': country,
      'lat': lat,
      'lon': lon,
      'tzId': tzId,
      'localtimeEpoch': localtimeEpoch,
      'localtime': localtime,
    };
  }

  // factory Location.fromMap(Map<String, dynamic> map) {
  //   return Location(
  //     name: map['name'] as String,
  //     region: map['region'] as String,
  //     country: map['country'] as String,
  //     lat: map['lat'] as double,
  //     lon: map['lon'] as double,
  //     tzId: map['tzId'] as String,
  //     localtimeEpoch: map['localtimeEpoch'] as int,
  //     localtime: map['localtime'] as String,
  //   );
  // }
  factory Location.fromMap(Map<String, dynamic> map) {
    return Location(
      name: map['name'] ?? 'Unknown', // Providing a default value if null
      region: map['region'] as String? ?? '', // Another pattern using safe cast
      country: map['country'] ?? 'Unknown',
      lat: map['lat'] as double? ?? 0.0, // Assuming 0.0 as a sensible default
      lon: map['lon'] as double? ?? 0.0,
      tzId: map['tzId'] ?? 'Unknown',
      localtimeEpoch: map['localtimeEpoch'] as int? ?? 0,
      localtime: map['localtime'] as String? ?? 'Unknown',
    );
  }

  String toJson() => json.encode(toMap());

  factory Location.fromJson(String source) =>
      Location.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Location(name: $name, region: $region, country: $country, lat: $lat, lon: $lon, tzId: $tzId, localtimeEpoch: $localtimeEpoch, localtime: $localtime)';
  }

  @override
  bool operator ==(covariant Location other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.region == region &&
        other.country == country &&
        other.lat == lat &&
        other.lon == lon &&
        other.tzId == tzId &&
        other.localtimeEpoch == localtimeEpoch &&
        other.localtime == localtime;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        region.hashCode ^
        country.hashCode ^
        lat.hashCode ^
        lon.hashCode ^
        tzId.hashCode ^
        localtimeEpoch.hashCode ^
        localtime.hashCode;
  }
}

class Current {
  final int lastUpdatedEpoch;
  final String lastUpdated;
  final double tempC;
  final double tempF;
  final int isDay;
  final Condition condition;
  Current({
    required this.lastUpdatedEpoch,
    required this.lastUpdated,
    required this.tempC,
    required this.tempF,
    required this.isDay,
    required this.condition,
  });

  Current copyWith({
    int? lastUpdatedEpoch,
    String? lastUpdated,
    double? tempC,
    double? tempF,
    int? isDay,
    Condition? condition,
  }) {
    return Current(
      lastUpdatedEpoch: lastUpdatedEpoch ?? this.lastUpdatedEpoch,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      tempC: tempC ?? this.tempC,
      tempF: tempF ?? this.tempF,
      isDay: isDay ?? this.isDay,
      condition: condition ?? this.condition,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'lastUpdatedEpoch': lastUpdatedEpoch,
      'lastUpdated': lastUpdated,
      'tempC': tempC,
      'tempF': tempF,
      'isDay': isDay,
      'condition': condition.toMap(),
    };
  }

  // factory Current.fromMap(Map<String, dynamic> map) {
  //   return Current(
  //     lastUpdatedEpoch: map['lastUpdatedEpoch'] as int,
  //     lastUpdated: map['lastUpdated'] as String,
  //     tempC: map['tempC'] as double,
  //     tempF: map['tempF'] as double,
  //     isDay: map['isDay'] as int,
  //     condition: Condition.fromMap(map['condition'] as Map<String, dynamic>),
  //   );
  // }
  // factory Current.fromMap(Map<String, dynamic> map) {
  //   return Current(
  //     lastUpdatedEpoch: map['lastUpdatedEpoch'] as int? ?? 0,
  //     lastUpdated: map['lastUpdated'] as String? ?? 'Unknown',
  //     tempC: map['tempC'] as double? ?? 0.0,
  //     tempF: map['tempF'] as double? ?? 0.0,
  //     isDay: map['isDay'] as int? ?? 0,
  //     condition:
  //         Condition.fromMap(map['condition'] as Map<String, dynamic>? ?? {}),
  //   );
  // }
  factory Current.fromMap(Map<String, dynamic> map) {
    return Current(
      lastUpdatedEpoch: map['last_updated_epoch'] as int? ?? 0,
      lastUpdated: map['last_updated'] as String? ?? 'Unknown',
      tempC: map['temp_c'] as double? ?? 0.0,
      tempF: map['temp_f'] as double? ?? 0.0,
      isDay: map['is_day'] as int? ?? 0,
      condition:
          Condition.fromMap(map['condition'] as Map<String, dynamic>? ?? {}),
    );
  }

  String toJson() => json.encode(toMap());

  factory Current.fromJson(String source) =>
      Current.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Current(lastUpdatedEpoch: $lastUpdatedEpoch, lastUpdated: $lastUpdated, tempC: $tempC, tempF: $tempF, isDay: $isDay, condition: $condition)';
  }

  @override
  bool operator ==(covariant Current other) {
    if (identical(this, other)) return true;

    return other.lastUpdatedEpoch == lastUpdatedEpoch &&
        other.lastUpdated == lastUpdated &&
        other.tempC == tempC &&
        other.tempF == tempF &&
        other.isDay == isDay &&
        other.condition == condition;
  }

  @override
  int get hashCode {
    return lastUpdatedEpoch.hashCode ^
        lastUpdated.hashCode ^
        tempC.hashCode ^
        tempF.hashCode ^
        isDay.hashCode ^
        condition.hashCode;
  }
}

class Condition {
  final String text;
  final String icon;
  final int code;
  Condition({
    required this.text,
    required this.icon,
    required this.code,
  });

  Condition copyWith({
    String? text,
    String? icon,
    int? code,
  }) {
    return Condition(
      text: text ?? this.text,
      icon: icon ?? this.icon,
      code: code ?? this.code,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'text': text,
      'icon': icon,
      'code': code,
    };
  }

  factory Condition.fromMap(Map<String, dynamic> map) {
    return Condition(
      text: map['text'] as String? ?? 'Unknown',
      icon: map['icon'] as String? ?? '',
      code: map['code'] as int? ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Condition.fromJson(String source) =>
      Condition.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Condition(text: $text, icon: $icon, code: $code)';

  @override
  bool operator ==(covariant Condition other) {
    if (identical(this, other)) return true;

    return other.text == text && other.icon == icon && other.code == code;
  }

  @override
  int get hashCode => text.hashCode ^ icon.hashCode ^ code.hashCode;
}
