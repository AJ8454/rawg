import 'package:rawg/src/app/features/global/snackbar_message.dart';
import 'package:rawg/src/app/features/home/presentation/bloc/home_bloc.dart';
import 'package:rawg/src/app/features/splash/presentation/pages/splash_page.dart';

import 'package:rawg/src/core/routes/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const route = '/HomePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    BlocProvider.of<HomeBloc>(context).add(GetLoggedUserDataEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is HomeLoadedState) {
          return Column(
            children: const [],
          );
        }
        return const SizedBox();
      },
      listener: (context, state) {
        if (state is HomeFailureState) {
          SnackBarMessage()
              .showErrorSnackBar(message: state.error, context: context);
        }
        if (state is UserLoggetOutState) {
          AppNavigator.pushReplace(context, SplashPage.route);
        }
      },
    ));
  }
}
