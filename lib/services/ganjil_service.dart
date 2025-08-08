// file: lib/services/product_services.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:latihan_div/models/ganjil_model.dart'; // Sesuaikan path

class GanjilService {
  final String _baseUrl = 'https://fakestoreapi.com/products';

  Future<List<ganjil>> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        return jsonData.map((item) => ganjil.fromJson(item)).toList();
      } else {
        throw Exception('Gagal memuat data produk. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Gagal terhubung ke server atau mem-parsing data: $e');
    }
  }
}