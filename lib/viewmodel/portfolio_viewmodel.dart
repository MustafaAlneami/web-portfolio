import 'package:flutter/material.dart';
import '../model/project.dart';
import '../model/contact_message.dart';

class PortfolioViewModel extends ChangeNotifier {
  // Sample data for projects
  final List<Project> projects = [
    Project(
      title: 'Project One',
      description: 'A cool Flutter app.',
      imageUrl: 'https://via.placeholder.com/300',
      githubUrl: 'https://github.com/yourusername/project1',
    ),
    Project(
      title: 'Project Two',
      description: 'Another awesome project.',
      imageUrl: 'https://via.placeholder.com/300',
      githubUrl: 'https://github.com/yourusername/project2',
    ),
    Project(
      title: 'Project Three',
      description: 'A web portfolio!',
      imageUrl: 'https://via.placeholder.com/300',
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
