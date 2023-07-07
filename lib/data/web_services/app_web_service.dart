
import 'package:dio/dio.dart';

import '../../utiles/constants.dart';

class AppWebServices {
  late Dio dio;

  AppWebServices() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: Constants.baseURL,
      receiveDataWhenStatusError: true,
      connectTimeout: 20 * 1000, // 60 seconds,
      receiveTimeout: 20 * 1000,
    );
    dio=Dio(baseOptions);
  }

  Future<Map<String,dynamic>> getPopularProducts() async {
    try {
      Response response = await dio.get(Constants.popularEndPoint);
      return response.data;
    } catch (e) {
      return {};
    }
  }


}
