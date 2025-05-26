import 'package:flutter/material.dart';
import '../utils/responsive_utils.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectShowcase extends StatefulWidget {
  final String projectName;
  final List<String> imagePaths;
  final String description;
  final String githubUrl;

  const ProjectShowcase({
    super.key,
    required this.projectName,
    required this.imagePaths,
    required this.description,
    required this.githubUrl,
  });

  @override
  State<ProjectShowcase> createState() => _ProjectShowcaseState();
}

class _ProjectShowcaseState extends State<ProjectShowcase> {
  int? _hoveredIndex;
  int? _selectedImageIndex;
  bool _isHovered = false;

  void _showFullScreenImage(BuildContext context, int index) {
    setState(() {
      _selectedImageIndex = index;
    });
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.zero,
        child: Stack(
          children: [
            InteractiveViewer(
              minScale: 0.5,
              maxScale: 4.0,
              child: Image.asset(widget.imagePaths[index], fit: BoxFit.contain),
            ),
            Positioned(
              top: 16,
              right: 16,
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.white, size: 32),
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() {
                    _selectedImageIndex = null;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageFrame(String imagePath, int index, bool isHovered) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hoveredIndex = index),
      onExit: (_) => setState(() => _hoveredIndex = null),
      child: GestureDetector(
        onTap: () => _showFullScreenImage(context, index),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: isHovered
                    ? Colors.black.withOpacity(0.3)
                    : Colors.black.withOpacity(0.2),
                blurRadius: isHovered ? 12 : 8,
                offset: Offset(isHovered ? 6 : 4, isHovered ? 6 : 4),
              ),
            ],
          ),
          padding: const EdgeInsets.all(8),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: isHovered
                        ? Colors.grey.shade400
                        : Colors.grey.shade300,
                    width: isHovered ? 3 : 2,
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image.asset(imagePath, fit: BoxFit.cover),
                ),
              ),
              if (isHovered)
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.7),
                      ],
                    ),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.zoom_in, color: Colors.white, size: 32),
                        const SizedBox(height: 8),
                        Text(
                          'View Image ${index + 1}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDesktop = ResponsiveUtils.isDesktop(context);
    final isTablet = ResponsiveUtils.isTablet(context);
    final neonGradient = const LinearGradient(
      colors: [Color(0xFFDA22FF), Color(0xFF3A8DFF)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
        margin: EdgeInsets.symmetric(
          vertical: 16,
          horizontal: isDesktop ? 32 : 16,
        ),
        decoration: BoxDecoration(
          gradient: neonGradient,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: _isHovered
                  ? Colors.purpleAccent.withOpacity(0.7)
                  : Colors.purpleAccent.withOpacity(0.4),
              blurRadius: _isHovered ? 40 : 24,
              spreadRadius: _isHovered ? 6 : 2,
            ),
          ],
        ),
        child: AnimatedScale(
          scale: _isHovered ? 1.02 : 1.0,
          duration: const Duration(milliseconds: 300),
          child: Card(
            margin: EdgeInsets.zero,
            color: Theme.of(context).cardColor,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.projectName,
                        style: theme.textTheme.displaySmall,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        widget.description,
                        style: theme.textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final crossAxisCount =
                          ResponsiveUtils.getGridCrossAxisCount(context);
                      return GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: crossAxisCount,
                          crossAxisSpacing: ResponsiveUtils.getGridSpacing(
                            context,
                          ),
                          mainAxisSpacing: ResponsiveUtils.getGridSpacing(
                            context,
                          ),
                          childAspectRatio:
                              ResponsiveUtils.getGridChildAspectRatio(context),
                        ),
                        itemCount: widget.imagePaths.length,
                        itemBuilder: (context, index) {
                          return _buildImageFrame(
                            widget.imagePaths[index],
                            index,
                            _hoveredIndex == index,
                          );
                        },
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextButton.icon(
                    onPressed: () {
                      // TODO: Implement URL launcher
                      launchUrl(Uri.parse(widget.githubUrl));
                    },
                    icon: const Icon(Icons.code),
                    label: const Text('View on GitHub'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
