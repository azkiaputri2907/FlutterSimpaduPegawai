import 'package:flutter/material.dart';

class JadwalCard extends StatelessWidget {
  final String namaKelas;
  final String jam;
  final String ruang;
  final String pertemuan;
  final String jenis;
  final Color sksColor;
  final bool kelasSudahDibuka;

  const JadwalCard({
    Key? key,
    required this.namaKelas,
    required this.jam,
    required this.ruang,
    required this.pertemuan,
    required this.jenis,
    this.sksColor = Colors.green,
    this.kelasSudahDibuka = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    namaKelas,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Chip(
                  label: const Text("3 SKS", style: TextStyle(color: Colors.white)),
                  backgroundColor: sksColor,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.access_time),
                const SizedBox(width: 4),
                Text(jam),
                const SizedBox(width: 16),
                const Icon(Icons.location_city),
                const SizedBox(width: 4),
                Text(ruang),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                const Icon(Icons.article),
                const SizedBox(width: 4),
                Text("Pertemuan ke-$pertemuan"),
                const SizedBox(width: 8),
                Text(jenis),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: kelasSudahDibuka ? () {} : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kelasSudahDibuka ? Colors.blue[700] : Colors.grey,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 10), // Kasih padding biar proporsional
                    ),
                    child: const Text(
                      "Akhiri Kelas",
                      style: TextStyle(fontSize: 12), // Ukuran font lebih kecil
                      overflow: TextOverflow.ellipsis, // Hindari teks terpotong dua baris
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[700],
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                    ),
                    child: const Text(
                      "Masuk Kelas",
                      style: TextStyle(fontSize: 12),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[700],
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                    ),
                    child: const Text(
                      "Detail Kelas",
                      style: TextStyle(fontSize: 12),
                      overflow: TextOverflow.ellipsis,
                    ),
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
