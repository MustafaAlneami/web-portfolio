import 'package:flutter/material.dart';
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
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFf8fafc), Color(0xFFe0e7ef)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
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
      ),
    );
  }
}
