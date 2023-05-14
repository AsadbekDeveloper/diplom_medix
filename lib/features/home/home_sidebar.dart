import 'package:diplom_medix/cubit/main_page_controller.dart';
import 'package:diplom_medix/features/dashboard/dashboard_sidebar.dart';
import 'package:diplom_medix/helper/constant.dart';
import 'package:diplom_medix/helper/text.dart';
import 'package:diplom_medix/features/doctors/doctors_list_sidebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../helper/colors.dart';
import 'bottom_appbar.dart';

class HomeSidebar extends StatelessWidget {
  const HomeSidebar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.sidebarColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: AppColors.containerWhite,
                child: Text(
                  'M',
                  style: AppText.headMedium.copyWith(
                    color: AppColors.primaryPink,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  'MEDIX',
                  style: AppText.headMedium,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const FaIcon(
                  FontAwesomeIcons.magnifyingGlass,
                  size: iconLarge,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: BlocBuilder<MainPageController, int>(
              builder: (context, state) {
                final sidebars = [
                  const DashboardSidebar(),
                  const DoctorsListSidebar(),
                  const Center(
                    child: Text('Medic'),
                  ),
                ];
                return sidebars[state];
              },
            ),
          ),
          const HomeBottomAppBar(),
        ],
      ),
    );
  }
}
