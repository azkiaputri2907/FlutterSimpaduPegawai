import 'package:flutter/material.dart';

class TanggunganPage extends StatelessWidget {
  const TanggunganPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tanggungan Anda'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  child: Text("Anda belum mengisi realisasi perkuliahan hari ini"),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("Lihat detail"),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  child: Text("Anda belum mengisi presensi mahasiswa hari ini"),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("Lihat detail"),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  child: Text("Anda belum mengisi nilai mahasiswa hari ini"),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("Lihat detail"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
