import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Artist with ChangeNotifier {
  final int id;
  final String imageUrl;
  final String name;

  Artist(this.id, this.imageUrl, this.name);

  Future<void> getArtistById(int id) async {
    print('object');
  }
}
