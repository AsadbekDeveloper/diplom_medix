import 'package:diplom_medix/helper/text.dart';
import 'package:diplom_medix/widget/rounded_container.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../helper/colors.dart';
import '../model/patient.dart';

class PatientContainer extends StatelessWidget {
  final PatientModel patient;
  const PatientContainer({
    Key? key,
    required this.patient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      margin: const EdgeInsets.all(10),
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
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  patient.name,
                  style: AppText.headSmall,
                ),
                Text(
                  patient.illness,
                  style: AppText.bodyMedium,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primaryBlue,
                    borderRadius: BorderRadius.circular(
                      15,
                    ),
                  ),
                  child: Text(
                    '${DateFormat('hh:mm').format(patient.from)} - ${DateFormat('hh:mm').format(patient.to)}',
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
