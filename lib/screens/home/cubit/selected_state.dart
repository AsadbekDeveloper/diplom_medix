// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'selected_cubit.dart';

class SelectedState extends Equatable {
  const SelectedState();

  @override
  List<Object> get props => [];
}

class NotSelected extends SelectedState {}

class Selected extends SelectedState {
  final DoctorModel doctor;
  const Selected({
    required this.doctor,
  });
  @override
  List<Object> get props => [doctor];
}
