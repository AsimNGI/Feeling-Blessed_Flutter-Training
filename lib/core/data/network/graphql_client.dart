import 'package:graphql/client.dart';

class GraphQLService {
  late GraphQLClient client;
  String baseUrl = "https://nawadev.myshopify.com/api/2026-01/graphql.json";
  String storeFrontAccessToken = "790b5db252a89a6e3c2581f3016f76da";

  GraphQLService() {
    HttpLink link = HttpLink(
      baseUrl,
      defaultHeaders: {'X-Shopify-Storefront-Access-Token': storeFrontAccessToken},
    );

    client = GraphQLClient(
      link: link,
      queryRequestTimeout: Duration(seconds: 15),
      cache: GraphQLCache(),
      defaultPolicies: DefaultPolicies(
        query: Policies(cacheReread: CacheRereadPolicy.ignoreAll, fetch: FetchPolicy.noCache),
      ),
    );
  }

  void recheckBaseUrl({bool isAdmin = false}) {
    HttpLink link = HttpLink(
      baseUrl,
      defaultHeaders: {'X-Shopify-Storefront-Access-Token': storeFrontAccessToken},
    );

    client = GraphQLClient(
      link: link,
      cache: GraphQLCache(),
      queryRequestTimeout: Duration(seconds: 15),
      defaultPolicies: DefaultPolicies(
        query: Policies(cacheReread: CacheRereadPolicy.ignoreAll, fetch: FetchPolicy.noCache),
      ),
    );
  }

  Future<QueryResult> performQuery(String query, {bool isAdmin = false}) async {
    recheckBaseUrl(isAdmin: isAdmin);

    QueryOptions options = QueryOptions(document: gql(query));

    late QueryResult result;
    try {
      result = await client.query(options);
    } on GraphQLError catch (_) {
      rethrow;
    }
    return result;
  }

  Future<QueryResult> performQueryWithParams({
    required String query,
    required Map<String, dynamic> params,
    bool isAdmin = false,
    bool isProductionStoreFront = false,
  }) async {
    recheckBaseUrl(isAdmin: isAdmin);
    QueryOptions options = QueryOptions(document: gql(query), variables: params);

    late QueryResult result;
    try {
      result = await client.query(options);
    } on GraphQLError catch (e) {
      if (e.message == 'No Internet') {
        throw NetworkException(originalException: 'No Internet', uri: Uri());
      }
      rethrow;
    }

    return result;
  }

  Future<QueryResult> performMutation(
      String query, {
        Map<String, dynamic>? variables,
        bool isAdmin = false,
      }) async {
    recheckBaseUrl(isAdmin: isAdmin);
    MutationOptions options = MutationOptions(document: gql(query), variables: variables!);

    final result = await client.mutate(options);

    return result;
  }
}