/*
 * Student Numbers:        221001482,        222043497,                   2221013309,              221014333,            222075927
 * Student Names:  Koena Mosa Ramela, Tshwaro Thothela, Selloane Relebohile Letsoara, Vinjiwe Onica Precious, Lesego Ignician Moutlana
 * Question: Profile View Model
 */


import 'package:flutter/material.dart';
import 'dart:io';
import '../models/profile.dart';

class ProfileViewModel with ChangeNotifier {
  final Profile _profile = Profile(
    name: 'Koena Ramela',
    role: 'Software Developer',
    email: 'ramelak@cut.ac.za',
    phone: '051 234 5678',
  );

  
  String get name => _profile.name;
  String get role => _profile.role;
  String get email => _profile.email;
  String get phone => _profile.phone;
  File? get image => _profile.image;

  
  void updateName(String newName) {
    _profile.name = newName;
    notifyListeners();
  }

  void updateRole(String newRole) {
    _profile.role = newRole;
    notifyListeners();
  }

  void updateEmail(String newEmail) {
    _profile.email = newEmail;
    notifyListeners();
  }

  void updatePhone(String newPhoneNumber) {
    _profile.phone = newPhoneNumber;
    notifyListeners();
  }

  void updateImage(File newImage) {
    _profile.image = newImage;
    notifyListeners();
  }
}
