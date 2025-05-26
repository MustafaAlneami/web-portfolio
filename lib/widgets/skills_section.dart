import 'package:flutter/material.dart';
import '../utils/responsive_utils.dart';

class SkillsSection extends StatefulWidget {
  const SkillsSection({super.key});

  @override
  State<SkillsSection> createState() => _SkillsSectionState();
}

class _SkillsSectionState extends State<SkillsSection> {
  final List<Map<String, String>> skillsData = const [
    {
      'title': '✅ Flutter & Dart',
      'description':
          'Clean, scalable, and maintainable app development using Flutter and Dart.',
    },
    {
      'title': '📐 MVVM Architecture',
      'description':
          'Separation of UI and business logic using Provider & ViewModels for better code organization.',
    },
    {
      'title': '📱 Responsive UI Design',
      'description':
          'Adaptive layouts using MediaQuery, LayoutBuilder, and custom breakpoints for different screen sizes.',
    },
    {
      'title': '📤 Flutter Animations',
      'description':
          'Smooth transitions and engaging user interfaces with AnimatedBuilder, AnimatedContainer, and Lottie.',
    },
    {
      'title': '🔥 Firebase Integration',
      'description':
          'Experience with Authentication, Firestore, Storage and Realtime Database .',
    },
    {
      'title': '🌐 RESTful APIs & HTTP',
      'description':
          'Efficiently fetching and displaying dynamic content from RESTful APIs using the http package.',
    },
    {
      'title': '🛠️ Strapi CMS',
      'description':
          'Headless CMS integration using Strapi for flexible content management and delivery.',
    },
    {
      'title': '🧠 State Management',
      'description':
          'Proficient in using Provider, Riverpod (basic), and setState for managing application state effectively.',
    },
    {
      'title': '🗃️ Local Storage',
      'description':
          'Using Hive for offline data storage and shared_preferences for lightweight persistence.',
    },

    {
      'title': '📤 App Deployment',
      'description':
          'Experience in building and deploying Flutter apps for Android, iOS, and Web platforms.',
    },
    {
      'title': '🔄 Version Control',
      'description':
          'Using Git & GitHub for effective collaboration, version tracking, and project management.',
    },
  ];

  int? _expandedIndex;
  int? _hoveredSkillIndex;

  void _toggleSkillExpansion(int index) {
    setState(() {
      if (_expandedIndex == index) {
        _expandedIndex = null; // Collapse if already expanded
      } else {
        _expandedIndex = index; // Expand the selected skill
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final neonGradient = const LinearGradient(
      colors: [Color(0xFFDA22FF), Color(0xFF3A8DFF)],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    );
    // Adjust grid columns for skills: 1 on mobile, 2 on tablet, 3 on desktop and larger
    final isMobile = ResponsiveUtils.isMobile(context);
    final isTablet = ResponsiveUtils.isTablet(context);
    final isDesktop = ResponsiveUtils.isDesktop(context);
    final crossAxisCount = isDesktop ? 3 : (isTablet ? 2 : 1);

    return Container(
      padding: const EdgeInsets.all(24), // Inner padding
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          width: 2,
          color: Colors.purpleAccent.withOpacity(0.5),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.purpleAccent.withOpacity(0.5),
            blurRadius: 24,
            spreadRadius: 4,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 32,
            spreadRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Title
          Text(
            'Skills',
            style: TextStyle(
              fontSize: ResponsiveUtils.getResponsiveFontSize(context, 32),
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 24),
          Divider(),
          const SizedBox(height: 24),
          // Skills Grid
          LayoutBuilder(
            builder: (context, constraints) {
              // Calculate available width after padding
              final availableWidth =
                  constraints.maxWidth - (isDesktop ? 48 : (isTablet ? 32 : 0));
              // Calculate items per row based on screen size
              final itemsPerRow = isDesktop ? 3 : (isTablet ? 2 : 1);
              // Calculate item width with proper spacing
              final itemWidth =
                  (availableWidth -
                      (itemsPerRow - 1) *
                          ResponsiveUtils.getGridSpacing(context) *
                          2) /
                  itemsPerRow;
              return Wrap(
                spacing: ResponsiveUtils.getGridSpacing(context) * 2,
                runSpacing: ResponsiveUtils.getGridSpacing(context) * 2,
                children: List.generate(skillsData.length, (index) {
                  final skill = skillsData[index];
                  final isExpanded = _expandedIndex == index;
                  final isHovered = _hoveredSkillIndex == index;
                  return SizedBox(
                    width: itemWidth,
                    child: GestureDetector(
                      onTap: () => _toggleSkillExpansion(index),
                      child: MouseRegion(
                        onEnter: (_) =>
                            setState(() => _hoveredSkillIndex = index),
                        onExit: (_) =>
                            setState(() => _hoveredSkillIndex = null),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(
                              isHovered || isExpanded ? 0.1 : 0.05,
                            ),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: isExpanded
                                  ? Colors.purpleAccent
                                  : (isHovered
                                        ? Colors.purple.withOpacity(0.5)
                                        : Colors.transparent),
                              width: isHovered || isExpanded ? 2 : 1,
                            ),
                            boxShadow: [
                              if (isHovered || isExpanded)
                                BoxShadow(
                                  color: Colors.purpleAccent.withOpacity(
                                    isHovered ? 0.3 : 0.2,
                                  ),
                                  blurRadius: isHovered ? 10 : 6,
                                  spreadRadius: isHovered ? 2 : 1,
                                ),
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 8,
                                spreadRadius: 2,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      skill['title']!,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                            ResponsiveUtils.getResponsiveFontSize(
                                              context,
                                              18,
                                            ),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  AnimatedRotation(
                                    turns: isExpanded ? 0.5 : 0,
                                    duration: const Duration(milliseconds: 300),
                                    child: Icon(
                                      Icons.expand_more,
                                      color: isHovered || isExpanded
                                          ? Colors.white
                                          : Colors.white70,
                                      size: ResponsiveUtils.getIconSize(
                                        context,
                                        baseSize: 20,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              AnimatedCrossFade(
                                firstChild: const SizedBox.shrink(),
                                secondChild: Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    skill['description']!,
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize:
                                          ResponsiveUtils.getResponsiveFontSize(
                                            context,
                                            16,
                                          ),
                                    ),
                                  ),
                                ),
                                crossFadeState: isExpanded
                                    ? CrossFadeState.showSecond
                                    : CrossFadeState.showFirst,
                                duration: const Duration(milliseconds: 300),
                                alignment: Alignment.topLeft,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              );
            },
          ),
        ],
      ),
    );
  }
}
