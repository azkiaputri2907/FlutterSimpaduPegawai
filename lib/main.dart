import 'package:flutter/material.dart';
import 'screens/Dosen/dashboard.dart';
import 'screens/Admin/admindashboard.dart';
import 'screens/Auth/login_screen.dart';
import 'screens/Auth/onboarding_screen.dart';
//import 'screens/pegawai_list_page.dart';
//import 'screens/status_list_page.dart';
//import 'screens/provinsi_list_page.dart';
//import 'screens/kotakabupaten_list_page.dart';

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
      initialRoute: '/', // Pastikan ini sesuai dengan halaman awal yang diinginkan
      routes: {
        '/': (context) => const OnboardingScreen(),
        '/login': (context) => const LoginScreen(),
        '/dashboard': (context) => const DashboardDosen(kelasSudahDibuka: false), // gunakan nilai default yang aman

        // '/admin': (context) => const AdminDashboard(),
        // '/pegawai': (context) => const PegawaiListPage(),
        // '/status': (context) => const StatusListPage(),
        // '/provinsi': (context) => ProvinsiListPage(),
        // '/kota': (context) => const KotaKabupatenListPage(),
      },
    );
  }
}