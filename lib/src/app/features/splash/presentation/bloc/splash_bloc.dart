import 'package:rawg/src/app/features/splash/domain/usecases/splash_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final SplashUsecase splashUsecase;

  SplashBloc({required this.splashUsecase}) : super(SplashInitial()) {
    on<SplashEvent>((event, emit) async {
      if (event is GetUserLoggedEvent) {
        final isLogData = await splashUsecase.call();
        if (isLogData) {
          await splashUsecase.callGetUserCache();
        }
        emit(LoadedSplashState(isLog: isLogData));
      }

      if (event is SetUserLoggedEvent) {
        await splashUsecase.setUserLog(event.isLog);
      }
    });
  }
}
