import 'package:flutter/material.dart';
import 'kelas_card.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class DashboardDosen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('id_ID', null);

    final today = DateTime.now();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(130),
        child: AppBar(
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
            ),
          ),
          title: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Image.asset(
                  'assets/images/logo_poliban.png',
                  height: 40,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.image_not_supported, color: Colors.white);
                  },
                ),
              ),
              const SizedBox(width: 10),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'POLITEKNIK NEGERI BANJARMASIN',
                      style: TextStyle(color: Colors.white, fontSize: 18),
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
            ],
          ),
          centerTitle: false,
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 16),
              child: Icon(Icons.account_circle, color: Colors.white),
            ),
          ],
          leading: IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () {},
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SizedBox(height: 16),

          // Diagram dan Tanggung Jawab Anda
          // Di dalam ListView children:
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Diagram bulat
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: CircularProgressIndicator(
                          value: 0.7,
                          strokeWidth: 10,
                          backgroundColor: Colors.grey[300],
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                        ),
                      ),
                      const Text(
                        "70%",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),

                  const SizedBox(width: 24),

                  // Kolom Tanggung Jawab Anda
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Tanggungan Anda",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 12),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              child: const Text("Realisasi"),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: const Text("Presensi"),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: const Text("Nilai"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Jadwal hari ini
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

          // Daftar kelas
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
}
