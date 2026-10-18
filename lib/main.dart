import 'package:flutter/material.dart';

void main() {
  runApp(const MadrasaApp());
}

class MadrasaApp extends StatelessWidget {
  const MadrasaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'মাদরাসাতুল মাদিনাহ',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4A1813)),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // মাদ্রাসার লোগো লিংক
  final String logoUrl = 'https://i.ibb.co.com/jPkKkWG/madrasa-logo.png';

  // থ্রি-ডটে চাপ দিলে মাদ্রাসা পরিচিতি
  void _showAboutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text(
          'মাদরাসাতুল মাদিনাহ',
          style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF4A1813)),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 75,
              height: 75,
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: ClipOval(
                child: Image.network(
                  logoUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.school, size: 45, color: Color(0xFF4A1813)),
                ),
              ),
            ),
            const SizedBox(height: 14),
            const Text(
              'একটি আদর্শ দ্বীনি শিক্ষাপ্রতিষ্ঠান।\n'
              'ইসলাম ও আধুনিক শিক্ষার সমন্বয়ে পাঠদান করানো হয়।\n\n'
              'ঠিকানা: মঙ্গলকাটা, সুনামগঞ্জ সদর।',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, height: 1.4),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text(
              'ঠিক আছে',
              style: TextStyle(color: Color(0xFF4A1813), fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  // থ্রি-ডটে চাপ দিলে জরুরি নোটিশ
  void _showNoticeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text(
          'জরুরি নোটিশ',
          style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF4A1813)),
        ),
        content: const Text(
          'নতুন শিক্ষাবর্ষের ভর্তি কার্যক্রম চলছে।\nবিস্তারিত তথ্যের জন্য মাদ্রাসার অফিসে যোগাযোগ করুন।',
          style: TextStyle(fontSize: 14, height: 1.4),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text(
              'বন্ধ করুন',
              style: TextStyle(color: Color(0xFF4A1813), fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF7F5),
      appBar: AppBar(
        title: const Text(
          'মাদরাসাতুল মাদিনাহ',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 21,
            letterSpacing: 0.6,
          ),
        ),
        backgroundColor: const Color(0xFF4A1813), // লোগোর খয়েরি রঙ
        centerTitle: true,
        elevation: 2,
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onSelected: (value) {
              if (value == 'about') {
                _showAboutDialog(context);
              } else if (value == 'notice') {
                _showNoticeDialog(context);
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'about',
                child: Row(
                  children: [
                    Icon(Icons.info_outline, size: 20, color: Color(0xFF4A1813)),
                    SizedBox(width: 10),
                    Text('মাদ্রাসা পরিচিতি'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'notice',
                child: Row(
                  children: [
                    Icon(Icons.campaign_outlined, size: 20, color: Color(0xFF4A1813)),
                    SizedBox(width: 10),
                    Text('জরুরি নোটিশ'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // সেন্ট্রাল লোগো ও টাইটেল কার্ড
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 12,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // মাদ্রাসার গোল লোগো
                    Container(
                      width: 135,
                      height: 135,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: ClipOval(
                        child: Image.network(
                          logoUrl,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.school, size: 65, color: Color(0xFF4A1813)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'মাদরাসাতুল মাদিনাহ',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4A1813),
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'ইসলাম ও আধুনিক শিক্ষার সমন্বয়ে পাঠদান করানো হয়',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'উপরের ডানপাশের থ্রি-ডট (⋮) মেনু থেকে পরিচিতি ও নোটিশ দেখুন।',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
