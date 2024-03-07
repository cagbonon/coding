import 'package:coding/model/album.dart';

Future<List<Album>> getAllAlbums(List<dynamic> jsonData) async {
  List<Album> albums =
        jsonData.map((json) => Album.fromJson(json)).toList();
  return albums;
}
