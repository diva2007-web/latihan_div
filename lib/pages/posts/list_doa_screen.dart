import 'package:flutter/material.dart';
import 'package:latihan_div/models/doa_model.dart';
import 'package:latihan_div/services/doa_services.dart';
import 'package:latihan_div/pages/posts/detail_doa_screen.dart';

class ListDoa extends StatelessWidget {
  const ListDoa({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.blueAccent,
      child: FutureBuilder<List<DoaModel>>(
        future: DoaService.listDoa(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final doaList = snapshot.data ?? [];
          return ListView.builder(
            itemCount: doaList.length,
            itemBuilder: (context, index) {
              final doa = doaList[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: ListTile(
                  title: Text(
                    doa.doa,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailDoa(doa: doa),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}

