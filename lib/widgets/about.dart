import 'package:flutter/material.dart';
import '../viewmodel/portfolio_viewmodel.dart';

class AboutSection extends StatelessWidget {
  final PortfolioViewModel viewModel;
  const AboutSection({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About Me',
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Text(viewModel.aboutMe, style: Theme.of(context).textTheme.bodyLarge),
        ],
      ),
    );
  }
}
