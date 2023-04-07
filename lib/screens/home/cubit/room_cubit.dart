// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:diplom_medix/helper/constant.dart';
import 'package:equatable/equatable.dart';

part 'room_state.dart';

class RoomCubit extends Cubit<RoomState> {
  RoomCubit()
      : super(
          RoomState(
            roomNames[0],
          ),
        );
  select(String room) {
    emit(
      RoomState(
        room,
      ),
    );
  }
}
