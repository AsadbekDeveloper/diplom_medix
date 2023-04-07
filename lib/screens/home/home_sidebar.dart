import 'package:diplom_medix/helper/constant.dart';
import 'package:diplom_medix/helper/text.dart';
import 'package:diplom_medix/screens/home/cubit/room_cubit.dart';
import 'package:diplom_medix/screens/home/doctors_list.dart';
import 'package:dropdown_search/dropdown_search.dart';
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
          Container(
            height: 50,
            decoration: BoxDecoration(
              color: AppColors.containerWhite,
              borderRadius: BorderRadius.circular(30),
            ),
            child: BlocBuilder<RoomCubit, RoomState>(
              builder: (context, state) {
                return DropdownSearch(
                  dropdownBuilder: (context, selectedItem) => Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      color: AppColors.containerWhite,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      selectedItem.toString(),
                    ),
                  ),
                  dropdownDecoratorProps: const DropDownDecoratorProps(
                    dropdownSearchDecoration:
                        InputDecoration(border: InputBorder.none),
                  ),
                  selectedItem: state.room,
                  onChanged: (value) {
                    context.read<RoomCubit>().select(value);
                  },
                  popupProps: PopupProps.menu(
                    containerBuilder: (context, popupWidget) => Container(
                      decoration: BoxDecoration(
                        color: AppColors.containerWhite,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: popupWidget,
                    ),
                  ),
                  items: roomNames,
                );
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const HomeDoctorList(),
          const SizedBox(
            height: 15,
          ),
          const HomeBottomAppBar(),
        ],
      ),
    );
  }
}
