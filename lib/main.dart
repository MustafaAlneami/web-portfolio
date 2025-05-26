import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:firebase_core/firebase_core.dart'; // Temporarily remove for UI preview
import 'view/portfolio_view.dart';
import 'viewmodel/portfolio_viewmodel.dart';

void main() async {
  //WidgetsFlutterBinding.ensureInitialized();
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
        textTheme: GoogleFonts.montserratTextTheme(),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: PortfolioView(viewModel: PortfolioViewModel()),
      debugShowCheckedModeBanner: false,
    );
  }
}
