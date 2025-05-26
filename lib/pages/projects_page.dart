import 'package:flutter/material.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({super.key});

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  int _currentProject = 0;
  int _currentImage = 0;
  bool _isHovered = false;
  late PageController _pageController;

  final List<List<String>> projectScreenshots = [
    [
      'assets/project1/1.png',
      'assets/project1/2.png',
      'assets/project1/3.png',
      'assets/project1/4.png',
      'assets/project1/5.png',
      'assets/project1/6.png',
    ],
    [
      'assets/project2/1.png',
      'assets/project2/2.png',
      'assets/project2/3.png',
      'assets/project2/4.png',
      'assets/project2/5.png',
      'assets/project2/6.png',
    ],
  ];

  final List<String> projectTitles = ['Project 1', 'Project 2'];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onProjectChanged(int index) {
    setState(() {
      _currentProject = index;
      _currentImage = 0;
      _pageController.jumpToPage(0);
    });
  }

  void _onImageChanged(int index) {
    setState(() {
      _currentImage = index;
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final neonGradient = const LinearGradient(
      colors: [Color(0xFFDA22FF), Color(0xFF3A8DFF)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
    final images = projectScreenshots[_currentProject];
    return Scaffold(
      backgroundColor: const Color(0xFF0A0D1A),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Projects', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Project Switcher
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                projectTitles.length,
                (i) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: ChoiceChip(
                    label: Text(
                      projectTitles[i],
                      style: const TextStyle(color: Colors.white),
                    ),
                    selected: _currentProject == i,
                    onSelected: (_) => _onProjectChanged(i),
                    selectedColor: Colors.purple.withOpacity(0.3),
                    backgroundColor: Colors.white10,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
            // Neon Carousel
            MouseRegion(
              onEnter: (_) => setState(() => _isHovered = true),
              onExit: (_) => setState(() => _isHovered = false),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  gradient: neonGradient,
                  borderRadius: BorderRadius.circular(32),
                  boxShadow: [
                    BoxShadow(
                      color: _isHovered
                          ? Colors.purpleAccent.withOpacity(0.7)
                          : Colors.purpleAccent.withOpacity(0.4),
                      blurRadius: _isHovered ? 60 : 32,
                      spreadRadius: _isHovered ? 8 : 2,
                    ),
                  ],
                ),
                child: AnimatedScale(
                  scale: _isHovered ? 1.04 : 1.0,
                  duration: const Duration(milliseconds: 300),
                  child: SizedBox(
                    width: 600,
                    height: 400,
                    child: Stack(
                      children: [
                        PageView.builder(
                          itemCount: images.length,
                          controller: _pageController,
                          onPageChanged: (index) {
                            setState(() {
                              _currentImage = index;
                            });
                          },
                          itemBuilder: (context, index) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(24),
                              child: Image.asset(
                                images[index],
                                fit: BoxFit.cover,
                                width: 600,
                                height: 400,
                              ),
                            );
                          },
                        ),
                        // Left/Right Arrows
                        Positioned(
                          left: 0,
                          top: 0,
                          bottom: 0,
                          child: IconButton(
                            icon: const Icon(
                              Icons.chevron_left,
                              color: Colors.white,
                              size: 40,
                            ),
                            onPressed: _currentImage > 0
                                ? () => _onImageChanged(_currentImage - 1)
                                : null,
                          ),
                        ),
                        Positioned(
                          right: 0,
                          top: 0,
                          bottom: 0,
                          child: IconButton(
                            icon: const Icon(
                              Icons.chevron_right,
                              color: Colors.white,
                              size: 40,
                            ),
                            onPressed: _currentImage < images.length - 1
                                ? () => _onImageChanged(_currentImage + 1)
                                : null,
                          ),
                        ),
                        // Dots
                        Positioned(
                          bottom: 16,
                          left: 0,
                          right: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              images.length,
                              (i) => Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 4,
                                ),
                                width: 12,
                                height: 12,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: i == _currentImage
                                      ? Colors.white
                                      : Colors.white24,
                                  border: Border.all(
                                    color: Colors.purpleAccent,
                                    width: 2,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
