import 'package:flutter/material.dart';
import 'screens/dashboard.dart';
import 'screens/admindashboard.dart';
// import 'screens/pegawai_list_page.dart';
// import 'screens/status_list_page.dart';
// import 'screens/provinsi_list_page.dart';
// import 'screens/kotakabupaten_list_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard Dosen',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AdminDashboard(),
      routes: {
        '/admin': (context) => const AdminDashboard(),
        // '/pegawai': (context) => const PegawaiListPage(),
        // '/status': (context) => const StatusListPage(),
        // '/provinsi': (context) => ProvinsiListPage(),
        // '/kota': (context) => const KotaKabupatenListPage(),
      },
    );
  }
}
