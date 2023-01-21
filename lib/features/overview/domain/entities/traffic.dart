import 'package:equatable/equatable.dart';

class Traffic extends Equatable {
  final int facebook;
  final int instagram;
  final int direct;

  Traffic(
      {required this.facebook, required this.instagram, required this.direct});

  @override
  List<Object?> get props => [facebook, instagram, direct];
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
