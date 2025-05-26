import 'package:flutter/material.dart';
import '../utils/responsive_utils.dart';

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

    return Card(
      margin: EdgeInsets.symmetric(
        vertical: 16,
        horizontal: isDesktop ? 32 : 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Project Title and Description
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.projectName, style: theme.textTheme.displaySmall),
                const SizedBox(height: 8),
                Text(widget.description, style: theme.textTheme.bodyLarge),
              ],
            ),
          ),
          // Artistic Collage Layout
          Padding(
            padding: const EdgeInsets.all(16),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final width = constraints.maxWidth;
                final isWide = width > 800;
                final isMedium = width > 600;

                return Column(
                  children: [
                    // Top row with 2 images
                    Row(
                      children: [
                        Expanded(
                          flex: isWide ? 2 : 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: AspectRatio(
                              aspectRatio: 16 / 9,
                              child: _buildImageFrame(
                                widget.imagePaths[0],
                                0,
                                _hoveredIndex == 0,
                              ),
                            ),
                          ),
                        ),
                        if (isMedium)
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: _buildImageFrame(
                                  widget.imagePaths[1],
                                  1,
                                  _hoveredIndex == 1,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                    // Middle row with 3 images
                    Row(
                      children: [
                        if (isMedium)
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: _buildImageFrame(
                                  widget.imagePaths[2],
                                  2,
                                  _hoveredIndex == 2,
                                ),
                              ),
                            ),
                          ),
                        Expanded(
                          flex: isWide ? 2 : 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: AspectRatio(
                              aspectRatio: 16 / 9,
                              child: _buildImageFrame(
                                widget.imagePaths[3],
                                3,
                                _hoveredIndex == 3,
                              ),
                            ),
                          ),
                        ),
                        if (isMedium)
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: _buildImageFrame(
                                  widget.imagePaths[4],
                                  4,
                                  _hoveredIndex == 4,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                    // Bottom row with 1 image
                    if (isMedium)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: AspectRatio(
                          aspectRatio: 16 / 9,
                          child: _buildImageFrame(
                            widget.imagePaths[5],
                            5,
                            _hoveredIndex == 5,
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
          // GitHub Link
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextButton.icon(
              onPressed: () {
                // TODO: Implement URL launcher
              },
              icon: const Icon(Icons.code),
              label: const Text('View on GitHub'),
            ),
          ),
        ],
      ),
    );
  }
}
