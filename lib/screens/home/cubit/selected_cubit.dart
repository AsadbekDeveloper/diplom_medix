// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../model/doctor.dart';

part 'selected_state.dart';

class SelectedCubit extends Cubit<SelectedState> {
  SelectedCubit() : super(NotSelected());
  select(DoctorModel newDoctor) {
    emit(
      Selected(doctor: newDoctor),
    );
  }
}
