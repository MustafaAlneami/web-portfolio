import 'package:flutter/material.dart';
import 'package:rich_typewriter/rich_typewriter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../viewmodel/portfolio_viewmodel.dart';

class Header extends StatelessWidget {
  final PortfolioViewModel viewModel;
  const Header({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Profile image
          CircleAvatar(
            radius: 56,
            backgroundImage: AssetImage('assets/images/profile.jpg'),
          ),
          const SizedBox(width: 32),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your Name',
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1565C0),
                  ),
                ),
                const SizedBox(height: 12),
                RichTypewriter(
                  delay: 80,
                  child: Text.rich(
                    TextSpan(
                      text: 'Flutter Developer',
                      children: [
                        TextSpan(text: '\nMobile Enthusiast'),
                        TextSpan(text: '\nUI/UX Lover'),
                      ],
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Color(0xFF1976D2),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (MediaQuery.of(context).size.width > 900)
            SvgPicture.asset(
              'assets/svg/undraw_developer-avatar_f6ac.svg',
              width: 120,
            ),
        ],
      ),
    );
  }
}
