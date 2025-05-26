import 'package:flutter/material.dart';
import 'package:rich_typewriter/rich_typewriter.dart';
import '../viewmodel/portfolio_viewmodel.dart';

class Header extends StatelessWidget {
  final PortfolioViewModel viewModel;
  const Header({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Your Name',
            style: Theme.of(
              context,
            ).textTheme.displaySmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          RichTypewriter(
            child: Text.rich(
              TextSpan(
                text: 'Flutter Developer',
                children: [
                  TextSpan(text: '\nMobile Enthusiast'),
                  TextSpan(text: '\nUI/UX Lover'),
                ],
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
