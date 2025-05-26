import 'package:flutter/material.dart';
import '../viewmodel/portfolio_viewmodel.dart';
import '../widgets/header.dart';
import '../widgets/about.dart';
import '../widgets/projects.dart';
import '../widgets/contact_form.dart';
import '../widgets/social_footer.dart';
import '../utils/responsive_utils.dart';

class PortfolioView extends StatelessWidget {
  final PortfolioViewModel viewModel;
  const PortfolioView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: ResponsiveUtils.getResponsiveLayoutPadding(context),
              child: Header(viewModel: viewModel),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: ResponsiveUtils.getResponsiveLayoutPadding(context),
              child: AboutSection(viewModel: viewModel),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: ResponsiveUtils.getResponsiveLayoutPadding(context),
              child: ProjectsSection(viewModel: viewModel),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: ResponsiveUtils.getResponsiveLayoutPadding(context),
              child: ContactForm(viewModel: viewModel),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: ResponsiveUtils.getResponsiveLayoutPadding(context),
              child: SocialFooter(),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
