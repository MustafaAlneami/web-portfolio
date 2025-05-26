import 'package:flutter/material.dart';
import '../model/project.dart';
import '../model/contact_message.dart';

class PortfolioViewModel extends ChangeNotifier {
  // Sample data for projects
  final List<Project> projects = [
    Project(
      title: 'Project One',
      description: 'A cool Flutter app.',
      imageUrl: 'assets/images/project1/1.png',
      githubUrl: 'https://github.com/yourusername/project1',
    ),
    Project(
      title: 'Project Two',
      description: 'Another awesome project.',
      imageUrl: 'assets/images/project2/1.png',
      githubUrl: 'https://github.com/yourusername/project2',
    ),
    Project(
      title: 'Project Three',
      description: 'A web portfolio!',
      imageUrl: 'assets/images/project1/2.png',
      githubUrl: 'https://github.com/yourusername/project3',
    ),
  ];

  // About me text
  String get aboutMe =>
      'I am a passionate Flutter developer building beautiful apps.';

  // Contact form submission stub
  Future<void> submitContact(ContactMessage message) async {
    // TODO: Integrate with Firebase Firestore
    await Future.delayed(const Duration(seconds: 1));
  }
}
