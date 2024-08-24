import 'dart:convert';

class AppConfig {
  final String baseURL;
  final String zipApiURL;
  final String apikey;
  final String iamgeBaseURL;

  AppConfig(
      {required this.baseURL,
      required this.apikey,
      required this.zipApiURL,
      required this.iamgeBaseURL});

  Map<String, dynamic> toMap() {
    return {
      'baseURL': baseURL,
      'apikey': apikey,
      'zipApiURL': zipApiURL,
      'imageBaseURL': iamgeBaseURL
    };
  }

  factory AppConfig.fromMap(Map<String, dynamic> map) {
    return AppConfig(
        baseURL: map['baseURL'] ?? '',
        apikey: map['apikey'] ?? '',
        iamgeBaseURL: map['imageBaseURL'] ?? '',
        zipApiURL: map['geoBaseURL'] ?? '');
  }

  String toJson() => json.encode(toMap());

  factory AppConfig.fromJson(String source) =>
      AppConfig.fromMap(json.decode(source));
}
