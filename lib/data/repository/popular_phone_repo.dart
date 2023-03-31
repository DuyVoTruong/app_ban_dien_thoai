import 'package:app_ban_dien_thoai/data/api/api_client.dart';
import 'package:get/get.dart';

class PopularProductRepo extends GetxService {
  final ApiClient apiClient;

  PopularProductRepo({required this.apiClient});

  Future<Response> getPopularPhoneList() async {
    return await apiClient.getData("end point url");
  }
}