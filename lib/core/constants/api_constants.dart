class ApiConstants {
  static const apiKey = "27eed7952e504180b01151056231112";
  static const apiBaseUrl = "http://api.weatherapi.com/v1/current.json";
  static String getBaseUrl({required String location}) {
    return "$apiBaseUrl?key=$apiKey&q=$location&aqi=yes";
  }
}
