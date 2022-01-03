import 'package:email_validator/email_validator.dart';

class Bank {
  String name = "";
  String account = "";
  String agency = "";
  String code = "";
  String type = "";

  Bank(this.name, this.account, this.agency, this.code, this.type);
  Bank.fromMap(Map map) {
    name = map[name];
    account = map[account];
    agency = map[agency];
    code = map[code];
    type = map[type];
  }
}
