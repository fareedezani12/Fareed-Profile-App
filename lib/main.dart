import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile',
      theme: ThemeData(fontFamily: 'Poppins'),
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // CARD WITH BACKGROUND COVER + PROFILE IMAGE
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 15,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Stack(
                      children: [
                        // BACKGROUND COVER IMAGE (cover.jpg)
                        Image.asset(
                          'assets/cover.jpg',
                          height: 220,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        Positioned.fill(
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.black.withValues(alpha: 0.2),
                                  Colors.black.withValues(alpha: 0.5),
                                ],
                              ),
                            ),
                          ),
                        ),
                        // PROFILE PICTURE (profile.jpg)
                        Positioned(
                          bottom:
                              50, // Half of the profile picture height to overlap
                          left: 0,
                          right: 0,
                          child: Center(
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 4,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.2),
                                    blurRadius: 8,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: const CircleAvatar(
                                radius: 60,
                                backgroundImage: AssetImage(
                                  'assets/profile.jpg',
                                ),
                                backgroundColor: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                // INFO SECTION BELOW
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.96),
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const Text(
                        "Fareed Ezani",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2D3561),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "@fareed_ezani",
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        "🚀 Building smart tech for the future\n✨ Turning ideas into code • Tech Visionary",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF2C3E50),
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(height: 24),
                      // 4 info cards
                      GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        childAspectRatio: 1.8,
                        children: [
                          _infoTile(
                            Icons.cake_outlined,
                            "Born & Age",
                            "2004 • 22 yrs",
                            Colors.pink,
                          ),
                          _infoTile(
                            Icons.calendar_month,
                            "Birthday",
                            "Oct 9th, 2004",
                            Colors.purple,
                          ),
                          _infoTile(
                            Icons.location_on,
                            "State",
                            "Pulau Pinang, MY",
                            Colors.orange,
                          ),
                          _infoTile(
                            Icons.tag_faces,
                            "Study",
                            "Software Engineering, UPSI",
                            Colors.green,
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      // Contact icons
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade50,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _contactIcon(
                              Icons.email,
                              Colors.blue,
                              'mailto:fareedezani0@gmail.com',
                            ),
                            _contactIcon(
                              Icons.phone,
                              Colors.green,
                              'tel:+601140452826',
                            ),
                            _contactIcon(
                              Icons.link,
                              Colors.purple,
                              'https://www.linkedin.com/in/fareed-ezani-501b38310/',
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Social chips
                      Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 12,
                        runSpacing: 12,
                        children: [
                          _socialChip(
                            Icons.camera_alt,
                            "Instagram",
                            'https://instagram.com/fareedezani',
                          ),
                          _socialChip(
                            Icons.code,
                            "GitHub",
                            'https://github.com/fareedezani12',
                          ),
                          _socialChip(
                            Icons.message,
                            "Tiktok",
                            'https://www.tiktok.com/@yyeedddddd',
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
      ),
    );
  }

  void _launch(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  Widget _infoTile(IconData icon, String title, String value, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(14),
      ),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 18, color: color),
          const SizedBox(width: 6),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.grey[700],
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                value,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF2C3E50),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _contactIcon(IconData icon, Color color, String url) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.2),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: IconButton(
        icon: Icon(icon, color: color, size: 24),
        onPressed: () => _launch(url),
      ),
    );
  }

  Widget _socialChip(IconData icon, String label, String url) {
    return GestureDetector(
      onTap: () => _launch(url), // ✅ CALL _launch
      child: Chip(
        avatar: Icon(icon, size: 16, color: Colors.grey[700]),
        label: Text(
          label,
          style: TextStyle(fontSize: 12, color: Colors.grey[700]),
        ),
        backgroundColor: Colors.grey.shade100,
        side: BorderSide.none,
        visualDensity: VisualDensity.compact,
      ),
    );
  }
}
