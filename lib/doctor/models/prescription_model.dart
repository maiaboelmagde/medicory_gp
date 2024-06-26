import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:medicory_gp/doctor/models/images_model.dart';
import 'package:medicory_gp/doctor/models/tests_model.dart';

class PrescriptionModel {
  final prescriptionResponseModel prescriptionResponse;
  final List<medication>? medications;
  final List<TestsModel>? labTests;
  final List<ImagesModel>? imagingTests;

  PrescriptionModel(
      {required this.prescriptionResponse,
        required this.medications,
      @required this.labTests,
      @required this.imagingTests});

  factory PrescriptionModel.fromjson(jsonData) {
    List<medication> medicationList = [];
    for (int i = 0; i < jsonData['medications'].length; i++) {
      medicationList.add(medication.fromjson(jsonData['medications'][i]));
    }

    

    List<TestsModel> TestsList = [];
    for (int i = 0; i < jsonData['labTests'].length; i++) {
      TestsList.add(TestsModel.fromjson(jsonData['labTests'][i]));
    }

    List<ImagesModel> imagesList = [];
    for (int i = 0; i < jsonData['imagingTests'].length; i++) {
      imagesList.add(ImagesModel.fromjson(jsonData['imagingTests'][i]));
    }
    return PrescriptionModel(
      prescriptionResponse: prescriptionResponseModel.fromjson(jsonData['prescriptionResponse']),
        medications: medicationList,
        labTests: TestsList,
        imagingTests: imagesList);
  }
}

class prescriptionResponseModel {
  final num prescriptionId;
  final String? doctorName;
  final bool medicationStatus;
  final bool prescriptionStatus;
  final String createdAt;
  final String updatedAt;

  prescriptionResponseModel(
      {required this.prescriptionId,
      required this.doctorName,
      required this.medicationStatus,
      required this.prescriptionStatus,
      required this.createdAt,
      required this.updatedAt});

  factory prescriptionResponseModel.fromjson(jsonData) {
    return prescriptionResponseModel(
        prescriptionId: jsonData['prescriptionId'],
        doctorName: jsonData['doctorName'],
        medicationStatus: jsonData['medicationStatus'],
        prescriptionStatus: jsonData['prescriptionStatus'],
        createdAt: jsonData['createdAt'],
        updatedAt: jsonData['updatedAt']);
  }
}

class medication {
  final num id;
  final String medicineName;
  final String dose;
  final num frequency;
  final String tips;
  String? createdAt;
  String? updatedAt;

  medication(
      {required this.id,
      required this.medicineName,
      required this.dose,
      required this.frequency,
      required this.tips,
      @required this.createdAt,
      @required this.updatedAt});

  factory medication.fromjson(jsonData) {
    return medication(
        id: jsonData['id'],
        medicineName: jsonData['name'],
        dose: jsonData['dose'],
        frequency: jsonData['frequency'],
        tips: jsonData['tips'],
        createdAt: jsonData['createdAt'],
        updatedAt: jsonData['updatedAt']);
  }
}
