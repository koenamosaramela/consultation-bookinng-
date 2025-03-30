/*
 * Student Numbers:        221001482,        222043497,                   2221013309,              221014333,            222075927
 * Student Names:  Koena Mosa Ramela, Tshwaro Thothela, Selloane Relebohile Letsoara, Vinjiwe Onica Precious, Lesego Ignician Moutlana
 * Question: Home Page Screen
 */

import 'package:bookingapp/viewmodels/profile_view_model.dart';
import 'package:bookingapp/views/widgets/profile_details.dart';
import 'package:bookingapp/views/widgets/profile_image.dart';
import 'package:bookingapp/views/widgets/update_button.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      Provider.of<ProfileViewModel>(context, listen: false).updateImage(File(pickedFile.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
        backgroundColor: Colors.blueAccent, 
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            return Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ProfileImage(onImagePick: _pickImage),
                      const SizedBox(height: 10),
                      const ProfileDetails(),
                    ],
                  ),
                ),
                const Expanded(
                  child: Center(
                    child: UpdateButton(),
                  ),
                ),
              ],
            );
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfileImage(onImagePick: _pickImage),
                const SizedBox(height: 10),
                const ProfileDetails(),
                const SizedBox(height: 20),
                const UpdateButton(),
              ],
            );
          }
        },
      ),
    );
  }
}
