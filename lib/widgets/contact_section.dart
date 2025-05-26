import 'package:flutter/material.dart';
import '../utils/responsive_utils.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final neonGradient = const LinearGradient(
      colors: [Color(0xFFDA22FF), Color(0xFF3A8DFF)],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    );

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          width: 2,
          color: Colors.purpleAccent.withOpacity(0.5),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.purpleAccent.withOpacity(0.5),
            blurRadius: 24,
            spreadRadius: 4,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 32,
            spreadRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Title
          Text(
            'Contact',
            style: TextStyle(
              fontSize: ResponsiveUtils.getResponsiveFontSize(context, 32),
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 24),
          // Contact Cards
          LayoutBuilder(
            builder: (context, constraints) {
              final isDesktop = ResponsiveUtils.isDesktop(context);
              final isTablet = ResponsiveUtils.isTablet(context);
              final itemWidth = isDesktop
                  ? (constraints.maxWidth - 48) / 3
                  : (isTablet
                        ? (constraints.maxWidth - 32) / 2
                        : constraints.maxWidth);

              return Wrap(
                spacing: ResponsiveUtils.getGridSpacing(context) * 2,
                runSpacing: ResponsiveUtils.getGridSpacing(context) * 2,
                children: [
                  _ContactCard(
                    icon: Icons.email,
                    title: 'Email',
                    content: 'your.email@example.com',
                    gradient: neonGradient,
                    width: itemWidth,
                  ),
                  _ContactCard(
                    icon: Icons.phone,
                    title: 'Phone',
                    content: '+1 (555) 123-4567',
                    gradient: neonGradient,
                    width: itemWidth,
                  ),
                  _ContactCard(
                    icon: Icons.location_on,
                    title: 'Location',
                    content: 'Your Location',
                    gradient: neonGradient,
                    width: itemWidth,
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ContactCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String content;
  final Gradient gradient;
  final double width;

  const _ContactCard({
    required this.icon,
    required this.title,
    required this.content,
    required this.gradient,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.purpleAccent.withOpacity(0.3),
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                gradient: gradient,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: Colors.white,
                size: ResponsiveUtils.getIconSize(context, baseSize: 24),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: ResponsiveUtils.getResponsiveFontSize(context, 18),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              content,
              style: TextStyle(
                color: Colors.white70,
                fontSize: ResponsiveUtils.getResponsiveFontSize(context, 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
