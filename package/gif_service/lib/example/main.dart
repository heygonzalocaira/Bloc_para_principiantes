import 'package:gif_service/gif_service.dart';

void main() async {
  final gifService = GifService();
  final urls = await gifService.fetchGifs();
  for (final url in urls) {
    print(url);
  }
}
