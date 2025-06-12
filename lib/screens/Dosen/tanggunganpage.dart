import 'package:flutter/material.dart';
import 'dashboard.dart'; // Import DashboardDosen

class TanggunganPage extends StatefulWidget {
  // Tambahkan parameter ini untuk menerima status kelas dan callback navigasi
  final bool kelasSudahDibuka;
  final Function(int)? onTabSelected;

  const TanggunganPage({
    super.key,
    required this.kelasSudahDibuka, // Tandai sebagai required
    this.onTabSelected,
  });

  @override
  State<TanggunganPage> createState() => _TanggunganPageState();
}

class _TanggunganPageState extends State<TanggunganPage> {
  int _currentIndex = 1; // Indeks awal untuk halaman Tanggungan

  // Metode untuk menangani penekanan tab navigasi bawah
  void _onTabTapped(int index) {
    if (index == _currentIndex) {
      return; // Jika tab yang sama ditekan, tidak melakukan apa-apa
    }

    // Panggil callback untuk memberitahu DashboardDosen tab mana yang dipilih
    // Ini akan memicu DashboardDosen untuk memperbarui _currentIndex-nya
    if (widget.onTabSelected != null) {
      widget.onTabSelected!(index);
    }

    // Kembali ke DashboardDosen setelah tab dipilih
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) { // Memperbaiki signature method build
    Widget bodyContent; // Deklarasikan bodyContent di sini

    // Logika switch untuk menentukan konten halaman berdasarkan _currentIndex
    switch (_currentIndex) {
      case 0:
        // Konten untuk tab "Beranda".
        // Perlu diingat, halaman ini akan di-pop dan DashboardDosen akan menampilkan Beranda.
        bodyContent = const Center(child: Text('Halaman Beranda (Akan kembali ke Dashboard)'));
        break;
      case 1:
        // Konten untuk tab "Tanggungan" (halaman saat ini).
        bodyContent = Padding(
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
        );
        break;
      case 2:
        // Konten untuk tab "Buat".
        // Perlu diingat, halaman ini akan di-pop dan DashboardDosen akan menampilkan "Buat".
        bodyContent = const Center(child: Text('Halaman Buat (Akan kembali ke Dashboard)'));
        break;
      case 3:
        // Konten untuk tab "Cari".
        bodyContent = Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: const [
              TextField(
                decoration: InputDecoration(
                  hintText: 'Cari mahasiswa, jadwal, atau kelas...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              Text("Fitur pencarian belum tersedia."),
            ],
          ),
        );
        break;
      case 4:
        // Konten untuk tab "Menu".
        bodyContent = ListView(
          padding: const EdgeInsets.all(16),
          children: [
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profil Dosen'),
              subtitle: const Text('Lihat dan ubah informasi pribadi'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Pengaturan'),
              subtitle: const Text('Ubah preferensi aplikasi'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Keluar'),
              onTap: () {
                // Mengembalikan ke halaman pertama di stack (misalnya, layar login)
                Navigator.popUntil(context, (route) => route.isFirst);
              },
            ),
          ],
        );
        break;
      default:
        bodyContent = const Center(child: Text('Halaman belum tersedia'));
        break;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tanggungan Anda'),
        backgroundColor: const Color(0xFF0D47A1), // Warna latar belakang AppBar
        foregroundColor: Colors.white, // Warna teks di AppBar
      ),
      body: bodyContent, // Menampilkan bodyContent yang sudah ditentukan
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        backgroundColor: const Color(0xFF0A2A56),
        selectedItemColor: Color(0xFF0A2A56), // Warna ikon/label saat dipilih
        unselectedItemColor: Color(0xFF0A2A56), // Warna ikon/label saat tidak dipilih
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Tanggungan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Buat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Cari',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menu',
          ),
        ],
      ),
    );
  }

  // Metode _buildNavButton juga harus berada di dalam kelas _TanggunganPageState
  Widget _buildNavButton(BuildContext context, String title, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        child: Text(title),
      ),
    );
  }
}
