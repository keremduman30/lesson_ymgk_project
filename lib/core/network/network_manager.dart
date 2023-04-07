/* import 'package:dio/dio.dart';

class NetworkManager {
  static NetworkManager? _instace;
  static NetworkManager get instance {
    _instace ??= NetworkManager._init();
    return _instace!;
  }

  final baseUrl = "http://192.168.43.238:3000/";
  late Dio dio;
  NetworkManager._init() {
    dio = Dio(BaseOptions(baseUrl: baseUrl));
  }
}
 */