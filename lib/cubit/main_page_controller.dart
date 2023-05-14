import 'package:flutter_bloc/flutter_bloc.dart';

class MainPageController extends Cubit<int> {
  MainPageController() : super(0);
  change(int page) {
    emit(page);
  }
}
