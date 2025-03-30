/*
 * Student Numbers:        221001482,        222043497,                   2221013309,              221014333,            222075927
 * Student Names:  Koena Mosa Ramela, Tshwaro Thothela, Selloane Relebohile Letsoara, Vinjiwe Onica Precious, Lesego Ignician Moutlana
 * Question: Consultation View Model
 */


import 'package:flutter/material.dart';
import '../models/consultation.dart';

class ConsultationViewModel with ChangeNotifier {
  final List<Consultation> _consultations = [];

  List<Consultation> get consultations => _consultations;

  void addConsultation(Consultation consultation) {
    _consultations.add(consultation);
    notifyListeners();
  }

  void removeConsultation(String id) {
    _consultations.removeWhere((consultation) => consultation.id == id);
    notifyListeners(); 
  }
}
