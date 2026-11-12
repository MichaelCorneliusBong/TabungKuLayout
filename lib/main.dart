
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TabungKu',
      theme: ThemeData(
        colorSchemeSeed: Colors.indigo,
        useMaterial3: true,
      ),
      home: const RingkasanPage(),
    );
  }
}

class Transaksi {
  final String judul;
  final String tanggal;
  final String nominal;
  final IconData ikon;
  final Color warna;

  const Transaksi(
      this.judul,
      this.tanggal,
      this.nominal,
      this.ikon,
      this.warna,
      );
}

const daftarTransaksi = [
  Transaksi(
    'Setoran awal tabungan',
    '11 Nov 2026',
    'Rp 400.000',
    Icons.arrow_downward,
    Colors.green,
  ),
  Transaksi(
    'Pembelian alat tulis',
    '9 Nov 2026',
    'Rp 125.000',
    Icons.arrow_upward,
    Colors.red,
  ),
  Transaksi(
    'Hadiah lomba kampus',
    '7 Nov 2026',
    'Rp 600.000',
    Icons.arrow_downward,
    Colors.green,
  ),
  Transaksi(
    'Bayar kebutuhan kuliah',
    '4 Nov 2026',
    'Rp 220.000',
    Icons.arrow_upward,
    Colors.red,
  ),
];

class RingkasanPage extends StatelessWidget {
  const RingkasanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Ringkasan Tabungan'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Container(
          width: 600,
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const _KartuTabungan(),
              const SizedBox(height: 20),
              const _BarisKategori(),
              const SizedBox(height: 24),
              const Text(
                'Transaksi Terakhir',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: ListView.builder(
                  itemCount: daftarTransaksi.length,
                  itemBuilder: (context, index) {
                    final transaksi = daftarTransaksi[index];

                    return _ItemTransaksi(
                      transaksi: transaksi,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _KartuTabungan extends StatelessWidget {
  const _KartuTabungan();

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.indigo,
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(
                  Icons.savings,
                  color: Colors.white,
                  size: 26,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Tabungan Dana Pendidikan',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Saldo',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Rp 4.250.000',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Target Tabungan',
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ),
                Text(
                  'Rp 12.000.000',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _BarisKategori extends StatelessWidget {
  const _BarisKategori();

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _ItemKategori(
          ikon: Icons.add,
          label: 'Menabung',
          warna: Colors.green,
        ),
        _ItemKategori(
          ikon: Icons.remove,
          label: 'Tarik',
          warna: Colors.red,
        ),
        _ItemKategori(
          ikon: Icons.history,
          label: 'Riwayat',
          warna: Colors.blue,
        ),
      ],
    );
  }
}

class _ItemKategori extends StatelessWidget {
  final IconData ikon;
  final String label;
  final MaterialColor warna;

  const _ItemKategori({
    required this.ikon,
    required this.label,
    required this.warna,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 60,
          height: 60,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: warna.shade50,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(
            ikon,
            color: warna.shade700,
            size: 28,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class _ItemTransaksi extends StatelessWidget {
  final Transaksi transaksi;

  const _ItemTransaksi({
    required this.transaksi,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      color: Colors.white,
      child: ListTile(
        leading: Icon(
          transaksi.ikon,
          color: transaksi.warna,
          size: 26,
        ),
        title: Text(
          transaksi.judul,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(transaksi.tanggal),
        trailing: Text(
          transaksi.nominal,
          style: TextStyle(
            fontSize: 12,
            color: transaksi.warna,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
