import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:latihan_div/models/doa_model.dart';

class DoaService {
  static const String doaUrl = 'https://doa-doa-api-ahmadramadhan.fly.dev/api/';

  static Future<List<DoaModel>> listDoa() async {
    final response = await http.get(Uri.parse(doaUrl));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((item) => DoaModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load Doa');
    }
  }
}
