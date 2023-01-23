import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:portfolio/core/error/exception.dart';
import 'package:portfolio/features/overview/data/models/traffic_model.dart';

abstract class TrafficRemote {
  Future<TrafficModel> getTraffic();
}

const TRAFFIC_COLLECTION_NAME = 'traffic';

class TrafficRemoteImpl implements TrafficRemote {
  final FirebaseFirestore db;

  TrafficRemoteImpl({required this.db});
  @override
  Future<TrafficModel> getTraffic() async {
    try {
      late Map<String, dynamic> data;
      await db.collection(TRAFFIC_COLLECTION_NAME).get().then((value) {
        if (value.docs.isEmpty) {
          throw ServerException();
        } else {
          data = value.docs[0].data();
        }
      });
      return TrafficModel.fromJson(data);
    } catch (_) {
      throw ServerException();
    }
  }
}
