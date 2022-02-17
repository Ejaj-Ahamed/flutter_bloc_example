import 'package:bloc_test/Models/PostsModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static Future<List<PostsModel>> fetchPosts() async {
    var client = http.Client();
    var response = await client.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
    );
    if (response.statusCode == 200) {
      var jsonString = response.body;
      var res = json.decode(jsonString);
      return postmodelsToJson(jsonString);
    } else {
      print("error message" + response.toString());
    }
    return [];
  }
}
