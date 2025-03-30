/**
 * Student Numbers:        221001482,        222043497,                   2221013309,              221014333,            222075927
 * Student Names:  Koena Mosa Ramela, Tshwaro Thothela, Selloane Relebohile Letsoara, Vinjiwe Onica Precious, Lesego Ignny Moutlana
 * Question: Route Manager
 */




import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/profile_view_model.dart'; // Import ProfileViewModel
import '../views/home_screen.dart';
import '../views/add_consultation_screen.dart';
import '../views/consultation_details.dart';
import '../views/profile_page_screen.dart'; // Import ProfilePage

class RouteManager {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case '/addConsultation':
        return MaterialPageRoute(builder: (_) => const AddConsultationScreen());
      case '/consultationDetails':
        final consultation = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => ConsultationDetails(consultation: consultation),
        );
      case '/profile':
        return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider.value( //replaced the _ in builder with context
            value: Provider.of<ProfileViewModel>(context, listen: false), // Pass ProfileViewModel , changed underscore to context
            child: const ProfilePage(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}