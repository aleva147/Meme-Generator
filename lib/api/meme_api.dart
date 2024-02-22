import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import 'meme_request.dart';
import 'meme_response.dart';



class MemeApi {
  static Future<MemeResponse> generateMeme(
      String imageId, MemeRequest request) async {
    var url = Uri.https('api.memegen.link', '/templates/$imageId');

    final response = await http.post(url, body: jsonEncode(request));

    if (response.statusCode == 201) {
      final meme = MemeResponse.fromJson(json.decode(response.body));
      return meme;
    } else {
      throw Exception('Failed to generate meme');
    }
  }

  static Future<void> shareMeme(String meme, filePath) async {
    final uri = Uri.parse(meme);
    final response = await http.get(uri);
    final imageBytes = response.bodyBytes;
    final directory = await getTemporaryDirectory();
    final path = '${directory.path}/$filePath';
    File(path).writeAsBytes(imageBytes);
    Share.shareXFiles([XFile(path)], text: "");
  }
}
