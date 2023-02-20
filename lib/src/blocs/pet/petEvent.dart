part of 'petBloc.dart';

@immutable
abstract class petEvent extends Equatable {
  const petEvent();
}

class NamingPetEvent extends petEvent {
  String? _PetName;

  NamingPetEvent(this._PetName);

  @override
  List<Object> get props => [];
}

class GetMyPet extends petEvent{

  @override
  List<Object> get props => [];
}