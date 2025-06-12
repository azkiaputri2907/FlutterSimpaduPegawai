import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'kelas_card.dart';
import 'tanggunganpage.dart';
import 'detailkelas.dart'; // Mengimpor BukaKelasPage

class DashboardDosen extends StatefulWidget {
  final bool kelasSudahDibuka;

  const DashboardDosen({super.key, required this.kelasSudahDibuka});

  @override
  State<DashboardDosen> createState() => _DashboardDosenState();
}

class _DashboardDosenState extends State<DashboardDosen> {
  int _currentIndex = 0;
  late bool _currentKelasSudahDibuka; // Gunakan variabel status yang bisa diubah

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('id_ID', null);
    _currentKelasSudahDibuka = widget.kelasSudahDibuka; // Inisialisasi dengan nilai yang diteruskan
  }

  // Callback untuk memperbarui status kelas
  void _updateKelasStatus(bool status) {
    setState(() {
      _currentKelasSudahDibuka = status;
    });
  }

  // Callback untuk memperbarui indeks navigasi bawah
  void _updateCurrentIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();

    Widget bodyContent;

    switch (_currentIndex) {
      case 0:
        bodyContent = ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const SizedBox(height: 16),
            Card(
              elevation: 2,
              child: ListTile(
                title: const Text("Jadwal Mengajar Hari Ini"),
                subtitle: Text(
                  _currentKelasSudahDibuka
                      ? "Kelas sedang berlangsung"
                      : "Anda memiliki 1 jadwal mengajar hari ini",
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.calendar_today, size: 18),
                    const SizedBox(width: 5),
                    Text(DateFormat('EEEE, d MMMM y', 'id_ID').format(today)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            JadwalCard(
              namaKelas: 'TEKNIK INFORMATIKA 4E (AXIOO)',
              jam: '08.00 - 10.00',
              ruang: 'Gedung H',
              pertemuan: '7',
              jenis: 'Praktikum',
              kelasSudahDibuka: _currentKelasSudahDibuka,
              onAkhiriKelas: () {
                _updateKelasStatus(false);
              },
              onMasukKelas: () {
                _updateKelasStatus(true);
              },
              onDetailKelas: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BukaKelasPage()),
                );
                if (result != null && result is bool) {
                  _updateKelasStatus(result);
                }
              },
            ),
          ],
        );
        break;

      case 1:
        // Saat tab "Tanggungan" dipilih, halaman TanggunganPage akan di-push sebagai route terpisah.
        // Oleh karena itu, bodyContent di DashboardDosen ini hanya menampilkan widget kosong.
        bodyContent = const SizedBox.shrink();
        break;

      case 2: // Tombol 'Buat' untuk membuka BukaKelasPage
        bodyContent = Center(
          child: ElevatedButton.icon(
            onPressed: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BukaKelasPage()),
              );
              if (result != null && result is bool) {
                _updateKelasStatus(result);
              }
            },
            icon: const Icon(Icons.class_),
            label: const Text("Buka Kelas"),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              backgroundColor: Colors.blue[900],
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
        );
        break;

      case 3:
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
                Navigator.popUntil(context, (route) => route.isFirst);
              },
            ),
          ],
        );
        break;

      default:
        bodyContent = const Center(child: Text('Halaman belum tersedia'));
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          flexibleSpace: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 216, 231, 255),
                    Color(0xFF0D47A1),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/logo_poliban.png',
                            height: 40,
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(Icons.image_not_supported, color: Colors.white);
                            },
                          ),
                          const SizedBox(width: 10),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'POLITEKNIK NEGERI BANJARMASIN',
                                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Halo, Jamilatul Azkia Putri',
                                  style: TextStyle(color: Colors.white70, fontSize: 14),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          const Icon(Icons.account_circle, color: Colors.white, size: 32),
                        ],
                      ),
                      const SizedBox(height: 12),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            _buildNavButton(context, 'Beranda', () {
                              setState(() {
                                _currentIndex = 0;
                              });
                            }),
                            _buildNavButton(context, 'Bimbingan', () {}),
                            _buildNavButton(context, 'Jadwal', () {}),
                            _buildNavButton(context, 'Perkuliahan', () {}),
                            _buildNavButton(context, 'Laporan', () {}),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          automaticallyImplyLeading: false,
        ),
      ),
      body: bodyContent,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) async {
          if (index == 1) { // Navigasi ke TanggunganPage
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TanggunganPage(
                  kelasSudahDibuka: _currentKelasSudahDibuka, // Teruskan status kelas
                  onTabSelected: _updateCurrentIndex, // Teruskan callback untuk memperbarui indeks
                ),
              ),
            );
            // Setelah kembali dari TanggunganPage, _currentIndex sudah diupdate
            // oleh callback onTabSelected, jadi tidak perlu mengatur ulang ke 0.
          } else {
            setState(() {
              _currentIndex = index;
            });
          }
        },
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
