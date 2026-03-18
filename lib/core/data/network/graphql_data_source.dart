import 'package:flutter_training/core/data/network/graphql_client.dart';
import 'package:flutter_training/core/data/network/remote.dart';

class GraphQLDataSource extends IRemoteDataSource<GraphQLService> {
  GraphQLDataSource(super.source);
}