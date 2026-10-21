import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

// ===== Model data =====
class Kereta {
  final String nama; // String
  final String rute; // String
  final int jumlahGerbong; // int
  final double kecepatan; // double (km/jam)
  final bool isEksekutif; // bool

  const Kereta({
    required this.nama,
    required this.rute,
    required this.jumlahGerbong,
    required this.kecepatan,
    required this.isEksekutif,
  });
}

// ===== MyApp: satu-satunya MaterialApp =====
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const LayarUtama(),
    );
  }
}

// ===== Halaman utama: Scaffold tanpa MaterialApp kedua =====
class LayarUtama extends StatelessWidget {
  const LayarUtama({super.key});

  @override
  Widget build(BuildContext context) {
    const keretaSaya = Kereta(
      nama: "Argo Bromo Anggrek",
      rute: "Gambir - Surabaya Pasar Turi",
      jumlahGerbong: 10,
      kecepatan: 120.5,
      isEksekutif: true,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Katalog Kereta Api'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.teal.shade50,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    const Icon(Icons.train, size: 48, color: Colors.teal),
                    const SizedBox(height: 8),
                    const Text(
                      'Jelajahi Kereta Indonesia',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              KartuKereta(kereta: keretaSaya),
            ],
          ),
        ),
      ),
    );
  }
}

// ===== Custom widget: kartu informasi kereta =====
class KartuKereta extends StatelessWidget {
  final Kereta kereta;

  const KartuKereta({super.key, required this.kereta});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.directions_railway, color: Colors.teal),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    kereta.nama,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              kereta.rute,
              style: const TextStyle(fontSize: 14, color: Colors.black54),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _Info(ikon: Icons.view_week, teks: '${kereta.jumlahGerbong} gerbong'),
                _Info(ikon: Icons.speed, teks: '${kereta.kecepatan} km/jam'),
                _Info(
                  ikon: Icons.star,
                  teks: kereta.isEksekutif ? 'Eksekutif' : 'Ekonomi',
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  debugPrint("TOMBOL DIKLIK: ${kereta.nama}");
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${kereta.nama} ditambahkan ke favorit')),
                  );
                },
                child: const Text("Tambah ke Favorit"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ===== Custom widget kecil: chip informasi =====
class _Info extends StatelessWidget {
  final IconData ikon;
  final String teks;

  const _Info({required this.ikon, required this.teks});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.teal.shade100,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(ikon, size: 16, color: Colors.teal.shade900),
          const SizedBox(width: 4),
          Text(teks, style: TextStyle(color: Colors.teal.shade900)),
        ],
      ),
    );
  }
}