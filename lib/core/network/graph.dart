import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

QueryOptions setOption({@required String document, FetchPolicy policy = FetchPolicy.cacheAndNetwork}) {
  return QueryOptions(
    errorPolicy: ErrorPolicy.all,
    document: document,
    fetchPolicy: policy,
  );
}
