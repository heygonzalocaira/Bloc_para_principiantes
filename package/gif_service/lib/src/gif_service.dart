// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.
import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;

/// {@template gif_service}
/// My Gif service
/// {@endtemplate}
class GifService {
  /// {@macro gif_service}
  GifService({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  final http.Client _httpClient;
  final String baseUrl = "api.giphy.com";
  final String endPoint = '/v1/gifs/trending';

  // TODO: Copia aqui tu APi Key
  final String apiKey = '';

  Future<List<String>> fetchGifs() async {
    final uri = Uri.http(baseUrl, endPoint, {'api_key': apiKey});

    http.Response response;
    List body;
    try {
      response = await _httpClient.get(uri);
    } on Exception {
      throw Exception();
    }
    if (response.statusCode != 200) {
      throw HttpRequestException();
    }
    try {
      body = jsonDecode(response.body)['data'] as List;
    } on Exception {
      throw JsonDecodeException();
    }
    return body
        .map((url) => url['images']['original']['url'].toString())
        .toList();
  }
}

class HttpRequestException implements Exception {}

class JsonDecodeException implements Exception {}
