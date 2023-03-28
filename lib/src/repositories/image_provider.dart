import 'dart:typed_data';
import 'package:http/http.dart';
import 'package:pixel_perfect/src/models/photos.dart';
import 'package:pixel_perfect/src/repositories/state.dart';
import 'dart:convert';

class ImageProvider {
  //Singleton
  static final ImageProvider _imageProvider = ImageProvider._private();
  ImageProvider._private();
  factory ImageProvider() => _imageProvider;

  Client _client = Client();
  static const String _apiKey = "access key";
  static const String _baseUrl = "api.unsplash.com";

  //Get list of images based on the query
  Future<State> getImagesByName(String query) async {
    Response response;
    if (_apiKey == 'api-key') {
      return State<String>.error("Please enter your API Key");
    }
    response = await _client.get(Uri.https(_baseUrl, "/search/photos", {
      "page": "1", // page number
      "per_page": "100", // number of items per page
      "query": query,
      "client_id": _apiKey
    }));
    if (response.statusCode == 200)
      return State<Photos>.success(Photos.fromMap(json.decode(response.body)));
    else
      return State<String>.error(response.statusCode.toString());
  }

  Future<Uint8List> getImageFromUrl(String url) async {
    var response = await _client.get(Uri.parse(url));
    Uint8List bytes = response.bodyBytes;
    return bytes;
  }
}
