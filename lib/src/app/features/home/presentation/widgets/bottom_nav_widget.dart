import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';
import 'package:rawg/src/app/features/home/domain/entities/navbar_items.dart';
import 'package:rawg/src/app/features/home/presentation/cubit/bottom_nav_cubit.dart';
import 'package:rawg/src/app/features/home/presentation/pages/home_page.dart';
import 'package:rawg/src/core/responsive/app_responsive.dart';
import 'package:rawg/src/core/utils/app_colors.dart';
import 'package:rawg/src/core/utils/app_strings.dart';

class BottomNavWidget extends StatelessWidget {
  const BottomNavWidget({super.key});
  static const route = '/BottomNavWidget';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit, NavigationState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text(
              AppStrings.appName,
              style: AppResponsive.responsiveTextStyle(
                context,
                fsize: AppResponsive.kmaxExtraLargeFont(context) + 8,
                fweight: FontWeight.bold,
                tColor: AppColor.redDark,
                letterSpacing: 2,
                fontFamily: AppStrings.rexotickFont,
              ),
            ),
            actions: const [
              CircleAvatar(
                backgroundColor: AppColor.redDark,
                child: Icon(Icons.person),
              ),
            ],
          ),
          bottomNavigationBar: MotionTabBar(
            tabBarColor: AppColor.dark,
            labels: const ["Search", "Home", "Profile"],
            initialSelectedTab: "Home",
            tabIconColor: AppColor.redDark,
            tabSelectedColor: AppColor.black,
            onTabItemSelected: (int index) {
              if (index == 0) {
                BlocProvider.of<BottomNavCubit>(context)
                    .changeNavBar(NavbarItem.search);
              } else if (index == 1) {
                BlocProvider.of<BottomNavCubit>(context)
                    .changeNavBar(NavbarItem.home);
              } else if (index == 2) {
                BlocProvider.of<BottomNavCubit>(context)
                    .changeNavBar(NavbarItem.profile);
              }
            },
            icons: const [Icons.search, Icons.home, Icons.person],
            textStyle: const TextStyle(color: Colors.red),
          ),
          body: IndexedStack(
            index: state.index,
            children: const <Widget>[
              Center(
                child: Text("Search"),
              ),
              HomePage(),
              Center(
                child: Text("Profile"),
              ),
            ],
          ),
        );
      },
    );
  }
}
