/*
 * Student Numbers:        221001482,        222043497,                   2221013309,              221014333,            222075927
 * Student Names:  Koena Mosa Ramela, Tshwaro Thothela, Selloane Relebohile Letsoara, Vinjiwe Onica Precious, Lesego Ignician Moutlana
 * Question: Profile Details
 */

import 'package:bookingapp/viewmodels/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
 
class ProfileDetails extends StatelessWidget {
  const ProfileDetails({super.key});
 
 
  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileViewModel>(
      builder: (context, profileViewModel, child) {
        return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              profileViewModel.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              profileViewModel.role,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            Text(
              'Email: ${profileViewModel.email}',
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              'Phone: ${profileViewModel.phone}',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        );
      },
    );
  }
}