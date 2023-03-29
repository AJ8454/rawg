part of 'bottom_nav_cubit.dart';

class NavigationState extends Equatable {
  final NavbarItem navbarItem;
  final int index;

  const NavigationState(this.navbarItem, this.index);

  NavigationState copyWith({
    NavbarItem? navbarItem,
    int? index,
  }) {
    return NavigationState(
      navbarItem ?? this.navbarItem,
      index ?? this.index,
    );
  }

  @override
  List<Object> get props => [navbarItem, index];
}
