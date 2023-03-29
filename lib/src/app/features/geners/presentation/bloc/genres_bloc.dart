import 'package:rawg/src/app/features/geners/data/models/genres_model.dart';
import 'package:rawg/src/app/features/geners/domain/usecases/genres_usercase.dart';
import 'package:rawg/src/core/errors/failures.dart';
import 'package:rawg/src/core/utils/app_strings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'genres_event.dart';
part 'genres_state.dart';

class GenresBloc extends Bloc<GenresEvent, GenresState> {
  final GenresUseCase genresUseCase;
  GenresBloc({required this.genresUseCase}) : super(GenresInitial()) {
    on<GetGameCategoriesEvent>(
        (event, emit) => _onGetGameCategoriesEvent(event, emit));
  }

  void _onGetGameCategoriesEvent(
      GetGameCategoriesEvent event, Emitter<GenresState> emit) async {
    emit(GenresLoadingState());
    final successOrFail = await genresUseCase.callGetGenres();
    emit(successOrFail.fold(
      (l) => GenresFailureState(_mapFailureToMessage(l)),
      (r) => GenresLoadedState(genresModel: r),
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
