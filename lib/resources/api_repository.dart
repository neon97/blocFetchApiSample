import 'package:ftips_bloc_fetch_api/models/MountainerModel/mountainers_model.dart';

import 'api_provider.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future<MountainersModel> fetchMountainersList() {
    return _provider.fetchMountainersList();
  }
}

class NetworkError extends Error {}
