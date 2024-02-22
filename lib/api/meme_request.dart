import 'package:json_annotation/json_annotation.dart';



@JsonSerializable()
class MemeRequest {
  List<String> text;
  bool redirect;

  MemeRequest({required this.text, required this.redirect});

  Map<String, dynamic> toJson() {
    return {'text': text, 'redirect': redirect};
  }
}
