import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:portfolio/core/error/failures.dart';
import 'package:portfolio/core/usecases/usecase.dart';
import 'package:portfolio/features/overview/domain/entities/traffic.dart';
import 'package:portfolio/features/overview/domain/usecases/get_traffic.dart';

part 'traffic_event.dart';
part 'traffic_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';

class TrafficBloc extends Bloc<TrafficEvent, TrafficState> {
  final GetTraffic getTraffic;

  TrafficState get initialState => TrafficEmpty();

  TrafficBloc({required this.getTraffic}) : super(TrafficEmpty()) {
    on<TrafficEvent>((event, emit) async {
      emit(TrafficLoading());
      print('bloc called');
      final failureOrTraffic = await getTraffic(NoParams());
      failureOrTraffic.fold(
          (failure) =>
              emit(TrafficError(message: _mapFailureToMessage(failure))),
          (traffic) => emit(TrafficLoaded(traffic: traffic)));
    });
  }
}

String _mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return SERVER_FAILURE_MESSAGE;
    case CacheFailure:
      return CACHE_FAILURE_MESSAGE;
    default:
      return 'Unexpected Error';
  }
}
