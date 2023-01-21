part of 'traffic_bloc.dart';

abstract class TrafficState extends Equatable {
  const TrafficState();

  @override
  List<Object> get props => [];
}

class TrafficEmpty extends TrafficState {}

class TrafficLoading extends TrafficState {}

class TrafficLoaded extends TrafficState {
  final Traffic traffic;

  TrafficLoaded({required this.traffic});
}

class TrafficError extends TrafficState {
  final String message;

  TrafficError({required this.message});
}
