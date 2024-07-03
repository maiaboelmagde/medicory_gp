import 'package:flutter/material.dart';

class MedicineModel {
  final num id;
  final String medicineName;
  final String dose;
  final num frequency;
  final String tips;
  String? sideEffects;
  
  MedicineModel(
      {required this.id,
      required this.medicineName,
      required this.dose,
      required this.frequency,
      required this.tips,
      @required this.sideEffects
      });

  factory MedicineModel.fromjson(jsonData) {
    
    return MedicineModel(
        id: jsonData['id'],
        medicineName: jsonData['medicineName'],
        dose: jsonData['dose'],
        frequency: jsonData['frequency'],
        tips: jsonData['tips'],
        sideEffects: jsonData['sideEffects']
        );
  }
}