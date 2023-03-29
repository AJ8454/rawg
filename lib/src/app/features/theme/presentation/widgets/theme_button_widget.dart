import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rawg/src/app/features/theme/presentation/bloc/theme_bloc.dart';
import 'package:rawg/src/core/utils/app_colors.dart';

class TheemButtonWidget extends StatelessWidget {
  const TheemButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return Center(
          child: IconButton(
            onPressed: () async {
              BlocProvider.of<ThemeBloc>(context).add(ThemeSwitchEvent());
            },
            icon: Icon(
                (state is DarkThemeState) ? Icons.light_mode : Icons.dark_mode),
            color: AppColor.white,
          ),
        );
      },
    );
  }
}
