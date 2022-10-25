import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:image_api/model/data_model.dart';

class Api {
  final String _endPoint = 'https://picsum.photos/v2/list';
  final Dio _dio = Dio();

  DioCacheManager dioCacheManager = DioCacheManager(CacheConfig());
  Options myOptions =
      buildCacheOptions(const Duration(days: 20), forceRefresh: true);

  late final Response _response;
  Future<List<DataModel>> getData() async {
    DioCacheManager dioCacheManager = DioCacheManager(CacheConfig());
    Options myOptions =
        buildCacheOptions(const Duration(days: 20), forceRefresh: true);
    _dio.interceptors.add(dioCacheManager.interceptor);
    _response = await _dio.get(_endPoint, options: myOptions);
    final List result = _response.data;
    return result.map((e) => DataModel.fromJson(e)).toList();
  }
}
