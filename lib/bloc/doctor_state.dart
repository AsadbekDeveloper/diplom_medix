part of 'doctor_bloc.dart';

@immutable
abstract class DoctorState extends Equatable {}

class DoctorInitial extends DoctorState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class DoctorLoading extends DoctorState {
  @override
  List<Object?> get props => [];
}

class DoctorLoaded extends DoctorState {
  final List<DoctorModel> allDoctors;
  final List<DoctorModel> roomDoctors;
  DoctorLoaded({
    required this.allDoctors,
    required this.roomDoctors,
  });
  @override
  List<Object?> get props => [allDoctors, roomDoctors];
}

class DoctorError extends DoctorState {
  final String message;
  DoctorError({
    required this.message,
  });
  @override
  List<Object?> get props => [message];
}
