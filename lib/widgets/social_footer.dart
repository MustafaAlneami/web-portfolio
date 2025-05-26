import 'package:flutter/material.dart';

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
            icon: const Icon(Icons.code),
            tooltip: 'GitHub',
            onPressed: () {
              // TODO: Open GitHub
            },
          ),
          const SizedBox(width: 16),
          IconButton(
            icon: const Icon(Icons.business),
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
