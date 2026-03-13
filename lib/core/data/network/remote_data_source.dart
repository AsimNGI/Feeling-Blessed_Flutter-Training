
import 'package:flutter_training/core/data/network/dio_client.dart';
import 'package:flutter_training/core/data/network/remote.dart';

class RemoteDataSource extends IRemoteDataSource<DioClient> {
  RemoteDataSource(super.source);
}
