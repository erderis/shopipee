import 'package:equatable/equatable.dart';

class Traffic extends Equatable {
  final int percent;
  final int total;

  Traffic({required this.percent, required this.total});

  @override
  List<Object?> get props => [percent, total];
}

// class Facebook {
//   final int percent;
//   final int total;

//   Facebook({required this.percent, required this.total});
// }

// class Instagram {
//   final int percent;
//   final int total;

//   Instagram({required this.percent, required this.total});
// }

// class DirectSearch {
//   final int percent;
//   final int total;

//   DirectSearch({required this.percent, required this.total});
// }
