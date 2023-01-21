part of 'traffic_bloc.dart';

abstract class TrafficEvent extends Equatable {
  const TrafficEvent();

  @override
  List<Object> get props => [];
}

class GetTrafficEvent extends TrafficEvent {}
