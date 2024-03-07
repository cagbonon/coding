import 'package:coding/model/photo.dart';

Future<List<Photo>> getAllPhotos(List<dynamic> jsonData) async {
  List<Photo> photo = jsonData.map((json) => Photo.fromJson(json)).toList();
  return photo;
}
