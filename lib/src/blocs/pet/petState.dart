part of 'petBloc.dart';

@immutable
abstract class petState extends Equatable {}

class InitialPetName extends petState {
  @override
  List<Object?> get props => [];
}

class LoadingNamingPet extends petState {
  @override
  List<Object?> get props => [];
}


class LoadedNamingPet extends petState {

  @override
  List<Object?> get props => [];
}


class ErrorNamingPet extends petState {

  @override
  List<Object?> get props => [];
}
