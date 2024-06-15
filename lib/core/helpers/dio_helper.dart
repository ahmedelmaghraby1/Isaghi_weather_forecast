import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:isaghi/core/constants/end_points.dart';

abstract class BaseDioHelper {
  Future<dynamic> post({
    String? base,
    required String endPoint,
    dynamic data,
    dynamic query,
    String? token,
    ProgressCallback? progressCallback,
    CancelToken? cancelToken,
    int? timeOut,
    bool isMultipart = false,
  });

  Future<dynamic> patch({
    String? base,
    required String endPoint,
    dynamic data,
    dynamic query,
    String? token,
    ProgressCallback? progressCallback,
    CancelToken? cancelToken,
    int? timeOut,
    bool isMultipart = false,
  });

  Future<dynamic> put({
    String? base,
    required String endPoint,
    dynamic data,
    dynamic query,
    String? token,
    ProgressCallback? progressCallback,
    CancelToken? cancelToken,
    int? timeOut,
    bool isMultipart = false,
  });

  Future<dynamic> get({
    String? base,
    required String endPoint,
    dynamic data,
    dynamic query,
    String? token,
    CancelToken? cancelToken,
    int? timeOut,
    bool isMultipart = false,
  });

  Future<dynamic> delete({
    String? base,
    required String endPoint,
    dynamic data,
    dynamic query,
    String? token,
    CancelToken? cancelToken,
    int? timeOut,
    bool isMultipart = false,
  });
}

class DioHelper extends BaseDioHelper {
  Dio _dio() {
    final Dio dio = Dio(
      BaseOptions(
        baseUrl: EndPoints.baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 50),
        receiveTimeout: const Duration(seconds: 50),
      ),
    );

    dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        error: true,
        requestHeader: true,
        responseHeader: false,
        request: true,
        responseBody: true,
        logPrint: (object) => log(object.toString()),
      ),
    );

    return dio;
  }

  @override
  Future<dynamic> get({
    String? base,
    required String endPoint,
    dynamic data,
    dynamic query,
    String? token,
    CancelToken? cancelToken,
    int? timeOut,
    bool isMultipart = false,
  }) async {
    return await _dio().get(
      base == null ? endPoint : base + endPoint,
      queryParameters: query,
      cancelToken: cancelToken,
      options: Options(
        headers: {
          if (isMultipart) 'Content-Type': 'multipart/form-data',
          if (!isMultipart) 'Content-Type': 'application/json',
          if (!isMultipart) 'Accept': 'application/json',
          if (token != null) 'authorization': 'Bearer $token',
          // 'Accept-Language':
          //     getIt<SharedPreferences>().getString("locale") == null
          //         ? "ar"
          //         : Locale(getIt<SharedPreferences>().getString("locale")!),
        },
      ),
    );
  }

  @override
  Future<dynamic> post({
    String? base,
    required String endPoint,
    dynamic data,
    dynamic query,
    String? token,
    ProgressCallback? progressCallback,
    CancelToken? cancelToken,
    int? timeOut,
    bool isMultipart = false,
  }) async {
    return await _dio().post(
      base == null ? endPoint : base + endPoint,
      data: data,
      queryParameters: query,
      onSendProgress: progressCallback,
      cancelToken: cancelToken,
      options: Options(
        headers: {
          if (isMultipart) 'Content-Type': 'multipart/form-data',
          if (!isMultipart) 'Content-Type': 'application/json',
          if (!isMultipart) 'Accept': 'application/json',
          if (!isMultipart) 'X-Requested-With': 'XMLHttpRequest',
          if (token != null) 'authorization': 'Bearer $token',
          // 'Accept-Language':
          //     getIt<SharedPreferences>().getString("locale") == null
          //         ? "ar"
          //         : Locale(getIt<SharedPreferences>().getString("locale")!),
        },
      ),
    );
  }

  @override
  Future patch({
    String? base,
    required String endPoint,
    data,
    query,
    String? token,
    ProgressCallback? progressCallback,
    CancelToken? cancelToken,
    int? timeOut,
    bool isMultipart = false,
  }) async {
    return await _dio().patch(
      base == null ? endPoint : base + endPoint,
      data: data,
      queryParameters: query,
      onSendProgress: progressCallback,
      cancelToken: cancelToken,
      options: Options(
        headers: {
          if (isMultipart) 'Content-Type': 'multipart/form-data',
          if (!isMultipart) 'Content-Type': 'application/json',
          if (!isMultipart) 'Accept': 'application/json',
          if (token != null) 'authorization': 'Bearer $token',
          // 'Accept-Language':
          //     getIt<SharedPreferences>().getString("locale") == null
          //         ? "ar"
          //         : Locale(getIt<SharedPreferences>().getString("locale")!),
        },
      ),
    );
  }

  @override
  Future delete({
    String? base,
    required String endPoint,
    data,
    query,
    String? token,
    CancelToken? cancelToken,
    int? timeOut,
    bool isMultipart = false,
  }) async {
    return await _dio().delete(
      base == null ? endPoint : base + endPoint,
      data: data,
      queryParameters: query,
      cancelToken: cancelToken,
      options: Options(
        headers: {
          if (isMultipart) 'Content-Type': 'multipart/form-data',
          if (!isMultipart) 'Content-Type': 'application/json',
          if (!isMultipart) 'Accept': 'application/json',
          if (token != null) 'authorization': 'Bearer $token',
          // 'Accept-Language':
          //     getIt<SharedPreferences>().getString("locale") == null
          //         ? "ar"
          //         : Locale(getIt<SharedPreferences>().getString("locale")!),
        },
      ),
    );
  }

  @override
  Future put(
      {String? base,
      required String endPoint,
      data,
      query,
      String? token,
      ProgressCallback? progressCallback,
      CancelToken? cancelToken,
      int? timeOut,
      bool isMultipart = false}) async {
    return await _dio().put(
      base == null ? endPoint : base + endPoint,
      data: data,
      queryParameters: query,
      onSendProgress: progressCallback,
      cancelToken: cancelToken,
      options: Options(
        headers: {
          if (isMultipart) 'Content-Type': 'multipart/form-data',
          if (!isMultipart) 'Content-Type': 'application/json',
          if (!isMultipart) 'Accept': 'application/json',
          if (token != null) 'authorization': 'Bearer $token',
          // 'Accept-Language':
          //     getIt<SharedPreferences>().getString("locale") == null
          //         ? "ar"
          //         : Locale(getIt<SharedPreferences>().getString("locale")!),
        },
      ),
    );
  }
}
