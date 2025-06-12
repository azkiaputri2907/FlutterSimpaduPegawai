import 'package:flutter/material.dart';

class PesertaKelasPage extends StatefulWidget {
  // Tambahkan parameter opsional jika Anda ingin meneruskan data kelas
  // final String? namaKelas;
  // const PesertaKelasPage({super.key, this.namaKelas});
  const PesertaKelasPage({super.key});

  @override
  State<PesertaKelasPage> createState() => _PesertaKelasPageState();
}

class _PesertaKelasPageState extends State<PesertaKelasPage> {
  // Controller untuk bar pencarian
  final TextEditingController _searchController = TextEditingController();

  // Daftar dummy data peserta kelas
  List<Map<String, String>> _allPeserta = [
    {'nama': 'Ahmad Budi Santoso', 'nim': '2022001', 'jurusan': 'Teknik Informatika'},
    {'nama': 'Siti Aminah', 'nim': '2022002', 'jurusan': 'Sistem Informasi'},
    {'nama': 'Dwi Cahya Putri', 'nim': '2022003', 'jurusan': 'Manajemen Bisnis'},
    {'nama': 'Bayu Pratama', 'nim': '2022004', 'jurusan': 'Teknik Komputer'},
    {'nama': 'Citra Dewi', 'nim': '2022005', 'jurusan': 'Akuntansi'},
    {'nama': 'Eko Saputra', 'nim': '2022006', 'jurusan': 'Teknik Informatika'},
    {'nama': 'Fitriani', 'nim': '2022007', 'jurusan': 'Sistem Informasi'},
    {'nama': 'Guntur Nugraha', 'nim': '2022008', 'jurusan': 'Teknik Komputer'},
  ];

  // Daftar peserta yang ditampilkan setelah pencarian
  List<Map<String, String>> _filteredPeserta = [];

  @override
  void initState() {
    super.initState();
    _filteredPeserta = _allPeserta; // Inisialisasi dengan semua peserta
    _searchController.addListener(_filterPeserta); // Tambahkan listener untuk pencarian
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  // Fungsi untuk memfilter peserta berdasarkan input pencarian
  void _filterPeserta() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      _filteredPeserta = _allPeserta.where((peserta) {
        return peserta['nama']!.toLowerCase().contains(query) ||
               peserta['nim']!.toLowerCase().contains(query);
      }).toList();
    });
  }

  // Menampilkan dialog detail mahasiswa
  void _showStudentDetail(Map<String, String> studentData) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          title: Text('Detail Mahasiswa: ${studentData['nama']}', style: const TextStyle(fontWeight: FontWeight.bold)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('NIM: ${studentData['nim']}', style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 5),
              Text('Jurusan: ${studentData['jurusan']}', style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 10),
              // Anda bisa menambahkan lebih banyak detail di sini
              const Text('Informasi tambahan tentang mahasiswa...', style: TextStyle(fontStyle: FontStyle.italic)),
            ],
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(foregroundColor: Colors.blue),
              child: const Text('Tutup'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Peserta Kelas', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF0D47A1), // Warna AppBar yang seragam
        iconTheme: const IconThemeData(color: Colors.white), // Warna ikon kembali
        // Tombol kembali otomatis disediakan oleh AppBar jika ada di Stack Navigator
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Bar Pencarian
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Cari Nama / NIM Peserta',
                hintText: 'Masukkan nama atau NIM',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.grey[100],
                contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
              ),
              style: const TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 20),
            // Header untuk daftar peserta
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
                  Expanded(flex: 2, child: Text('Detail', style: TextStyle(fontWeight: FontWeight.bold))),
                ],
              ),
            ),
            const SizedBox(height: 10),
            // Daftar Peserta
            Expanded(
              child: _filteredPeserta.isEmpty
                  ? const Center(child: Text('Tidak ada peserta ditemukan.', style: TextStyle(fontSize: 16, color: Colors.grey)))
                  : ListView.builder(
                      itemCount: _filteredPeserta.length,
                      itemBuilder: (context, index) {
                        final peserta = _filteredPeserta[index];
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
                                  child: Text(
                                    peserta['nama']!,
                                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    peserta['nim']!,
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: ElevatedButton(
                                      onPressed: () => _showStudentDetail(peserta),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blueAccent, // Warna tombol detail
                                        foregroundColor: Colors.white,
                                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                      ),
                                      child: const Text('Lihat Detail', style: TextStyle(fontSize: 14)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
