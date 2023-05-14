import 'package:diplom_medix/helper/constant.dart';
import 'package:diplom_medix/features/home/cubit/room_cubit.dart';
import 'package:diplom_medix/features/doctors/doctors_list.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../helper/colors.dart';

class DoctorsListSidebar extends StatelessWidget {
  const DoctorsListSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
      ],
    );
  }
}
