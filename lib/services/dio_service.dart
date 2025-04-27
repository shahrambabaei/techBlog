
import 'package:dio/dio.dart';

class DioService {
  final dio = Dio();
  late Response response;
  Future<dynamic> getData(String url) async {
    response = await dio.get(url,
        options: Options(
            responseType: ResponseType.json,
            method: "GET",
            headers: {"content-Type": "application/json"}));
    return response;
  }
}
