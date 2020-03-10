class Stats {
  Confirmed confirmed;
  Death deaths;
  Latest latest;
  Recovered recovered;
}

class Confirmed {
  String lastUpdated;
  int latest;
  List<dynamic> locations; //StatLocation
  String source;

  Confirmed(this.lastUpdated, this.latest, this.locations, this.source);

  Confirmed.fromJson(Map<String, dynamic> json)
      : lastUpdated = json['last_updated'],
        latest = json['latest'],
        locations = json['locations'],
        source = json['source'];
}

//class StatLocation {
//  StatCoordinates coordinates;
//  String country;
//  String countryCode;
//  Map<String, String> history;
//  int latest;
//  String province;
//
//  StatLocation(this.coordinates, this.country, this.countryCode, this.history,
//      this.latest, this.province);
//
//  StatLocation.fromJson(Map<String, dynamic> json)
//      : coordinates = json['coordinates'],
//        country = json['country'],
//        countryCode = json['country_code'],
//        history = json['history'],
//        latest = json['latest'],
//        province = json['province'];
//}
//
//class StatCoordinates {
//  String lat;
//  String long;
//
//  StatCoordinates(this.lat, this.long);
//
//  StatCoordinates.fromJson(Map<String, dynamic> json)
//      : lat = json['lat'],
//        long = json['long'];
//}

class Death {}

class Latest {
  int confirmed;
  int deaths;
  int recovered;

  Latest(this.confirmed, this.deaths, this.recovered);

  Latest.fromJson(Map<String, dynamic> json)
      : confirmed = json['confirmed'],
        deaths = json['deaths'],
        recovered = json['recovered'];
}

class Recovered {}
