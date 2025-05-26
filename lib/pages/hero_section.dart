import 'package:flutter/material.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final gradient = const LinearGradient(
      colors: [Color(0xFFDA22FF), Color(0xFF3A8DFF)],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    );
    return Scaffold(
      backgroundColor: const Color(0xFF0A0D1A),
      body: Stack(
        children: [
          // Navigation Bar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Logo
                  const Icon(
                    Icons.change_history,
                    color: Colors.white,
                    size: 40,
                  ),
                  // Menu
                  Row(
                    children: [
                      _NavItem('Home'),
                      _NavItem('About us'),
                      _NavItem('Projects'),
                      _NavItem('Certifications'),
                      _NavItem('Achievements'),
                    ],
                  ),
                  // WhatsApp Button
                  Container(
                    decoration: BoxDecoration(
                      gradient: gradient,
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 8,
                      ),
                      child: Row(
                        children: const [
                          Icon(Icons.message, color: Colors.white),
                          SizedBox(width: 8),
                          Text(
                            'Whatsapp',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Sidebar
          Positioned(
            left: 0,
            top: 120,
            bottom: 0,
            child: Column(
              children: [
                // Hamburger
                Container(
                  margin: const EdgeInsets.only(left: 8, bottom: 16),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFF181B2A),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.menu, color: Colors.white),
                ),
                RotatedBox(
                  quarterTurns: -1,
                  child: const Text(
                    'Follow Me',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 16),
                Container(width: 2, height: 40, color: Colors.white),
                const SizedBox(height: 16),
                _SocialIcon(Icons.person),
                _SocialIcon(Icons.code),
                _SocialIcon(Icons.language),
                _SocialIcon(Icons.alternate_email),
                _SocialIcon(Icons.person),
              ],
            ),
          ),
          // Main Content
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 120.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Left: Texts
                  SizedBox(
                    width: 500,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'My Personal Portfolio',
                          style: Theme.of(
                            context,
                          ).textTheme.displayLarge?.copyWith(fontSize: 48),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Text(
                              'Flutter ',
                              style: Theme.of(
                                context,
                              ).textTheme.displayLarge?.copyWith(fontSize: 38),
                            ),
                            ShaderMask(
                              shaderCallback: (bounds) =>
                                  gradient.createShader(bounds),
                              child: const Text(
                                'Developer',
                                style: TextStyle(
                                  fontSize: 38,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          "I'm capable of creating excellent mobile apps, handling every step from concept to deployment.",
                          style: TextStyle(color: Colors.white70, fontSize: 16),
                        ),
                        const SizedBox(height: 32),
                        Container(
                          decoration: BoxDecoration(
                            gradient: gradient,
                            borderRadius: BorderRadius.circular(32),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 32,
                              vertical: 12,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Text(
                                  'Download CV ',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Icon(Icons.download, color: Colors.white),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 80),
                  // Right: Mascot
                  Container(
                    width: 300,
                    height: 320,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      gradient: gradient,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.pinkAccent.withOpacity(0.4),
                          blurRadius: 32,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Image.asset(
                          'assets/images/dash1.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final String label;
  const _NavItem(this.label);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class _SocialIcon extends StatelessWidget {
  final IconData icon;
  const _SocialIcon(this.icon);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Icon(icon, color: Colors.white, size: 24),
    );
  }
}
