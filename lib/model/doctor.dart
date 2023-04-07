// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:diplom_medix/helper/constant.dart';
import 'package:diplom_medix/model/patient.dart';

class DoctorModel {
  final String name;
  final int age;
  final String room;
  final String phone;
  final String email;
  final String imageUrl;
  final List<PatientModel> patients;
  DoctorModel({
    required this.name,
    required this.age,
    required this.room,
    required this.phone,
    required this.email,
    required this.imageUrl,
    required this.patients,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'age': age,
      'type': room,
      'phone': phone,
      'imageUrl': imageUrl,
    };
  }

  factory DoctorModel.fromMap(
      Map<String, dynamic> map, List<PatientModel> patients) {
    final String name = '${map['name']['first']} ${map['name']['last']}';
    return DoctorModel(
      name: name,
      age: map["dob"]['age'] as int,
      room: roomNames[Random().nextInt(
        roomNames.length,
      )],
      phone: map['phone'] as String,
      email: map['email'] as String,
      imageUrl: map['picture']['medium'] as String,
      patients: patients,
    );
  }
}
