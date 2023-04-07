import 'package:diplom_medix/helper/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomeBottomAppBar extends StatefulWidget {
  const HomeBottomAppBar({super.key});

  @override
  State<HomeBottomAppBar> createState() => _HomeBottomAppBarState();
}

class _HomeBottomAppBarState extends State<HomeBottomAppBar> {
  int _selectedItemPosition = 0;
  @override
  Widget build(BuildContext context) {
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
      selectedIndex: _selectedItemPosition,
      onTabChange: (index) {
        setState(() {
          _selectedItemPosition = index;
        });
      },
    );
  }
}
