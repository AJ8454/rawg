import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'trending_event.dart';
part 'trending_state.dart';

class TrendingBloc extends Bloc<TrendingEvent, TrendingState> {
  TrendingBloc() : super(TrendingInitial()) {
    on<TrendingEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
