import 'package:fidelidade_android/appEnv.dart';
import 'package:fidelidade_android/core/infrastructure/http_client.dart';
import 'package:fidelidade_android/features/Home/models/Wallets.dart';
import 'package:http/http.dart';

class WalletsApi {
  getWallets() async {
    try {
      final map = await HttpClient.getListAsync(
        '$apiBaseUrl/Wallet/GetByUserId/1',
        headers: {},
      );
      var result = WalletsModel.fromJson(map);
      return result;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response>transferCoinsToMoney(Map<String, dynamic> requestBody) async {
    try {
      final result = await HttpClient.postAsync(
        '$apiBaseUrl/Wallet/Transfer',
        headers: {},
        requestBody: requestBody,
      );
      return result;
    } catch (e) {
      throw Exception(e);
    }
  }
}
