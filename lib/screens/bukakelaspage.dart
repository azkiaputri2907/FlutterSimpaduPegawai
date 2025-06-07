import 'package:flutter/material.dart';
import 'bukakelaspage.dart'; // pastikan sudah import halaman tujuan

class JadwalCard extends StatelessWidget {
  // ... kode sebelumnya tetap sama ...

  @override
  Widget build(BuildContext context) {
    return Card(
      // ... padding dan widget lain tetap sama ...
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ... widget sebelumnya tetap sama ...
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: kelasSudahDibuka
                        ? () => _showEndClassDialog(context)
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          kelasSudahDibuka ? Colors.blue[700] : Colors.grey,
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
