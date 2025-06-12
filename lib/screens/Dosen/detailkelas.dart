import 'package:dashboard/screens/Dosen/peserta.dart';
import 'package:dashboard/screens/Dosen/presensi.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'dashboard.dart'; // sesuaikan path-nya

class BukaKelasPage extends StatefulWidget {
  const BukaKelasPage({super.key});

  @override
  State<BukaKelasPage> createState() => _BukaKelasPageState();
}

class _BukaKelasPageState extends State<BukaKelasPage> {
  final _formKey = GlobalKey<FormState>();
  final _tanggalController = TextEditingController();
  final _waktuSelesaiController = TextEditingController();
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  String? _selectedJenisPertemuan;

  // GlobalKey untuk Scaffold, diperlukan untuk mengakses ScaffoldState
  // Ini penting agar tombol menu bisa memanggil openDrawer()
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('id_ID', null);
  }

  @override
  void dispose() {
    _tanggalController.dispose();
    _waktuSelesaiController.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (date != null) {
      setState(() {
        _selectedDate = date;
        _tanggalController.text = DateFormat('dd/MM/yyyy').format(date);
      });
    }
  }

  Future<void> _pickTime() async {
    final t = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? TimeOfDay.now(),
    );
    if (t != null) {
      setState(() {
        _selectedTime = t;
        _waktuSelesaiController.text = t.format(context);
      });
    }
  }

  Widget _buildTextField(String label,
      {TextEditingController? controller, bool readOnly = false, VoidCallback? onTap, String? Function(String?)? validator}) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2 - 24,
      child: TextFormField(
        controller: controller,
        readOnly: readOnly,
        onTap: onTap,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        ),
        validator: validator,
      ),
    );
  }

  Widget _buildJenisPertemuanDropdown() {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2 - 24,
      child: DropdownButtonFormField<String>(
        value: _selectedJenisPertemuan,
        decoration: const InputDecoration(
          labelText: 'Jenis Pertemuan',
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        ),
        items: ['UTS', 'UAS', 'Praktek', 'Materi']
            .map((jenis) => DropdownMenuItem(value: jenis, child: Text(jenis)))
            .toList(),
        onChanged: (value) {
          setState(() {
            _selectedJenisPertemuan = value;
          });
        },
        validator: (value) =>
            value == null || value.isEmpty ? 'Pilih jenis pertemuan' : null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // Menambahkan key ke Scaffold
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
                  colors: [Color(0xFFD8E7FF), Color(0xFF0D47A1)],
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
                      Row(children: [
                        Image.asset(
                          'assets/images/logo_poliban.png',
                          height: 40,
                          errorBuilder: (_, __, ___) =>
                              const Icon(Icons.image_not_supported, color: Colors.white),
                        ),
                        const SizedBox(width: 10),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'POLITEKNIK NEGERI BANJARMASIN',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Halo, Jamilatul Azkia Putri',
                                style: TextStyle(color: Colors.white70, fontSize: 14),
                                overflow: TextOverflow.ellipsis,
                              )
                            ],
                          ),
                        ),
                        // Tombol menu yang akan membuka Drawer
                        IconButton(
                          icon: const Icon(Icons.menu, color: Colors.white),
                          onPressed: () {
                            _scaffoldKey.currentState?.openDrawer(); // Memanggil openDrawer()
                          },
                        )
                      ]),
                      const SizedBox(height: 12),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(children: [
                          _buildNavButton(context, 'Beranda', () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (_) =>
                                      DashboardDosen(kelasSudahDibuka: false)), // Asumsi false saat kembali ke beranda dari sini
                            );
                          }),
                          _buildNavButton(context, 'Bimbingan', () {}),
                          _buildNavButton(context, 'Jadwal', () {}),
                          _buildNavButton(context, 'Perkuliahan', () {}),
                          _buildNavButton(context, 'Laporan', () {}),
                        ]),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          automaticallyImplyLeading: false, // Penting agar tidak ada back button otomatis
        ),
      ),
      // Menambahkan Drawer di sini
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            // Header Drawer
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF0D47A1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, size: 40, color: Color(0xFF0D47A1)),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Jamilatul Azkia Putri',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    'Dosen',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),

            ListTile(
              leading: const Icon(Icons.book),
              title: const Text('Jadwal Perkuliahan'),
              onTap: () {
                Navigator.pop(context); // Menutup drawer
                // Tambahkan navigasi ke halaman Bimbingan
              },
            ),
            ListTile(
              leading: const Icon(Icons.group),
              title: const Text('Peserta Kelas'),
              onTap: () {
                Navigator.pop(context); // Menutup drawer
                // Navigasi ke halaman PesertaKelasPage
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PesertaKelasPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.event),
              title: const Text('Presensi Kelas'),
              onTap: () {
                Navigator.pop(context); // Menutup drawer
                // Tambahkan navigasi ke halaman Perkuliahan
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PresensiKelasPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.description),
              title: const Text('Nilai Perkuliahan'),
              onTap: () {
                Navigator.pop(context); // Menutup drawer
                // Tambahkan navigasi ke halaman Laporan
              },
            ),
            const Divider(), // Garis pemisah
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: const Color(0xFFE3F2FD),
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(8)),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Program Studi: D3 - Teknik Informatika"),
                  Text("Mata Kuliah: Administrasi Database"),
                  Text("Kurikulum: 2020"),
                  Text("Kapasitas: 30"),
                  SizedBox(height: 8),
                  Text("Periode: 2025 Ganjil"),
                  Text("Nama Kelas: 4E AXIOO"),
                  Text("Sistem Kuliah: Reguler"),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text('Detail Kelas',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                _buildTextField('Sesi', validator: (value) => value == null || value.isEmpty ? 'Sesi tidak boleh kosong' : null),
                _buildTextField('Metode', validator: (value) => value == null || value.isEmpty ? 'Metode tidak boleh kosong' : null),
                _buildTextField('Tanggal Jadwal',
                    controller: _tanggalController, readOnly: true, onTap: _pickDate, validator: (value) => value == null || value.isEmpty ? 'Tanggal tidak boleh kosong' : null),
                _buildTextField('Ruang Kuliah', validator: (value) => value == null || value.isEmpty ? 'Ruang Kuliah tidak boleh kosong' : null),
                _buildTextField('Waktu Selesai',
                    controller: _waktuSelesaiController, readOnly: true, onTap: _pickTime, validator: (value) => value == null || value.isEmpty ? 'Waktu Selesai tidak boleh kosong' : null),
                _buildTextField('Keterangan Ruang Kuliah'),
                _buildJenisPertemuanDropdown(),
                _buildTextField('URL Kuliah Online'),
                _buildTextField('Status', validator: (value) => value == null || value.isEmpty ? 'Status tidak boleh kosong' : null),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Pop dengan hasil `true` untuk menunjukkan kelas berhasil dibuka/disimpan
                      Navigator.pop(context, true);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                  child: const Text('Simpan'),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: () {
                    // Fungsionalitas Edit - placeholder
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                  child: const Text('Edit'),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: () {
                    // Hanya mereset form, tidak memengaruhi status kelas yang dibuka
                    _formKey.currentState!.reset();
                    _tanggalController.clear();
                    _waktuSelesaiController.clear();
                    setState(() {
                      _selectedDate = null;
                      _selectedTime = null;
                      _selectedJenisPertemuan = null;
                    });
                    // Tidak ada `Navigator.pop(context, false);` di sini
                    // sehingga DashboardDosen tidak akan mengubah status `kelasSudahDibuka`
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                  child: const Text('Reset'),
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }

  Widget _buildNavButton(BuildContext context, String title, VoidCallback? onPressed) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
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
