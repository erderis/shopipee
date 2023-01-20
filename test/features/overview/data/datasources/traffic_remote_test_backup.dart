// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';
// import 'package:portfolio/features/overview/data/datasources/traffic_remote.dart';

// import 'traffic_remote_test.mocks.dart';

// @GenerateNiceMocks([
//   MockSpec<FirebaseFirestore>(),
//   MockSpec<CollectionReference<Map<String, dynamic>>>(),
//   MockSpec<QuerySnapshot<Map<String, dynamic>>>(),
//   MockSpec<QueryDocumentSnapshot<Map<String, dynamic>>>(),
//   MockSpec<DocumentReference<Map<String, dynamic>>>(),
//   MockSpec<DocumentSnapshot<Map<String, dynamic>>>()
// ])
// void main() async {
//   late TrafficRemoteImpl dataSource;
//   late MockFirebaseFirestore mockFirestore;
//   late MockCollectionReference mockCollectionReference;
//   late MockQuerySnapshot mockQuerySnapshot;
//   late MockQueryDocumentSnapshot mockQueryDocumentSnapshot;
//   late MockDocumentReference mockDocumentReference;
//   late MockDocumentSnapshot mockDocumentSnapshot;

//   setUp(() async {
//     mockFirestore = MockFirebaseFirestore();

//     dataSource = TrafficRemoteImpl(db: mockFirestore);

//     //others
//     mockCollectionReference = MockCollectionReference();
//     mockDocumentReference = MockDocumentReference();
//     mockQuerySnapshot = MockQuerySnapshot();
//     mockQueryDocumentSnapshot = MockQueryDocumentSnapshot();
//     mockDocumentSnapshot = MockDocumentSnapshot();
//   });

//   group('getTraffic', () {
//     test('Should perform a GET request data traffic from firebase', () async {
//       final Map<String, dynamic> _responseMap = {
//         'foo': 123,
//         'bar': 'Test title',
//       };
//       when(mockFirestore.collection(any)).thenReturn(mockCollectionReference);
//       when(mockCollectionReference.get())
//           .thenAnswer((_) async => mockQuerySnapshot);
//       when(mockQuerySnapshot.docs).thenReturn([mockQueryDocumentSnapshot]);
//       when(mockDocumentSnapshot.data()).thenReturn(_responseMap);

//       // when(mockFirestore.collection(any)).thenReturn(mockCollectionReference);
//       // when(mockCollectionReference.doc(any)).thenReturn(mockDocumentReference);
//       // when(mockDocumentReference.get())
//       //     .thenAnswer((_) async => mockDocumentSnapshot);
//       // when(mockDocumentSnapshot.data()).thenReturn(_responseMap);
//       // mockFirestore.collection('traffic').add({
//       //   'facebook': {'percent': 4, 'total': 150}
//       // });
//       dataSource.getTraffic();
//       verify(mockFirestore.collection('traffic').get());
//     });
//     test('Should return Traffic when the response code is 200 (success', () {});
//     test('Should return Traffic when the response code is 404 or other', () {});
//   });
// }
