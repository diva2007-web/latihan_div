import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:latihan_div/models/post_model.dart';

class PostServices {
  static const String posturl = 'https://jsonplaceholder.typicode.com/posts/';

  static Future<List<PostModel>> listPost() async {
    final response = await http.get(Uri.parse(posturl));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((item) => PostModel.fromJson(item)).toList();
      } else {
        throw Exception('Gagal Load Data album');
        }
  }
}
