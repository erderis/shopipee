import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:portfolio/core/usecases/usecase.dart';
import 'package:portfolio/features/overview/domain/entities/traffic.dart';
import 'package:portfolio/features/overview/domain/usecases/get_traffic.dart';

import '../../../../utils/helpers/map_failure_to_message.dart';

part 'traffic_event.dart';
part 'traffic_state.dart';

class TrafficBloc extends Bloc<TrafficEvent, TrafficState> {
  final GetTraffic getTraffic;

  TrafficState get initialState => TrafficEmpty();

  TrafficBloc({required this.getTraffic}) : super(TrafficEmpty()) {
    on<TrafficEvent>((event, emit) async {
      emit(TrafficLoading());
      final failureOrTraffic = await getTraffic(NoParams());
      failureOrTraffic.fold(
          (failure) =>
              emit(TrafficError(message: mapFailureToMessage(failure))),
          (traffic) => emit(TrafficLoaded(traffic: traffic)));
    });
  }
}
