/*
 * Student Numbers:        221001482,        222043497,                   2221013309,              221014333,            222075927
 * Student Names:  Koena Mosa Ramela, Tshwaro Thothela, Selloane Relebohile Letsoara, Vinjiwe Onica Precious, Lesego Ignician Moutlana
 * Question: Consultation Details
 */


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/consultation_view_model.dart';

class ConsultationDetails extends StatelessWidget {
  final Map<String, dynamic> consultation;

  const ConsultationDetails({required this.consultation, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consultation Details'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(' Date: ${consultation['date']}',
                style: const TextStyle(fontSize: 18)),
            Text('Time: ${consultation['time']}',
                style: const TextStyle(fontSize: 18)),
            Text(' Description: ${consultation['description']}',
                style: const TextStyle(fontSize: 18)),
            Text(' Topic: ${consultation['topic']}',
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () =>
                  _showDeleteConfirmation(context, consultation['id']),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
              child: const Text('Delete Consultation',
                  style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  void _showDeleteConfirmation(BuildContext context, String id) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Delete Consultation'),
          content:
              const Text('Are you sure you want to delete this consultation?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                
                Provider.of<ConsultationViewModel>(context, listen: false)
                    .removeConsultation(id);

             
                Navigator.of(dialogContext).pop();
                Navigator.of(context).pop();

              },
              child: const Text('Delete', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }
}
