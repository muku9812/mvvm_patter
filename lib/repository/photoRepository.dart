import 'package:mvvm_practises/datas/network/baseApiServices.dart';
import 'package:mvvm_practises/datas/network/networkApiServices.dart';
import 'package:mvvm_practises/model/photoModel.dart';
import 'package:mvvm_practises/resources/appUrl.dart';

class PhotoRepository {
  final BaseApiServices _apiServices = NetworkApiService();

  Future<PhotoModel> fetchPhoto() async {
    try {
      dynamic response = await _apiServices.getGetApiResponse(AppUrl.homeUrl);
      return response = PhotoModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
