
import 'package:coding/model/comment.dart';

Future<List<Comment>> getAllComment(List<dynamic> jsonData) async {
  List<Comment> albums =
        jsonData.map((json) => Comment.fromJson(json)).toList();
  return albums;
}
