import 'package:diplom_medix/helper/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../../cubit/main_page_controller.dart';

class HomeBottomAppBar extends StatelessWidget {
  const HomeBottomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainPageController, int>(
      builder: (context, state) {
        return GNav(
          rippleColor: AppColors.scaffoldColor,
          hoverColor: AppColors.containerWhite,
          gap: 10,
          activeColor: AppColors.primaryText,
          iconSize: 20,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          duration: const Duration(milliseconds: 400),
          color: AppColors.secondaryText,
          tabs: const [
            GButton(
              icon: FontAwesomeIcons.house,
              text: 'Home',
            ),
            GButton(
              icon: FontAwesomeIcons.peopleGroup,
              text: 'Doctors',
            ),
            GButton(
              icon: FontAwesomeIcons.kitMedical,
              text: 'Medicine',
            ),
          ],
          selectedIndex: state,
          onTabChange: (index) {
            context.read<MainPageController>().change(index);
          },
        );
      },
    );
  }
}
