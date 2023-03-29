import 'package:flutter/material.dart';
import 'package:rawg/src/app/rawg_app.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rawg/src/core/evn.dart';
import 'package:rawg/src/core/helpers/app_bloc_observer.dart';
import 'package:rawg/src/injection_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  await AppEnvironment.setupEnv(Environment.production);
  await di.init();
  runApp(const RawgApp());
}
