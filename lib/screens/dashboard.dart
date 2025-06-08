import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'kelas_card.dart';
import 'tanggunganpage.dart';

class DashboardDosen extends StatefulWidget {
  const DashboardDosen({super.key, required bool isKelasDibuka});

  @override
  State<DashboardDosen> createState() => _DashboardDosenState();
}

class _DashboardDosenState extends State<DashboardDosen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('id_ID', null);
    final today = DateTime.now();

    Widget bodyContent;

    // Konten sesuai index bottom nav
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
                subtitle: const Text("Anda memiliki 1 jadwal mengajar hari ini"),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.calendar_today, size: 18),
                    const SizedBox(width: 5),
                    Text(DateFormat('EEEE, d MMMM yyyy', 'id_ID').format(today)),
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
            ),
          ],
        );
        break;
      // Bisa buat konten halaman lain kalau perlu
      default:
        bodyContent = Center(child: Text('Halaman belum tersedia'));
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
                            _buildNavButton(context, 'Bimbingan', () {
                              // Tambah navigasi jika ada
                            }),
                            _buildNavButton(context, 'Jadwal', () {
                              // Tambah navigasi jika ada
                            }),
                            _buildNavButton(context, 'Perkuliahan', () {
                              // Tambah navigasi jika ada
                            }),
                            _buildNavButton(context, 'Laporan', () {
                              // Tambah navigasi jika ada
                            }),
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
          if (index == 1) {
            // Navigasi ke halaman TanggunganPage, tunggu sampai kembali
            await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TanggunganPage()),
            );
            // Setelah kembali, reset ke Beranda (index 0)
            setState(() {
              _currentIndex = 0;
            });
          } else {
            setState(() {
              _currentIndex = index;
            });
          }
        },
        backgroundColor: const Color(0xFF0A2A56),
        selectedItemColor: Color(0xFF0A2A56),
        unselectedItemColor: Color(0xFF0A2A56),
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
