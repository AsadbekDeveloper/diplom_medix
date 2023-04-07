// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:diplom_medix/helper/constant.dart';
import 'package:diplom_medix/helper/text.dart';
import 'package:diplom_medix/screens/home/cubit/selected_cubit.dart';
import 'package:flutter/material.dart';

import 'package:diplom_medix/model/doctor.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../helper/colors.dart';

class DoctorContainer extends StatelessWidget {
  final DoctorModel doctor;
  const DoctorContainer({
    Key? key,
    required this.doctor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectedCubit, SelectedState>(
      builder: (context, state) {
        bool isSelected = false;
        if (state is Selected) {
          isSelected = doctor.name == state.doctor.name;
        }

        return AnimatedContainer(
          duration: const Duration(
            milliseconds: 500,
          ),
          curve: Curves.ease,
          height: isSelected ? 100 : 80,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color:
                isSelected ? AppColors.primaryPink : AppColors.containerWhite,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              ClipOval(
                child: SizedBox(
                  height: 40,
                  width: 40,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: AppColors.sidebarColor,
                    child: Icon(
                      Icons.person,
                      color: AppColors.secondaryText,
                      size: 30,
                    ),
                  ),
                  // CachedNetworkImage(
                  //   imageUrl: doctor.imageUrl,
                  //   placeholder: (context, url) => const Center(
                  //     child: CircularProgressIndicator(),
                  //   ),
                  //   errorWidget: (context, url, error) =>
                  //       const Icon(Icons.error),
                  // ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    doctor.name,
                    style:
                        isSelected ? AppText.headSmallWhite : AppText.headSmall,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.person,
                        color: isSelected
                            ? AppColors.containerWhite
                            : AppColors.secondaryText,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        '${doctor.age} y.o.',
                        style: isSelected
                            ? AppText.bodyMediumWhite
                            : AppText.bodyMedium,
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              CircleAvatar(
                radius: 15,
                backgroundColor: isSelected
                    ? AppColors.primaryText
                    : AppColors.containerWhite,
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: isSelected
                      ? AppColors.containerWhite
                      : AppColors.primaryPink,
                  size: iconMedium,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
