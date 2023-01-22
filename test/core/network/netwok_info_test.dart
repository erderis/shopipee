import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import "package:mockito/annotations.dart";
import 'package:mockito/mockito.dart';
import 'package:portfolio/core/network/network_info.dart';

import 'netwok_info_test.mocks.dart';

@GenerateMocks([InternetConnectionCheckerPlus])
void main() {
  late NetworkInfoImpl networkInfo;
  late MockInternetConnectionCheckerPlus mockDataConnectionChecker;

  setUp(() {
    mockDataConnectionChecker = MockInternetConnectionCheckerPlus();
    networkInfo = NetworkInfoImpl(mockDataConnectionChecker);
  });

  group('isConnected', () {
    test('Should forward the call to DataConnectionChecker.hasConnection',
        () async {
      final tHasConnectionFuture = Future.value(true);
      when(mockDataConnectionChecker.hasConnection)
          .thenAnswer((_) => tHasConnectionFuture);
      final result = networkInfo.isConnected;
      verify(mockDataConnectionChecker.hasConnection);
      expect(result, tHasConnectionFuture);
    });
  });
}
