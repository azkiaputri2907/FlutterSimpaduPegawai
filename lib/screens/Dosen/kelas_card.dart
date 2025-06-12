import 'package:flutter/material.dart';
import 'detailkelas.dart';

class JadwalCard extends StatelessWidget {
  final String namaKelas;
  final String jam;
  final String ruang;
  final String pertemuan;
  final String jenis;
  final Color sksColor;
  final bool kelasSudahDibuka;
  final VoidCallback? onAkhiriKelas;
  final VoidCallback? onMasukKelas; // New callback for "Masuk Kelas"
  final VoidCallback? onDetailKelas; // New callback for "Detail Kelas"

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
    this.onMasukKelas, // Initialize new callbacks
    this.onDetailKelas, // Initialize new callbacks
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
                  onAkhiriKelas!(); // Call the provided callback
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

  void _showKelasBerhasilDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Informasi'),
          content: const Text('Kelas berhasil dibuka.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                if (onMasukKelas != null) {
                  onMasukKelas!(); // Call the provided callback to update state
                }
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  // No longer navigating directly here, instead call the callback
  // void _bukaDetailKelasJikaSudahDibuka(BuildContext context) {
  //   if (kelasSudahDibuka) {
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => const BukaKelasPage(),
  //       ),
  //     );
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text('Silakan buka kelas terlebih dahulu.')),
  //     );
  //   }
  // }

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
                        : null, // Disable if class is not opened
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
                    onPressed: !kelasSudahDibuka // Only enable if class is not already open
                        ? () => _showKelasBerhasilDialog(context)
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: !kelasSudahDibuka
                          ? Colors.blue[700]
                          : Colors.grey, // Grey out if already opened
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
                    onPressed: kelasSudahDibuka // Only enable if class is opened
                        ? () {
                            if (onDetailKelas != null) {
                              onDetailKelas!(); // Call the provided callback
                            }
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kelasSudahDibuka
                          ? Colors.blue[700]
                          : Colors.grey, // Grey out if not opened
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