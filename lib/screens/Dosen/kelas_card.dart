import 'package:flutter/material.dart';
import 'bukakelaspage.dart';

class JadwalCard extends StatelessWidget {
  final String namaKelas;
  final String jam;
  final String ruang;
  final String pertemuan;
  final String jenis;
  final Color sksColor;
  final bool kelasSudahDibuka;
  final VoidCallback? onAkhiriKelas;

  const JadwalCard({
    Key? key,
    required this.namaKelas,
    required this.jam,
    required this.ruang,
    required this.pertemuan,
    required this.jenis,
    this.sksColor = Colors.white,
    this.kelasSudahDibuka = false,
    this.onAkhiriKelas,
  }) : super(key: key);

  void _showEndClassDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Konfirmasi'),
          content: const Text('Apakah Anda yakin ingin mengakhiri kelas?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Batal', style: TextStyle(color: Colors.grey)),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                if (onAkhiriKelas != null) {
                  onAkhiriKelas!();
                }
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Kelas telah diakhiri.')),
                );
              },
              child: const Text('Akhiri', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

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
                  avatar: const Icon(Icons.menu_book_outlined, color: Colors.black),
                  label: const Text(
                    "3 SKS",
                    style: TextStyle(color: Colors.black),
                  ),
                  backgroundColor: sksColor,
                )

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
                    onPressed: kelasSudahDibuka
                        ? () => _showEndClassDialog(context)
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          kelasSudahDibuka ? Colors.red : Colors.grey,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                    ),
                    child: const Text(
                      "Akhiri Kelas",
                      style: TextStyle(fontSize: 12),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BukaKelasPage(),
                        ),
                      );
                    },
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
