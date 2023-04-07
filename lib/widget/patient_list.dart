import 'package:diplom_medix/screens/home/cubit/selected_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'patient_container.dart';

class PatientList extends StatelessWidget {
  const PatientList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectedCubit, SelectedState>(
      builder: (context, state) {
        if (state is Selected) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 20,
            ),
            child: ListView.builder(
              itemCount: state.doctor.patients.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {},
                child: PatientContainer(
                  patient: state.doctor.patients[index],
                ),
              ),
            ),
          );
        }
        return const Center(
          child: Text('No patients yet'),
        );
      },
    );
  }
}
