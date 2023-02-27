import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class UserEvent extends Equatable {
  const UserEvent();
}

// create user by id ( from profile page )
class GetUserByID extends UserEvent {
  const GetUserByID();

  @override
  List<Object> get props => [];
}

// update petName ( from profile id )
class UpdatePetName extends UserEvent {
  String? petName;

  UpdatePetName(this.petName);

  @override
  List<Object> get props => [];
}
