import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialFooter extends StatelessWidget {
  const SocialFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: Image.asset(
              'assets/social_media_icons/githubicon.png',
              width: 32,
            ),
            tooltip: 'GitHub',
            onPressed: () {
              // TODO: Open GitHub
            },
          ),
          const SizedBox(width: 16),
          IconButton(
            icon: Image.asset(
              'assets/social_media_icons/linkedinicon.png',
              width: 32,
            ),
            tooltip: 'LinkedIn',
            onPressed: () {
              // TODO: Open LinkedIn
            },
          ),
        ],
      ),
    );
  }
}
