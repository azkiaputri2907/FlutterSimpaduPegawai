import 'package:flutter/material.dart';
import 'dashboard.dart';

class TanggunganPage extends StatefulWidget {
  const TanggunganPage({super.key});

  @override
  State<TanggunganPage> createState() => _TanggunganPageState();
}

class _TanggunganPageState extends State<TanggunganPage> {
  int _currentIndex = 1; // Tanggungan index

  void _onTabTapped(int index) {
    if (index == 1) return; // Already on Tanggungan
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => DashboardDosen(
          kelasSudahDibuka: false, // atau true tergantung status sebelumnya
        ),
      ),
    );
  }

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
      
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
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
}
