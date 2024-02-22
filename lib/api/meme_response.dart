import 'package:json_annotation/json_annotation.dart';



@JsonSerializable()
class MemeResponse {
  String url;

  MemeResponse({required this.url});

  factory MemeResponse.fromJson(Map<String, dynamic> json) {
    return MemeResponse(url: json['url']);
  }
}
