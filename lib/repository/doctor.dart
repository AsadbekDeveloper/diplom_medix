import 'dart:math';
import 'package:diplom_medix/model/doctor.dart';
import 'package:diplom_medix/model/patient.dart';
import 'package:flutter/material.dart';
import '../constants/firstnames.dart';
import '../constants/illnesses.dart';
import '../helper/constant.dart';
import 'package:collection/collection.dart';

class DoctorRepo {
  static Future<List<DoctorModel>> loadDoctors() async {
    final random = Random();
    final List<PatientModel> patients = List.generate(
      random.nextInt(10) + 1,
      (index) {
        DateTime from = DateTime.now();
        try {
          final day = random.nextInt(24);
          final dayString = day > 10 ? day.toString() : '0$day';
          from = DateTime.parse('2023-04-24T$dayString:06:10+0000').add(
            Duration(
              days: random.nextInt(60) - 30,
            ),
          );
        } catch (e) {
          debugPrint(e.toString());
        }
        return PatientModel(
          name: '${firstNames[random.nextInt(
            firstNames.length,
          )]} ${firstNames[random.nextInt(
            firstNames.length,
          )]}',
          age: random.nextInt(20) + 20,
          illness: illnesses[random.nextInt(illnesses.length)],
          from: from,
          to: from.subtract(
            Duration(
              minutes: random.nextInt(12) * 10 + 10,
            ),
          ),
        );
      },
    );
    List<DoctorModel> doctors = List.generate(
      20,
      (index) => DoctorModel(
        name: '${firstNames[random.nextInt(
          firstNames.length,
        )]} ${firstNames[random.nextInt(
          firstNames.length,
        )]}',
        age: random.nextInt(20) + 20,
        room: roomNames[Random().nextInt(
          roomNames.length,
        )],
        email: 'graeafafr@gadaf.dsa',
        imageUrl: 'https://i.pravatar.cc/300',
        patients: patients.sample(
          random.nextInt(
            patients.length,
          ),
        ),
        phone: '+43982753953',
      ),
    );

    return doctors;
  }
}
