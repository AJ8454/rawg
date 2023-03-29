import 'package:rawg/src/app/features/authentication/data/models/user_model.dart';
import 'package:rawg/src/app/features/home/domain/usecases/home_usecase.dart';
import 'package:rawg/src/core/errors/failures.dart';
import 'package:rawg/src/core/utils/app_strings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeUseCase homeUseCase;
  HomeBloc({required this.homeUseCase}) : super(HomeInitial()) {
    on<GetLoggedUserDataEvent>(
        (event, emit) => _onGetUserLoggedEvent(event, emit));

    on<UserLogoutEvent>((event, emit) => _onUserLogoutEvent(event, emit));
  }

  void _onUserLogoutEvent(
    UserLogoutEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoadingState());
    final successOrFail = await homeUseCase.callLogOut();
    emit(successOrFail.fold(
      (l) => HomeFailureState(_mapFailureToMessage(l)),
      (r) => UserLoggetOutState(),
    ));
  }

  void _onGetUserLoggedEvent(
    GetLoggedUserDataEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoadingState());
    final successOrFail = await homeUseCase.callGetUser();
    emit(successOrFail.fold(
      (l) => HomeFailureState(_mapFailureToMessage(l)),
      (r) => HomeLoadedState(userModel: r),
    ));
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return AppStrings.serverFailureMessage;
      case EmptyCacheFailure:
        return AppStrings.emptyCacheFailureMessage;
      case OfflineFailure:
        return AppStrings.offlineFailureMessage;
      default:
        return "Unexpected Error. Please try again later.";
    }
  }
}
