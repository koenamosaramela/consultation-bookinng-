/*
 * Student Numbers:        221001482,        222043497,                   2221013309,              221014333,            222075927
 * Student Names:  Koena Mosa Ramela, Tshwaro Thothela, Selloane Relebohile Letsoara, Vinjiwe Onica Precious, Lesego Ignician Moutlana
 * Question: Consultation Screen
 */



import 'package:bookingapp/models/consultation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../viewmodels/consultation_view_model.dart';

class AddConsultationScreen extends StatefulWidget {
  const AddConsultationScreen({super.key});

  @override
  
  _AddConsultationScreenState createState() => _AddConsultationScreenState();
}

class _AddConsultationScreenState extends State<AddConsultationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _dateController = TextEditingController();
  final _timeController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _topicController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2025, 12, 31),
    );
    if (picked != null) {
      setState(() {
        _dateController.text = DateFormat('EEE, MMM d').format(picked);
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        _timeController.text = picked.format(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Consultation'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              
              TextFormField(
                controller: _dateController,
                decoration: const InputDecoration(
                  labelText: 'Date',
                  suffixIcon: Icon(Icons.calendar_today),
                ),
                readOnly: true,
                onTap: () => _selectDate(context),
                validator: (value) {
                  if (value!.isEmpty) return 'Please select a date';
                  return null;
                },
              ),

              
              TextFormField(
                controller: _timeController,
                decoration: const InputDecoration(
                  labelText: 'Time',
                  suffixIcon: Icon(Icons.access_time),
                ),
                readOnly: true,
                onTap: () => _selectTime(context),
                validator: (value) {
                  if (value!.isEmpty) return 'Please select a time';
                  return null;
                },
              ),

              
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
                validator: (value) {
                  if (value!.isEmpty) return 'Please enter a description';
                  return null;
                },
              ),

              
              TextFormField(
                controller: _topicController,
                decoration: const InputDecoration(labelText: 'Topic'),
                validator: (value) {
                  if (value!.isEmpty) return 'Please enter a topic';
                  return null;
                },
              ),

              const SizedBox(height: 20),

              
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
Provider.of<ConsultationViewModel>(context, listen: false).addConsultation(
  Consultation(
    id: DateTime.now().toString(),
    date: _dateController.text,
    time: _timeController.text,
    description: _descriptionController.text,
    topic: _topicController.text,
  ),
);
                    Navigator.pop(context);
                  }
                },
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}