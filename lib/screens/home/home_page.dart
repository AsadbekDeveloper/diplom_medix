import 'package:diplom_medix/helper/constant.dart';
import 'package:diplom_medix/screens/home/cubit/room_cubit.dart';
import 'package:diplom_medix/screens/home/cubit/selected_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_main.dart';
import 'home_sidebar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => SelectedCubit(),
          ),
          BlocProvider(
            create: (context) => RoomCubit(),
          ),
        ],
        child: Stack(
          children: [
            const HomeMain(),
            Positioned(
              top: 0,
              left: 0,
              child: SizedBox(
                width: sidebarWidth,
                height: size.height,
                child: const HomeSidebar(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
