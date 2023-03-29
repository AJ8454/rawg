import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rawg/src/app/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:rawg/src/app/features/home/presentation/genres_bloc/genres_bloc.dart';
import 'package:rawg/src/app/features/splash/presentation/bloc/splash_bloc.dart';
import 'package:rawg/src/app/features/theme/presentation/bloc/theme_bloc.dart';
import 'package:rawg/src/injection_container.dart' as di;

class AppConfigProvider {
  static get blocProviders {
    return [
      BlocProvider(
          create: (context) => di.sl<ThemeBloc>()..add(InitialThemeSetEvent())),
      BlocProvider(create: (context) => di.sl<SplashBloc>()),
      BlocProvider(create: (context) => di.sl<AuthenticationBloc>()),
      BlocProvider(create: (context) => di.sl<GenresBloc>()),
    ];
  }
}
