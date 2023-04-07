import 'package:diplom_medix/model/doctor.dart';
import 'package:diplom_medix/screens/home/cubit/room_cubit.dart';
import 'package:diplom_medix/screens/home/cubit/selected_cubit.dart';
import 'package:diplom_medix/widget/doctor_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/doctor_bloc.dart';

class HomeDoctorList extends StatelessWidget {
  const HomeDoctorList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<DoctorBloc, DoctorState>(
        builder: (context, state) {
          if (state is DoctorInitial || state is DoctorLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is DoctorLoaded) {
            List<DoctorModel> roomDoctors = state.roomDoctors;
            return BlocListener<RoomCubit, RoomState>(
              listener: (context, state) {
                context.read<DoctorBloc>().add(
                      SelectRoom(room: state.room),
                    );
              },
              child: ListView.separated(
                itemCount: roomDoctors.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    context.read<SelectedCubit>().select(
                          roomDoctors[index],
                        );
                  },
                  child: DoctorContainer(
                    doctor: roomDoctors[index],
                  ),
                ),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
              ),
            );
          }
          return Center(
            child: Text(
              state.props.toString(),
            ),
          );
        },
      ),
    );
  }
}
