import 'package:flutter/material.dart';
import 'package:latihan_div/models/doa_model.dart';
import 'package:latihan_div/pages/Doa/detail_doa.dart';
import 'package:latihan_div/services/doa_services.dart';

class ListDoaScreen extends StatelessWidget {
  const ListDoaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Doa'),
        backgroundColor: const Color.fromARGB(255, 44, 7, 255), // Ganti warna AppBar agar serasi dengan background
      ),
      body: FutureBuilder<List<DoaModel>>(
        future: DoaService().getListDoa(), // Menggunakan instance kelas, bukan metode statis
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Terjadi kesalahan: ${snapshot.error}',
                style: const TextStyle(color: Colors.red),
              ),
            );
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text('Tidak ada data doa ditemukan.'),
            );
          }

          final List<DoaModel> dataPost = snapshot.data!;
          return ListView.builder(
            itemCount: dataPost.length,
            itemBuilder: (context, index) {
              final data = dataPost[index];
              return Card(
                elevation: 2,
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DoaDetailScreen(
                          id: data.id,
                          doa: data.doa,
                          ayat: data.ayat,
                          latin: data.latin,
                          artinya: data.artinya,
                        ),
                      ),
                    );
                  },
                  leading: CircleAvatar(
                    backgroundColor: Colors.amber,
                    child: Text(
                      '${index + 1}',
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                  title: Text(
                    data.doa ?? 'Nama Doa Tidak Ditemukan',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}