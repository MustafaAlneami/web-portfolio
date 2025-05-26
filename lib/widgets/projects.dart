import 'package:flutter/material.dart';
import '../viewmodel/portfolio_viewmodel.dart';
import 'project_showcase.dart';
import '../utils/responsive_utils.dart';

class ProjectsSection extends StatelessWidget {
  final PortfolioViewModel viewModel;

  const ProjectsSection({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    final neonGradient = const LinearGradient(
      colors: [Color(0xFFDA22FF), Color(0xFF3A8DFF)],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    );
    final titleFontSize = ResponsiveUtils.getResponsiveFontSize(context, 40);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShaderMask(
          shaderCallback: (bounds) => neonGradient.createShader(bounds),
          child: Text(
            'Projects',
            style: TextStyle(
              fontSize: titleFontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 8),
        // Project One
        ProjectShowcase(
          projectName: 'CarMart 🚗',
          description:
              'a simple cross-platform car marketplace app built with Flutter and Firebase!',
          githubUrl: 'git@github.com:MustafaAlneami/CARMART.git',
          imagePaths: [
            'assets/project1/1.png',
            'assets/project1/2.png',
            'assets/project1/3.png',
            'assets/project1/4.png',
            //  'assets/project1/5.png',
            'assets/project1/6.png',
          ],
        ),
        const SizedBox(height: 32),
        // Project Two
        ProjectShowcase(
          projectName: 'Reco 📱 ',
          description:
              'Control your Content consumption via Scheduale contents',
          githubUrl: 'git@github.com:MustafaAlneami/RECO.git',
          imagePaths: [
            'assets/project2/1.png',
            'assets/project2/2.png',
            'assets/project2/3.png',
            'assets/project2/4.png',
            'assets/project2/5.png',
            // 'assets/project2/6.png',
          ],
        ),
      ],
    );
  }
}
