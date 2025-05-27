import 'package:flutter/material.dart';
import '../utils/responsive_utils.dart';
import 'dart:async';

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
  Timer? _hoverTimer;
  Timer? _scrollTimer;
  double _scrollSpeed = 1.0;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          _isInitialized = true;
        });
        _startAutoScroll();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _hoverTimer?.cancel();
    _scrollTimer?.cancel();
    super.dispose();
  }

  void _handleHover(bool isEntering) {
    _hoverTimer?.cancel();
    _hoverTimer = Timer(const Duration(milliseconds: 100), () {
      if (mounted) {
        setState(() {
          _isScrolling = !isEntering;
        });
      }
    });
  }

  void _startAutoScroll() {
    _scrollTimer?.cancel();
    _scrollTimer = Timer.periodic(const Duration(milliseconds: 16), (timer) {
      if (!mounted || !_isScrolling) return;

      if (_scrollController.hasClients) {
        final maxScroll = _scrollController.position.maxScrollExtent;
        final currentScroll = _scrollController.position.pixels;
        final delta = _scrollSpeed;

        if (currentScroll >= maxScroll) {
          _scrollController.jumpTo(0);
        } else {
          _scrollController.jumpTo(currentScroll + delta);
        }
      }
    });
  }

  Widget _buildSkillImage(String image, double imageSize, double spacing) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: spacing),
      child: MouseRegion(
        onEnter: (_) => _handleHover(true),
        onExit: (_) => _handleHover(false),
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
    );
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveUtils.isMobile(context);
    final isTablet = ResponsiveUtils.isTablet(context);
    final imageSize = isMobile ? 40.0 : (isTablet ? 50.0 : 65.0);
    final spacing = ResponsiveUtils.getGridSpacing(context);

    // Create a list with duplicated items for smooth infinite scroll
    final duplicatedItems = [...skillImages, ...skillImages, ...skillImages];

    return Container(
      padding: EdgeInsets.symmetric(vertical: spacing),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.purpleAccent.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: SingleChildScrollView(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        child: Row(
          children: duplicatedItems
              .map((image) => _buildSkillImage(image, imageSize, spacing))
              .toList(),
        ),
      ),
    );
  }
}
