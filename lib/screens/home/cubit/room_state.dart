// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'room_cubit.dart';

class RoomState extends Equatable {
  final String room;
  const RoomState(
    this.room,
  );

  @override
  List<Object> get props => [room];
}
