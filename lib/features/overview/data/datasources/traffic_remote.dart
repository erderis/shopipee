import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:portfolio/core/error/exception.dart';
import 'package:portfolio/features/overview/data/models/traffic_model.dart';

abstract class TrafficRemote {
  Future<TrafficModel> getTraffic();
}

class TrafficRemoteImpl implements TrafficRemote {
  final FirebaseFirestore db;

  TrafficRemoteImpl({required this.db});
  @override
  Future<TrafficModel> getTraffic() async {
    try {
      late Map<String, dynamic> data;
      await db.collection("traffic").get().then((value) {
        data = value.docs[0].data();
      }).onError((error, stackTrace) {
        throw ServerException();
      });
      return TrafficModel.fromJson(data);
    } catch (e) {
      throw ServerException();
    }
  }
}
