import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:firebase_core/firebase_core.dart'; // Temporarily remove for UI preview
import 'view/portfolio_view.dart';
import 'viewmodel/portfolio_viewmodel.dart';
import 'utils/responsive_utils.dart';
import 'pages/hero_section.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Temporarily skip Firebase initialization for UI preview
  // await Firebase.initializeApp(  options: DefaultFirebaseOptions.currentPlatform,);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Portfolio',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.dark(
          primary: Colors.blue.shade400,
          secondary: Colors.purple.shade400,
          surface: const Color(0xFF1A1A1A),
          background: Colors.black,
          onBackground: Colors.white,
          onSurface: Colors.white,
        ),
        textTheme: TextTheme(
          displayLarge: GoogleFonts.montserrat(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 48,
          ),
          displayMedium: GoogleFonts.montserrat(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 36,
          ),
          displaySmall: GoogleFonts.montserrat(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 24,
          ),
          bodyLarge: GoogleFonts.kalam(color: Colors.white, fontSize: 18),
          bodyMedium: GoogleFonts.kalam(color: Colors.white, fontSize: 16),
          labelLarge: GoogleFonts.montserrat(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        cardTheme: CardThemeData(
          color: const Color(0xFF1A1A1A),
          elevation: 2,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue.shade400,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            elevation: 1,
          ),
        ),
      ),
      home: const HeroSection(),
      debugShowCheckedModeBanner: false,
    );
  }
}
