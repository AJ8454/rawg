import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rawg/src/app/features/home/domain/entities/navbar_items.dart';

part 'bottom_nav_state.dart';

class BottomNavCubit extends Cubit<NavigationState> {
  BottomNavCubit() : super(const NavigationState(NavbarItem.home, 1));

  void changeNavBar(NavbarItem navbarItem) {
    switch (navbarItem) {
      case NavbarItem.search:
        emit(state.copyWith(navbarItem: NavbarItem.search, index: 0));
        break;
      case NavbarItem.home:
        emit(state.copyWith(navbarItem: NavbarItem.home, index: 1));
        break;
      case NavbarItem.profile:
        emit(state.copyWith(navbarItem: NavbarItem.profile, index: 2));
        break;
    }
  }
}
