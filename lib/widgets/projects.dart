import 'package:flutter/material.dart';
import '../viewmodel/portfolio_viewmodel.dart';
import 'project_showcase.dart';

class ProjectsSection extends StatelessWidget {
  final PortfolioViewModel viewModel;

  const ProjectsSection({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Projects', style: Theme.of(context).textTheme.displayMedium),
        const SizedBox(height: 24),
        // Project One
        ProjectShowcase(
          projectName: 'Project One',
          description:
              'A cool Flutter app showcasing modern UI/UX design principles and responsive layouts.',
          githubUrl: 'https://github.com/yourusername/project1',
          imagePaths: [
            'assets/project1/1.png',
            'assets/project1/2.png',
            'assets/project1/3.png',
            'assets/project1/4.png',
            'assets/project1/5.png',
            'assets/project1/6.png',
          ],
        ),
        const SizedBox(height: 32),
        // Project Two
        ProjectShowcase(
          projectName: 'Project Two',
          description:
              'Another awesome project demonstrating advanced Flutter features and clean architecture.',
          githubUrl: 'https://github.com/yourusername/project2',
          imagePaths: [
            'assets/project2/1.png',
            'assets/project2/2.png',
            'assets/project2/3.png',
            'assets/project2/4.png',
            'assets/project2/5.png',
            'assets/project2/6.png',
          ],
        ),
      ],
    );
  }
}
