class WalletsModel {
  List<Wallet>? wallet;

  WalletsModel({this.wallet});

  WalletsModel.fromJson(Map<String, dynamic> json) {
    if (json['ObjectList'] != null) {
      wallet = <Wallet>[];
      json['ObjectList'].forEach((v) {
        wallet!.add(Wallet.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (wallet != null) {
      data['ObjectList'] = wallet!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Wallet {
  int? id;
  int? drugstoreId;
  int? userId;
  String? cpf;
  int? walletTypeId;
  double? amount;

  Wallet(
      {this.id,
      this.drugstoreId,
      this.userId,
      this.cpf,
      this.walletTypeId,
      this.amount});

  Wallet.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    drugstoreId = json['drugstoreId'];
    userId = json['userId'];
    cpf = json['cpf'];
    walletTypeId = json['walletTypeId'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['drugstoreId'] = drugstoreId;
    data['userId'] = userId;
    data['cpf'] = cpf;
    data['walletTypeId'] = walletTypeId;
    data['amount'] = amount;
    return data;
  }
}
