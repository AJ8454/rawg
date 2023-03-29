import 'package:rawg/src/app/features/home/presentation/genres_bloc/genres_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rawg/src/app/features/home/presentation/widgets/home_genres_widget.dart';
import 'package:rawg/src/core/responsive/app_responsive.dart';
import 'package:rawg/src/core/utils/app_colors.dart';
import 'package:rawg/src/core/utils/app_strings.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const route = '/HomePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    BlocProvider.of<GenresBloc>(context).add(GetGameCategoriesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.search,
            size: AppResponsive.kmaxExtraLargeFont(context) + 8,
          ),
        ),
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
        centerTitle: true,
        actions: const [
          CircleAvatar(
            backgroundColor: AppColor.redDark,
            child: Icon(Icons.person),
          ),
        ],
      ),
      body: ListView(
        children: [
          const HomeGenresWidget(),
          Container(
            height: 100,
          )
        ],
      ),
    );
  }
}
