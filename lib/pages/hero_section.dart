import 'package:flutter/material.dart';
import '../utils/responsive_utils.dart';
import 'projects_page.dart';
import '../widgets/projects.dart';
import '../viewmodel/portfolio_viewmodel.dart';
import '../widgets/skills_section.dart';
import '../widgets/contact_section.dart';
import '../widgets/skills_carousel.dart';
import 'package:url_launcher/url_launcher.dart';

// Define _SocialIcon class at the top level
class _SocialIcon extends StatelessWidget {
  final String icon;
  final String url;
  final String tooltip;

  const _SocialIcon({
    required this.icon,
    required this.url,
    required this.tooltip,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Tooltip(
          message: tooltip,
          child: GestureDetector(
            onTap: () {
              launchUrl(Uri.parse(url));
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Colors.purpleAccent.withOpacity(0.3),
                  width: 1,
                ),
              ),
              child: Image.asset(icon, width: 24, height: 24),
            ),
          ),
        ),
      ),
    );
  }
}

class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _projectsSectionKey = GlobalKey();
  final GlobalKey _skillsSectionKey = GlobalKey();
  final GlobalKey _contactSectionKey = GlobalKey();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final gradient = const LinearGradient(
      colors: [Color(0xFFDA22FF), Color(0xFF3A8DFF)],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    );
    final isMobile = ResponsiveUtils.isMobile(context);
    final isTablet = ResponsiveUtils.isTablet(context);
    final isDesktop = ResponsiveUtils.isDesktop(context);
    final isNarrow = MediaQuery.of(context).size.width < 1000;
    final padding = ResponsiveUtils.getResponsiveLayoutPadding(context);
    final mascotSize = isMobile ? 180.0 : (isTablet ? 240.0 : 300.0);
    final headlineSize = ResponsiveUtils.getResponsiveFontSize(context, 32);
    final subHeadlineSize = ResponsiveUtils.getResponsiveFontSize(context, 24);
    final buttonPadding = isMobile
        ? const EdgeInsets.symmetric(horizontal: 20, vertical: 10)
        : const EdgeInsets.symmetric(horizontal: 32, vertical: 12);
    final spacing = ResponsiveUtils.getResponsiveSpacing(context, 24);

    final viewModel = PortfolioViewModel();

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
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 16 : 60,
                vertical: isMobile ? 16 : 32,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Logo
                  const Icon(
                    Icons.change_history,
                    color: Colors.white,
                    size: 40,
                  ),
                  if (!isMobile && !isNarrow)
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              _scrollController.animateTo(
                                0.0,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOut,
                              );
                            },
                            child: _NavItem('Home'),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Scroll to the skills section
                              final RenderBox renderBox =
                                  _skillsSectionKey.currentContext
                                          ?.findRenderObject()
                                      as RenderBox;
                              final offset = renderBox.localToGlobal(
                                Offset.zero,
                              );
                              _scrollController.animateTo(
                                offset.dy + _scrollController.offset,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOut,
                              );
                            },
                            child: _NavItem('Skills'),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Scroll to the projects section
                              final RenderBox renderBox =
                                  _projectsSectionKey.currentContext
                                          ?.findRenderObject()
                                      as RenderBox;
                              final offset = renderBox.localToGlobal(
                                Offset.zero,
                              );
                              _scrollController.animateTo(
                                offset.dy + _scrollController.offset,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOut,
                              );
                            },
                            child: _NavItem('Projects'),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Scroll to the contact section
                              final RenderBox renderBox =
                                  _contactSectionKey.currentContext
                                          ?.findRenderObject()
                                      as RenderBox;
                              final offset = renderBox.localToGlobal(
                                Offset.zero,
                              );
                              _scrollController.animateTo(
                                offset.dy + _scrollController.offset,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOut,
                              );
                            },
                            child: _NavItem('Contact'),
                          ),
                        ],
                      ),
                    ),
                  // WhatsApp Button
                  Container(
                    decoration: BoxDecoration(
                      gradient: gradient,
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Padding(
                      padding: buttonPadding,
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
          // Sidebar (hide on mobile)
          if (!isMobile)
            Positioned(
              left: 0,
              top: isDesktop ? 120 : 80,
              bottom: 0,
              child: Column(
                children: [
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
                  _SocialIcon(
                    icon: 'assets/social_media_icons/x1.png',
                    url: 'https://x.com/MustaVerse',
                    tooltip: 'X',
                  ),
                  _SocialIcon(
                    icon: 'assets/social_media_icons/linkedin1.png',
                    url: 'https://www.linkedin.com/in/mustafa-al-neaimi/',
                    tooltip: 'LinkedIn',
                  ),
                  _SocialIcon(
                    icon: 'assets/social_media_icons/upwork.png',
                    url:
                        'https://www.upwork.com/freelancers/~0141dd50bdd8185b62?mp_source=share',
                    tooltip: 'Upwork',
                  ),
                  _SocialIcon(
                    icon: 'assets/social_media_icons/githubicon.png',
                    url: 'https://github.com/MustafaAlneami',
                    tooltip: 'GitHub',
                  ),
                ],
              ),
            ),
          // Main Content and Projects Section (Scrollable)
          Positioned.fill(
            top: isMobile ? 80 : 120, // Adjust based on navigation bar height
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Padding(
                padding:
                    padding, // Use responsive padding for the whole scrollable area
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.center, // Center column content
                  children: [
                    // Hero Content (Texts and Mascot)
                    isMobile || isNarrow
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              _HeroTexts(
                                headlineSize: headlineSize,
                                subHeadlineSize: subHeadlineSize,
                                gradient: gradient,
                                spacing: spacing,
                                buttonPadding: buttonPadding,
                                isMobile: true,
                              ),
                              SizedBox(height: spacing * 2),
                              BouncingMascotBox(
                                mascotSize: mascotSize,
                                gradient: gradient,
                              ),
                            ],
                          )
                        : ConstrainedBox(
                            constraints: BoxConstraints(
                              maxWidth: ResponsiveUtils.getContentWidth(
                                context,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  flex: 2,
                                  child: _HeroTexts(
                                    headlineSize: headlineSize,
                                    subHeadlineSize: subHeadlineSize,
                                    gradient: gradient,
                                    spacing: spacing,
                                    buttonPadding: buttonPadding,
                                    isMobile: false,
                                  ),
                                ),
                                SizedBox(width: spacing * 2),
                                Flexible(
                                  flex: 1,
                                  child: BouncingMascotBox(
                                    mascotSize: mascotSize,
                                    gradient: gradient,
                                  ),
                                ),
                              ],
                            ),
                          ),
                    SizedBox(
                      height: spacing * 2,
                    ), // Reduced space after hero content and before skills carousel
                    // Skills Carousel
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: ResponsiveUtils.getContentWidth(context),
                      ),
                      child: const SkillsCarousel(),
                    ),
                    const SizedBox(
                      height: 48,
                    ), // Space between carousel and skills section
                    // Skills Section
                    SkillsSection(key: _skillsSectionKey),
                    const SizedBox(height: 48), // Consistent space after skills
                    // Projects Section
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: ResponsiveUtils.getContentWidth(context),
                      ), // Constrain width for larger screens
                      child: ProjectsSection(
                        key: _projectsSectionKey,
                        viewModel: viewModel,
                      ),
                    ),
                    const SizedBox(
                      height: 48,
                    ), // Consistent space after projects
                    // Divider (Moved before contact section)
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: spacing * 2,
                        horizontal: ResponsiveUtils.getResponsivePadding(
                          context,
                        ).horizontal,
                      ), // Add padding around divider
                      child: Divider(
                        color: Colors.white12,
                        thickness: 1,
                      ), // Add a subtle divider
                    ),
                    const SizedBox(height: 48),
                    // Contact Section
                    ContactSection(key: _contactSectionKey),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HeroTexts extends StatelessWidget {
  final double headlineSize;
  final double subHeadlineSize;
  final Gradient gradient;
  final double spacing;
  final EdgeInsets buttonPadding;
  final bool isMobile;
  const _HeroTexts({
    required this.headlineSize,
    required this.subHeadlineSize,
    required this.gradient,
    required this.spacing,
    required this.buttonPadding,
    required this.isMobile,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: isMobile
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        Text(
          'Mustafa Al-Neaimi',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: headlineSize,
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
        ),
        SizedBox(height: spacing / 2),
        Row(
          mainAxisAlignment: isMobile
              ? MainAxisAlignment.center
              : MainAxisAlignment.start,
          children: [
            Text(
              'Flutter ',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: subHeadlineSize,
              ),
            ),
            ShaderMask(
              shaderCallback: (bounds) => gradient.createShader(bounds),
              child: Text(
                'Developer',
                style: TextStyle(
                  fontSize: subHeadlineSize,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: spacing / 2),
        const Text(
          "Flutter wizard 🧙‍♂️ — coding apps, dodging bugs, and living on coffee ☕🚀",
          style: TextStyle(color: Colors.white70, fontSize: 16),
        ),
        SizedBox(height: 30),
        Container(
          decoration: BoxDecoration(
            gradient: gradient,
            borderRadius: BorderRadius.circular(32),
          ),
          child: Padding(
            padding: buttonPadding,
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
        SizedBox(height: ResponsiveUtils.getResponsiveSpacing(context, 15)),
      ],
    );
  }
}

class BouncingMascotBox extends StatefulWidget {
  final double mascotSize;
  final Gradient gradient;
  const BouncingMascotBox({required this.mascotSize, required this.gradient});
  @override
  State<BouncingMascotBox> createState() => _BouncingMascotBoxState();
}

class _BouncingMascotBoxState extends State<BouncingMascotBox>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
    _animation = Tween<double>(
      begin: 0,
      end: 24,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, -_animation.value),
          child: child,
        );
      },
      child: Container(
        width: widget.mascotSize,
        height: widget.mascotSize + 20,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          gradient: widget.gradient,
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
            child: Image.asset('assets/images/dash1.png', fit: BoxFit.contain),
          ),
        ),
      ),
    );
  }
}

// Define _NavItem class at the top level
class _NavItem extends StatefulWidget {
  final String label;
  const _NavItem(this.label, {Key? key}) : super(key: key);

  @override
  State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final gradient = const LinearGradient(
      colors: [Color(0xFFDA22FF), Color(0xFF3A8DFF)],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    );

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          gradient: _isHovered ? gradient : null,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            if (_isHovered)
              BoxShadow(
                color: Colors.purpleAccent.withOpacity(0.5),
                blurRadius: 12,
                spreadRadius: 2,
              ),
          ],
        ),
        child: Text(
          widget.label,
          style: TextStyle(
            color: _isHovered ? Colors.white : Colors.white70,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
