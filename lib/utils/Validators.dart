import 'package:email_validator/email_validator.dart';
import 'package:cpf_cnpj_validator/cpf_validator.dart';

fieldRequired(String value){
  if(value.isEmpty){
    return "Campo obrigatorio";
  }
  return null;
}

validateConfirmPassword(String value,String comparisonValue){
  if(value == comparisonValue){
    return null;
  }
  if(value.isEmpty){
    return "Campo obrigatorio";
  }
  return "Os campos Senha e Confirmar Senha precisam ser iguais";
}

emailValidator(String value){
 return EmailValidator.validate(value) ? null : "Email inválido";
}
cpfValidator(String value){
  return CPFValidator.isValid(value) ? null : "CPF inválido";
}