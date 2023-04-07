// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:diplom_medix/helper/constant.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:diplom_medix/model/doctor.dart';
import 'package:diplom_medix/repository/doctor.dart';

part 'doctor_event.dart';
part 'doctor_state.dart';

class DoctorBloc extends Bloc<DoctorEvent, DoctorState> {
  DoctorBloc() : super(DoctorInitial()) {
    on<LoadDoctors>((event, emit) async {
      emit(DoctorLoading());
      final List<DoctorModel> allDoctors = await DoctorRepo.loadDoctors();
      if (allDoctors.isNotEmpty) {
        List<DoctorModel> roomDoctors = [];
        for (final doctor in allDoctors) {
          if (doctor.room == roomNames[0]) {
            roomDoctors.add(doctor);
          }
        }

        emit(
          DoctorLoaded(
            allDoctors: allDoctors,
            roomDoctors: roomDoctors,
          ),
        );
      } else {
        emit(
          DoctorError(message: 'No Doctors'),
        );
      }
    });

    on<SelectRoom>((event, emit) {
      final currentState = super.state;
      List<DoctorModel> roomDoctors = [];
      if (currentState is DoctorLoaded) {
        for (final doctor in currentState.allDoctors) {
          if (doctor.room == event.room) {
            roomDoctors.add(doctor);
          }
        }
        emit(
          DoctorLoaded(
            allDoctors: currentState.allDoctors,
            roomDoctors: roomDoctors,
          ),
        );
      }
    });
  }
}
