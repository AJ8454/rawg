part of 'genres_bloc.dart';

abstract class GenresState extends Equatable {
  const GenresState();

  @override
  List<Object> get props => [];
}

class GenresInitial extends GenresState {}

class GenresLoadingState extends GenresState {}

class GenresLoadedState extends GenresState {
  final GenresModel genresModel;
  const GenresLoadedState({required this.genresModel});
  @override
  List<Object> get props => [genresModel];
}

class GenresFailureState extends GenresState {
  final String error;
  const GenresFailureState(this.error);
  @override
  List<Object> get props => [error];
}
