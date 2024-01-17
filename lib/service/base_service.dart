import 'package:get/get.dart';
import 'package:getx_demo/utils/app_constants.dart';
import 'package:getx_demo/utils/preference_utils.dart';

class BaseService extends GetConnect implements GetxService {
  final _connect = GetConnect();

  Future<Response<T>> customPost<T>(String url, body, {String? contentType}) {
    return _connect.post(url, body,
        headers: {
          'Authorization':
              'Bearer ${PreferenceUtils.getString(AppConstants.ACCESS_TOKEN)}'
        },
        contentType: contentType);
  }

  Future<Response<T>> customGet<T>(String url, {Map<String, String?>? query}) {
    return _connect.get(url, query: query, 
    // headers: {
    //   'Authorization':
    //       'Bearer ${PreferenceUtils.getString(AppConstants.ACCESS_TOKEN)}'
    // }
    );
  }
}
