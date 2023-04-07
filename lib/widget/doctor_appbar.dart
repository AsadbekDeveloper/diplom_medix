// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:diplom_medix/model/doctor.dart';
import 'package:flutter/material.dart';

import 'package:diplom_medix/model/doctor.dart';

import '../helper/colors.dart';
import '../helper/text.dart';

class DoctorAppBar extends StatelessWidget {
  final DoctorModel doctor;
  const DoctorAppBar({
    Key? key,
    required this.doctor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
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
                //   errorWidget: (context, url, error) => const Icon(Icons.error),
                // ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: CircleAvatar(
                radius: 8,
                backgroundColor: AppColors.primaryBlue,
                child: Text(
                  '2',
                  style: TextStyle(
                    color: AppColors.containerWhite,
                  ),
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          width: 15,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              doctor.name,
              style: AppText.headSmall,
            ),
            Row(
              children: [
                Icon(
                  Icons.person,
                  color: AppColors.secondaryText,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  '${doctor.age} y.o.',
                  style: AppText.bodyMedium,
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
