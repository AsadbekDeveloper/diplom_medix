import 'package:diplom_medix/constants/colors.dart';
import 'package:diplom_medix/constants/margin.dart';
import 'package:diplom_medix/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:diplom_medix/features/dashboard/constants/menu_names_list.dart';
import 'package:diplom_medix/features/dashboard/cubit/dashboard_page_controller.dart';

class DashboardSidebar extends StatelessWidget {
  const DashboardSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardPageController, int>(
      builder: (context, state) {
        return ListView.builder(
          itemBuilder: (context, index) => DashboardMenuContainer(
            index: index,
            isSelected: index == state,
          ),
          itemCount: menuNamesList.length,
        );
      },
    );
  }
}

class DashboardMenuContainer extends StatelessWidget {
  final int index;
  final bool isSelected;
  const DashboardMenuContainer({
    Key? key,
    required this.index,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<DashboardPageController>().change(index);
      },
      child: AnimatedSize(
        duration: const Duration(
          milliseconds: 400,
        ),
        child: Container(
          height: isSelected ? 60 : 40,
          decoration: BoxDecoration(
            color: isSelected ? Colors.blue[900] : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: marginH,
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              Image.asset(
                'assets/icon/dashboard/${menuIconsList[index]}.png',
                width: 20,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                menuNamesList[index],
                style: isSelected
                    ? h20.copyWith(
                        color: AppColor.white,
                      )
                    : h20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
