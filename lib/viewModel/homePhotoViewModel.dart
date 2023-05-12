import 'package:flutter/foundation.dart';
import 'package:mvvm_practises/datas/response/apiResponse.dart';
import 'package:mvvm_practises/model/photoModel.dart';
import 'package:mvvm_practises/repository/photoRepository.dart';

class HomePhotViewModel with ChangeNotifier {
  final _myRepo = PhotoRepository();
  ApiResponse<PhotoModel> photoList = ApiResponse.loading();
  setPhotoList(ApiResponse<PhotoModel> response) {
    photoList = response;
    notifyListeners();
  }

  Future<void> fetchPhotoList() async {
    setPhotoList(ApiResponse.loading());
    _myRepo.fetchPhoto().then((value) {
      setPhotoList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setPhotoList(ApiResponse.error(error.toString()));
    });
  }
}
