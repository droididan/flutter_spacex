import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

QueryOptions setOption(
    {@required String document, FetchPolicy policy = FetchPolicy.cacheAndNetwork, Map<String, dynamic> variables}) {
  return QueryOptions(errorPolicy: ErrorPolicy.all, document: document, fetchPolicy: policy, variables: variables);
}
