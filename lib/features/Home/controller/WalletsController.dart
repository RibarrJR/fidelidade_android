import 'package:fidelidade_android/features/Home/api/WalletsApi.dart';
import 'package:fidelidade_android/features/Home/models/Wallets.dart';
import 'package:mobx/mobx.dart';

part 'WalletsController.g.dart';

class WalletsController = _WalletsController with _$WalletsController;

abstract class _WalletsController with Store {
  WalletsApi walletApi = WalletsApi();

  @observable
  WalletsModel? walletsModel;

  @action
  getWallets() async {
    try {
      var result = await walletApi.getWallets();
      setWallets(result);
    } catch (e) {
      throw Exception(e);
    }
  }

  @action
  void setWallets(WalletsModel wallets) {
    walletsModel = wallets;
  }

  @action
  Future<void> transferCoinsToMoney(Map<String, dynamic> requestBody) async {
    try {
      await walletApi.transferCoinsToMoney(requestBody);
    } catch (e) {
      throw Exception(e);
    }
  }
}
