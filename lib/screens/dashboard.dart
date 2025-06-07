import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'kelas_card.dart';
import 'tanggunganpage.dart';

class DashboardDosen extends StatelessWidget {
  const DashboardDosen({super.key});

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('id_ID', null);
    final today = DateTime.now();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(160),
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
                              // tetap di halaman ini
                            }),
                            _buildNavButton(context, 'Bimbingan', () {
                              // Navigator.push(context, MaterialPageRoute(builder: (_) => BimbinganPage()));
                            }),
                            _buildNavButton(context, 'Jadwal', () {
                              // Navigator.push(context, MaterialPageRoute(builder: (_) => JadwalPage()));
                            }),
                            _buildNavButton(context, 'Perkuliahan', () {
                              // Navigator.push(context, MaterialPageRoute(builder: (_) => PerkuliahanPage()));
                            }),
                            _buildNavButton(context, 'Laporan', () {
                              // Navigator.push(context, MaterialPageRoute(builder: (_) => LaporanPage()));
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
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SizedBox(height: 16),
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            elevation: 2,
            child: ListTile(
              title: const Text("Tanggungan Anda"),
              subtitle: const Text("3 tanggungan belum diselesaikan hari ini"),
              trailing: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const TanggunganPage()),
                  );
                },
                child: const Text("Lihat semua"),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            elevation: 2,
            child: ListTile(
              title: const Text("Jadwal Mengajar Hari Ini"),
              subtitle: const Text("Anda memiliki 3 jadwal mengajar hari ini"),
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
          const SizedBox(height: 16),
          JadwalCard(
            namaKelas: 'TEKNIK INFORMATIKA 4A',
            jam: '10.00 - 12.00',
            ruang: 'Gedung E',
            pertemuan: '5',
            jenis: 'Teori',
          ),
          const SizedBox(height: 16),
          JadwalCard(
            namaKelas: 'TEKNIK INFORMATIKA 4C',
            jam: '13.00 - 15.00',
            ruang: 'Gedung F',
            pertemuan: '6',
            jenis: 'Praktikum',
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {},
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
            label: 'Jaringan',
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
