import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import '../viewmodel/portfolio_viewmodel.dart';
import '../widgets/header.dart';
import '../widgets/about.dart';
import '../widgets/projects.dart';
import '../widgets/contact_form.dart';
import '../widgets/social_footer.dart';

class PortfolioView extends StatelessWidget {
  final PortfolioViewModel viewModel;
  const PortfolioView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 700;
    return Stack(
      children: [
        // Animated SVG background
        Positioned.fill(
          child: SvgPicture.asset(
            'assets/svg/blurry-gradient-haikei.svg',
            fit: BoxFit.cover,
            colorFilter: const ColorFilter.mode(
              Color(0xFF1565C0),
              BlendMode.modulate,
            ),
          ),
        ),
        // Decorative Lottie animation (top right)
        Positioned(
          top: 0,
          right: 0,
          child: SizedBox(
            width: isWide ? 220 : 120,
            child: Lottie.asset(
              'assets/animations/superhero.json',
              repeat: true,
              animate: true,
            ),
          ),
        ),
        // Main content
        SingleChildScrollView(
          child: Column(
            children: [
              Header(viewModel: viewModel),
              AboutSection(viewModel: viewModel),
              ProjectsSection(viewModel: viewModel),
              ContactForm(viewModel: viewModel),
              SocialFooter(),
            ],
          ),
        ),
      ],
    );
  }
}
