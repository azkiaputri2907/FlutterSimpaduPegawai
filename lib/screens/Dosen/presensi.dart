import 'package:flutter/material.dart';

class Peserta {
  final String nama;
  final String nim;
  String statusPresensi; // Status: 'H', 'S', 'I', 'A', atau ''

  Peserta({required this.nama, required this.nim, this.statusPresensi = ''});
}

class PresensiKelasPage extends StatefulWidget {
  const PresensiKelasPage({super.key});

  @override
  State<PresensiKelasPage> createState() => _PresensiKelasPageState();
}

class _PresensiKelasPageState extends State<PresensiKelasPage> {
  final List<Peserta> _pesertaKelas = [
    Peserta(nama: 'Ahmad Budi Santoso', nim: '2022001'),
    Peserta(nama: 'Siti Aminah', nim: '2022002'),
    Peserta(nama: 'Dwi Cahya Putri', nim: '2022003'),
    Peserta(nama: 'Bayu Pratama', nim: '2022004'),
    Peserta(nama: 'Citra Dewi', nim: '2022005'),
    Peserta(nama: 'Eko Saputra', nim: '2022006'),
    Peserta(nama: 'Fitriani', nim: '2022007'),
    Peserta(nama: 'Guntur Nugraha', nim: '2022008'),
  ];

  void _setPresensiStatus(int index, String status) {
    setState(() {
      _pesertaKelas[index].statusPresensi = status;
    });
  }

  void _resetPresensi() {
    setState(() {
      for (var peserta in _pesertaKelas) {
        peserta.statusPresensi = '';
      }
    });
  }

  void _tandaiHadirSemua() {
    setState(() {
      for (var peserta in _pesertaKelas) {
        peserta.statusPresensi = 'H';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Presensi Kelas', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF0D47A1),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Info Kelas
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFE3F2FD),
                border: Border.all(color: Colors.blue),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Program Studi: D3 - Teknik Informatika", style: TextStyle(fontSize: 14)),
                  Text("Mata Kuliah: Administrasi Database", style: TextStyle(fontSize: 14)),
                  Text("Kurikulum: 2020", style: TextStyle(fontSize: 14)),
                  Text("Kapasitas: 30", style: TextStyle(fontSize: 14)),
                  SizedBox(height: 8),
                  Text("Periode: 2025 Ganjil", style: TextStyle(fontSize: 14)),
                  Text("Nama Kelas: 4E AXIOO", style: TextStyle(fontSize: 14)),
                  Text("Sistem Kuliah: Reguler", style: TextStyle(fontSize: 14)),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Tombol Aksi
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: _resetPresensi,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[600],
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  icon: const Icon(Icons.refresh),
                  label: const Text('Reset Presensi'),
                ),
                const SizedBox(width: 15),
                ElevatedButton.icon(
                  onPressed: _tandaiHadirSemua,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  icon: const Icon(Icons.check_circle_outline),
                  label: const Text('Tandai Hadir Semua'),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Header Daftar
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              decoration: BoxDecoration(
                color: const Color(0xFFE3F2FD),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.blueAccent.shade100),
              ),
              child: const Row(
                children: [
                  Expanded(flex: 3, child: Text('Nama', style: TextStyle(fontWeight: FontWeight.bold))),
                  Expanded(flex: 2, child: Text('NIM', style: TextStyle(fontWeight: FontWeight.bold))),
                  Expanded(flex: 3, child: Center(child: Text('Presensi', style: TextStyle(fontWeight: FontWeight.bold)))),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // Daftar Peserta
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _pesertaKelas.length,
              itemBuilder: (context, index) {
                final peserta = _pesertaKelas[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 10),
                  elevation: 2,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                peserta.nama,
                                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                peserta.nim,
                                style: const TextStyle(fontSize: 14, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _buildPresensiButton(index, 'H', Colors.green[700], Colors.white),
                              _buildPresensiButton(index, 'S', Colors.amber[700], Colors.black),
                              _buildPresensiButton(index, 'I', Colors.blue[700], Colors.white),
                              _buildPresensiButton(index, 'A', Colors.red[700], Colors.white),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildPresensiButton(int index, String code, Color? activeColor, Color activeTextColor) {
    final isActive = _pesertaKelas[index].statusPresensi == code;
    return ElevatedButton(
      onPressed: () => _setPresensiStatus(index, code),
      style: ElevatedButton.styleFrom(
        backgroundColor: isActive ? activeColor : Colors.grey[300],
        foregroundColor: isActive ? activeTextColor : Colors.black87,
        minimumSize: const Size(40, 40),
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(code, style: const TextStyle(fontSize: 16)),
    );
  }
}
