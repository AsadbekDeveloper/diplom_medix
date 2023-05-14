import 'package:diplom_medix/features/doctors/doctors_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/main_page_controller.dart';
import '../../helper/colors.dart';
import '../../helper/constant.dart';

class HomeMain extends StatelessWidget {
  const HomeMain({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(
        color: AppColors.scaffoldColor,
      ),
      child: Row(
        children: [
          SizedBox(
            width: sidebarWidth,
            height: size.height,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 30,
                horizontal: 20,
              ),
              child: BlocBuilder<MainPageController, int>(
                builder: (context, state) {
                  final sidebars = [
                    const Center(
                      child: Text('Main'),
                    ),
                    const DoctorsMain(),
                    const Center(
                      child: Text('Medic'),
                    ),
                  ];
                  return sidebars[state];
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
