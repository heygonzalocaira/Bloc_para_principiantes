// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:gif_repository/src/models/gif_model.dart';
import 'package:gif_service/gif_service.dart';

/// {@template gif_repository}
/// My new Flutter package
/// {@endtemplate}
class GifRepository {
  /// {@macro gif_repository}
  GifRepository({GifService? gifService})
      : _gifService = gifService ?? GifService();

  final GifService _gifService;

  Future<List<GifModel>> getUrls() async {
    final urls = <GifModel>[];
    try {
      final listUrls = await _gifService.fetchGifs();
      for (final url in listUrls) {
        urls.add(GifModel(url));
      }
      return urls;
    } catch (_) {
      throw Exception();
    }
  }
}
