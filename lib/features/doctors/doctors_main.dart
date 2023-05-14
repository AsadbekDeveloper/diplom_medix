import 'package:diplom_medix/helper/constant.dart';
import 'package:diplom_medix/helper/text.dart';
import 'package:diplom_medix/features/home/cubit/selected_cubit.dart';
import 'package:diplom_medix/widget/doctor_appbar.dart';
import 'package:diplom_medix/widget/patient_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tab_container/tab_container.dart';
import '../../bloc/doctor_bloc.dart';
import '../../helper/colors.dart';

class DoctorsMain extends StatefulWidget {
  const DoctorsMain({
    super.key,
  });

  @override
  State<DoctorsMain> createState() => _DoctorsMainState();
}

class _DoctorsMainState extends State<DoctorsMain> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        final currentState = context.read<DoctorBloc>().state;
        if (currentState is DoctorLoaded) {
          context.read<SelectedCubit>().select(
                currentState.allDoctors[0],
              );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> tabContainers = [
      const PatientList(),
      const Center(
        child: Text('Schedule'),
      ),
      const Center(
        child: Text('Calendar'),
      ),
    ];
    return Column(
      children: [
        BlocBuilder<SelectedCubit, SelectedState>(
          builder: (context, state) {
            if (state is Selected) {
              return DoctorAppBar(
                doctor: state.doctor,
              );
            }
            return const Center(
              child: Text('No Doctors selected'),
            );
          },
        ),
        Divider(
          height: 30,
          thickness: 1,
          color: AppColors.secondaryText.withOpacity(0.3),
        ),
        Expanded(
          child: TabContainer(
            radius: 20,
            tabEdge: TabEdge.top,
            color: AppColors.containerWhite,
            tabCurve: Curves.easeIn,
            transitionBuilder: (child, animation) {
              animation =
                  CurvedAnimation(curve: Curves.easeIn, parent: animation);
              return SlideTransition(
                position: Tween(
                  begin: const Offset(0.2, 0.0),
                  end: const Offset(0.0, 0.0),
                ).animate(animation),
                child: FadeTransition(
                  opacity: animation,
                  child: child,
                ),
              );
            },
            selectedTextStyle: AppText.bodyMedium,
            unselectedTextStyle: AppText.bodySmall,
            tabs: tabs,
            children: tabContainers,
          ),
        ),
      ],
    );
  }
}
