class WeatherForecastModel {
  Location? location;
  Current? current;

  WeatherForecastModel({this.location, this.current});

  WeatherForecastModel.fromJson(Map<String, dynamic> json) {
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    current =
        json['current'] != null ? Current.fromJson(json['current']) : null;
  }
}

class Location {
  String? name;
  String? region;
  String? country;
  double? lat;
  double? lon;
  String? tzId;
  int? localtimeEpoch;
  String? localtime;

  Location(
      {this.name,
      this.region,
      this.country,
      this.lat,
      this.lon,
      this.tzId,
      this.localtimeEpoch,
      this.localtime});

  Location.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    region = json['region'];
    country = json['country'];
    lat = json['lat'];
    lon = json['lon'];
    tzId = json['tz_id'];
    localtimeEpoch = json['localtime_epoch'];
    localtime = json['localtime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['region'] = region;
    data['country'] = country;
    data['lat'] = lat;
    data['lon'] = lon;
    data['tz_id'] = tzId;
    data['localtime_epoch'] = localtimeEpoch;
    data['localtime'] = localtime;
    return data;
  }
}

class Current {
  double? tempC;
  double? tempF;
  int? isDay;
  Condition? condition;

  Current({
    this.tempC,
    this.tempF,
    this.isDay,
    this.condition,
  });

  Current.fromJson(Map<String, dynamic> json) {
    // lastUpdatedEpoch = json['last_updated_epoch'];
    // lastUpdated = json['last_updated'];
    tempC = json['temp_c'];
    tempF = json['temp_f'];
    isDay = json['is_day'];
    condition = json['condition'] != null
        ? Condition.fromJson(json['condition'])
        : null;
    // windMph = json['wind_mph'];
    // windKph = json['wind_kph'];
    // windDegree = json['wind_degree'];
    // windDir = json['wind_dir'];
    // pressureMb = json['pressure_mb'];
    // pressureIn = json['pressure_in'];
    // precipMm = json['precip_mm'];
    // precipIn = json['precip_in'];
    // humidity = json['humidity'];
    // cloud = json['cloud'];
    // feelslikeC = json['feelslike_c'];
    // feelslikeF = json['feelslike_f'];
    // windchillC = json['windchill_c'];
    // windchillF = json['windchill_f'];
    // heatindexC = json['heatindex_c'];
    // heatindexF = json['heatindex_f'];
    // dewpointC = json['dewpoint_c'];
    // dewpointF = json['dewpoint_f'];
    // visKm = json['vis_km'];
    // visMiles = json['vis_miles'];
    // uv = json['uv'];
    // gustMph = json['gust_mph'];
    // gustKph = json['gust_kph'];
  }
}

class Condition {
  String? text;
  String? icon;
  int? code;

  Condition({this.text, this.icon, this.code});

  Condition.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    icon = json['icon'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['text'] = text;
    data['icon'] = icon;
    data['code'] = code;
    return data;
  }
}
