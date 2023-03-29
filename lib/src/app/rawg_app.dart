import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rawg/src/app/features/error/error_page.dart';
import 'package:rawg/src/app/features/theme/presentation/bloc/theme_bloc.dart';
import 'package:rawg/src/core/routes/app_routers.dart';
import 'package:rawg/src/core/utils/app_strings.dart';
import 'package:rawg/src/core/utils/app_themes.dart';

import 'app_config_providers.dart';

class RawgApp extends StatelessWidget {
  const RawgApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppConfigProvider.blocProviders,
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          SystemChrome.setPreferredOrientations(
              [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: AppStrings.appName,
            theme: (state is LightThemeState)
                ? AppTheme.lightTheme
                : AppTheme.darkTheme,
            initialRoute: "/",
            onGenerateRoute: AppRoute.router,
            builder: (context, child) {
              ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
                return CustomError(errorDetails: errorDetails);
              };
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: child!,
              );
            },
          );
        },
      ),
    );
  }
}
