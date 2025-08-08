// file: lib/pages/ganjil/detail_ganjil_screen.dart

import 'package:flutter/material.dart';
import 'package:latihan_div/models/ganjil_model.dart'; // Sesuaikan path import

class DetailGanjilScreen extends StatelessWidget {
  final ganjil product;

  const DetailGanjilScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.title ?? 'Detail Produk')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar Produk
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child:
                    product.image != null
                        ? Image.network(
                          product.image!,
                          height: 250,
                          fit: BoxFit.cover,
                          errorBuilder:
                              (context, error, stackTrace) => const Icon(
                                Icons.image_not_supported,
                                size: 150,
                              ),
                        )
                        : const Icon(Icons.image_not_supported, size: 150),
              ),
            ),
            const SizedBox(height: 24),

            // Nama Produk
            Text(
              product.title ?? 'Nama tidak tersedia',
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            // Harga
            Text(
              'Harga: \$${product.price?.toStringAsFixed(2) ?? 'N/A'}',
              style: const TextStyle(
                fontSize: 24,
                color: Colors.green,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),

            // Rating
            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 20),
                const SizedBox(width: 4),
                Text(
                  '${product.rating?.rate ?? 'N/A'} (${product.rating?.count ?? '0'} review)',
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Kategori
            Chip(
              label: Text(product.category ?? 'Tanpa Kategori'),
              backgroundColor: Colors.blue.shade100,
            ),
            const SizedBox(height: 24),

            // Deskripsi
            const Text(
              'Deskripsi Produk:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              product.description ?? 'Deskripsi tidak tersedia',
              style: const TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
