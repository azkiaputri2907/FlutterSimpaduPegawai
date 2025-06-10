import 'package:flutter/material.dart';
import '../../model/onboarding_model.dart';
import 'onboarding_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();

  final List<OnboardingModel> onboardingData = [
    OnboardingModel(
      title: "🎓 Belajar Jadi Lebih Simpel & Seru",
      description:
          "Kini kamu bisa belajar hal baru tanpa ribet! Cukup dari ponselmu, semua materi tersedia dan bisa diakses kapan pun kamu punya waktu.",
      imagePath: "assets/images/onboarding1.jpg",
    ),
    OnboardingModel(
      title: "👥 Belajarnya Bareng-Bareng !",
      description:
          "Ada komunitas dan mentor yang siap bantu kamu setiap langkah. Jadi belajar nggak cuma sendiri, tapi rame dan seru bareng yang lain.",
      imagePath: "assets/images/onboarding2.jpg",
    ),
    OnboardingModel(
      title: "📚 Belajar Tanpa Batas, Kapan Aja",
      description:
          "Nggak perlu nunggu waktu luang lama. Cukup beberapa menit sehari, kamu udah bisa dapet ilmu baru yang bermanfaat langsung dari HP kamu.",
      imagePath: "assets/images/onboarding3.jpg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _controller,
        itemCount: onboardingData.length,
        itemBuilder: (context, index) {
          return OnboardingPage(data: onboardingData[index]);
        },
      ),
    );
  }
}
