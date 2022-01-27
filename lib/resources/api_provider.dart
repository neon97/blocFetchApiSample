import 'package:dio/dio.dart';
import 'package:ftips_bloc_fetch_api/models/MountainerModel/mountainers_model.dart';

class ApiProvider {
  final Dio _dio = Dio();
  final String _url = 'https://servercheckup.herokuapp.com/blogs';

  Future<MountainersModel> fetchMountainersList() async {
    try {
      Response response = await _dio.get(_url);
      return MountainersModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return MountainersModel.withError("Data not found / Connection issue");
    }
  }
}
