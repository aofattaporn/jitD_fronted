import 'package:flutter/cupertino.dart';

@immutable
abstract class AuthenStatus {
  late int errorCode;
  late String statusName;
  late String statusDesc;
}

class ErrorAuthen{
  late EmailExist errorAuthenEmailExist;
  late ErrorAuthenPasswordIncorrect errorAuthenPasswordIncorrect;
}

class EmailExist implements AuthenStatus{

  @override
  late int errorCode = 0;
  @override
  late String statusDesc = "Email Exist";
  @override
  late String statusName = "Pleas try Again";

}

class ErrorAuthenPasswordIncorrect implements AuthenStatus{

  @override
  late int errorCode = 1;
  @override
  late String statusDesc = "Password incorrect";
  @override
  late String statusName = "Pleas try Again";

}

class NotFoundUser implements AuthenStatus{

  @override
  late int errorCode = 2;
  @override
  late String statusDesc = "No user found for that email.";
  @override
  late String statusName = "Pleas try Again";

}

class PasswordIncorrect implements AuthenStatus{

  @override
  late int errorCode = 3;
  @override
  late String statusDesc = "Password incorrect.";
  @override
  late String statusName = "Pleas try Again";

}