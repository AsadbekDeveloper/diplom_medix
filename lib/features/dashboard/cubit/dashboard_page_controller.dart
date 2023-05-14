import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardPageController extends Cubit<int> {
  DashboardPageController() : super(0);
  change(int page) {
    emit(page);
  }
}
