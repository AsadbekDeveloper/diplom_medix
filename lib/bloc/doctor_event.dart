// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'doctor_bloc.dart';

@immutable
abstract class DoctorEvent {}

class LoadDoctors extends DoctorEvent {}

class SelectRoom extends DoctorEvent {
  final String room;
  SelectRoom({
    required this.room,
  });
}
