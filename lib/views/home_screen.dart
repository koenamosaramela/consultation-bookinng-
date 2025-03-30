/*
 * Student Numbers:        221001482,        222043497,                   2221013309,              221014333,            222075927
 * Student Names:  Koena Mosa Ramela, Tshwaro Thothela, Selloane Relebohile Letsoara, Vinjiwe Onica Precious, Lesego Ignician Moutlana
 * Question: Home Screen
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/consultation_view_model.dart';
import 'add_consultation_screen.dart';
import 'consultation_details.dart';
import 'profile_page_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [const HomeContent(), const ProfilePage()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consultation Booking'),
        backgroundColor: Colors.blueAccent,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddConsultationScreen(),
            ),
          );
        },
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ConsultationViewModel>(
      builder: (context, consultationViewModel, child) {
        return ListView.builder(
          itemCount: consultationViewModel.consultations.length,
          itemBuilder: (context, index) {
            final consultation = consultationViewModel.consultations[index];
            return ListTile(
              title: Text(
                '${consultation.topic} - ${consultation.description}',
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 18,
                color: Colors.blueAccent,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => ConsultationDetails(
                          consultation: {
                            'id': consultation.id,
                            'date': consultation.date,
                            'time': consultation.time,
                            'description': consultation.description,
                            'topic': consultation.topic,
                          },
                        ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
