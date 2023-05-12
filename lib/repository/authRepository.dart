import '../datas/network/baseApiServices.dart';
import '../datas/network/networkApiServices.dart';
import '../resources/appUrl.dart';

class AuthRepository {
  final BaseApiServices _apiServices = NetworkApiService();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.loginUrl, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
