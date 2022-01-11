import 'package:flutter/foundation.dart';

class Account {
  final String id;
  final String account;
  final String agency;
  final num clientId;
  final FinancialInstitution financialInstitution;
  final DateTime createAt;
  final DateTime updateAt;

  const Account(
      {required this.id,
      required this.account,
      required this.clientId,
      required this.agency,
      required this.financialInstitution,
      required this.updateAt,
      required this.createAt});

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      account: json['account'],
      agency: json['agency'],
      clientId: json['clientId'],
      createAt: json['createAt'],
      financialInstitution: json['financialInstitution'],
      id: json['id'],
      updateAt: json['updateAt'],
    );
  }
}

class FinancialInstitution {
  final String id;
  final String? name;
  final String code;
  final String? description;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const FinancialInstitution(
      {required this.id,
      required this.code,
      this.updatedAt,
      this.createdAt,
      this.description,
      this.name});

  factory FinancialInstitution.fromJson(Map<String, dynamic> json) {
    return FinancialInstitution(
        name: json['name'],
        code: json['code'],
        id: json['id'],
        createdAt: json['createdAt'],
        description: json['description'],
        updatedAt: json['updatedAt']);
  }
}

  
//   [
//   {
//     "id": 0,
//     "account": "string",
//     "agency": "string",
//     "clientId": 0,
//     "financialInstituition": {
//       "id": 0,
//       "name": "string",
//       "code": "string",
//       "description": "string",
//       "createdAt": "2022-01-11T14:32:48.500Z",
//       "updatedAt": "2022-01-11T14:32:48.500Z"
//     },
//     "createdAt": "2022-01-11T14:32:48.500Z",
//     "updatedAt": "2022-01-11T14:32:48.500Z"
//   }
// ]