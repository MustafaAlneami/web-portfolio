import 'package:flutter/material.dart';
import '../utils/responsive_utils.dart';

class SkillsCarousel extends StatefulWidget {
  const SkillsCarousel({super.key});

  @override
  State<SkillsCarousel> createState() => _SkillsCarouselState();
}

class _SkillsCarouselState extends State<SkillsCarousel> {
  final List<String> skillImages = [
    'assets/skills/flutter_icon.png',
    'assets/skills/dart_icon.png',
    'assets/skills/api_icon.webp',
    'assets/skills/hive_icon.jpg',
    'assets/skills/git_hub.webp',
    'assets/skills/Git_icon.png',
    'assets/skills/Lottie_icon.png',
    'assets/skills/strapi_icon.webp',
    'assets/skills/firebase_icon.png',
  ];

  final ScrollController _scrollController = ScrollController();
  bool _isScrolling = true;

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _startAutoScroll() {
    Future.delayed(const Duration(milliseconds: 50), () {
      if (!mounted) return;
      if (_isScrolling) {
        _scrollController
            .animateTo(
              _scrollController.position.pixels + 1,
              duration: const Duration(milliseconds: 20),
              curve: Curves.linear,
            )
            .then((_) {
              if (_scrollController.position.pixels >=
                  _scrollController.position.maxScrollExtent) {
                _scrollController.jumpTo(0);
              }
              _startAutoScroll();
            });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveUtils.isMobile(context);
    final isTablet = ResponsiveUtils.isTablet(context);
    final imageSize = isMobile ? 80.0 : (isTablet ? 100.0 : 120.0);
    final spacing = ResponsiveUtils.getGridSpacing(context);

    return Container(
      padding: EdgeInsets.symmetric(vertical: spacing * 2),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.purpleAccent.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: MouseRegion(
        onEnter: (_) => setState(() => _isScrolling = false),
        onExit: (_) => setState(() => _isScrolling = true),
        child: SingleChildScrollView(
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          child: Row(
            children: [
              ...skillImages.map(
                (image) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: spacing),
                  child: Container(
                    width: imageSize,
                    height: imageSize,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: const LinearGradient(
                        colors: [Color(0xFFDA22FF), Color(0xFF3A8DFF)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.purpleAccent.withOpacity(0.3),
                          blurRadius: 8,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(image, fit: BoxFit.contain),
                    ),
                  ),
                ),
              ),
              // Duplicate the first few images to create a seamless loop
              ...skillImages
                  .take(3)
                  .map(
                    (image) => Padding(
                      padding: EdgeInsets.symmetric(horizontal: spacing),
                      child: Container(
                        width: imageSize,
                        height: imageSize,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          gradient: const LinearGradient(
                            colors: [Color(0xFFDA22FF), Color(0xFF3A8DFF)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.purpleAccent.withOpacity(0.3),
                              blurRadius: 8,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(image, fit: BoxFit.contain),
                        ),
                      ),
                    ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
