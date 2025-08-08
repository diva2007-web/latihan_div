import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:latihan_div/models/doa_model.dart';

// Kelas DoaService sekarang tidak lagi statis, sehingga lebih fleksibel untuk pengujian
class DoaService {
  // Gunakan final const untuk URL agar lebih aman dan efisien
  static const String _doaUrl = 'https://doa-doa-api-ahmadramadhan.fly.dev/api';

  // Tambahkan private constructor agar kelas ini tidak bisa di-instantiate
  // DoaService._();

  // Ubah menjadi metode instan (bukan statis)
  Future<List<DoaModel>> getListDoa() async {
    try {
      final response = await http.get(Uri.parse(_doaUrl));

      if (response.statusCode == 200) {
        // Gunakan List<dynamic> untuk menampung data sebelum di-decode
        final List<dynamic> jsonData = json.decode(response.body);
        return jsonData.map((item) => DoaModel.fromJson(item)).toList();
      } else {
        // Lempar exception dengan pesan yang lebih spesifik
        throw Exception('Failed to load data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Tangani kesalahan (error) jaringan atau parsing
      throw Exception('Failed to connect to the server or parse data: $e');
    }
  }
}