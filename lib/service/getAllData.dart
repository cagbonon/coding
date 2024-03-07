import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<dynamic>> getALlData(String? endpoint) async {
  List<dynamic> jsonData = [];
  var url =
      Uri.http("jsonplaceholder.typicode.com", "/${endpoint!}");

  var response = await http.get(
    url,
    headers: {
      'Content-Type': 'application/json'
    }, /*body: jsonEncode(resquetdata)*/
  );

  if (response.statusCode == 200) {
    print("Succes");
    jsonData = json.decode(response.body);
  }
  return jsonData;
}


