import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../data/models/user_model.dart';

@immutable
abstract class UserState extends Equatable {
  late final UserModel user = UserModel();
}

class InitialUser extends UserState {
  @override
  List<Object?> get props => [];
}

class GettingUser extends UserState {
  @override
  List<Object?> get props => [];
}

class GetUserSuccess extends UserState {
  GetUserSuccess(String userId, int point, String petName, int petHP) {
    super.user.userID = userId;
    super.user.point = point;
    super.user.petName = petName;
    super.user.petHP = petHP;
  }
  @override
  List<Object?> get props => [];
}

class GetUserError extends UserState {
  final String error;

  GetUserError(this.error);
  @override
  List<Object?> get props => [];
}

class UpdatingPetName extends UserState {
  UpdatingPetName(String userId, int point, String petName, int petHP) {
    super.user.userID = userId;
    super.user.point = point;
    super.user.petName = petName;
    super.user.petHP = petHP;
  }
  @override
  List<Object?> get props => [];
}

class UpdatePetNameSuccess extends UserState {
  UpdatePetNameSuccess(String userId, int point, String petName, int petHP) {
    super.user.userID = userId;
    super.user.point = point;
    super.user.petName = petName;
    super.user.petHP = petHP;
  }
  @override
  List<Object?> get props => [];
}
