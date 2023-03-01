part of 'petBloc.dart';

@immutable
abstract class petState extends Equatable {
  late final String petName;
}

class InitialPetName extends petState {
  @override
  List<Object?> get props => [];
}

class LoadingNamingPet extends petState {
  @override
  List<Object?> get props => [];
}

class LoadedNamingPet extends petState {
  LoadedNamingPet(String petName) {
    super.petName = petName;
  }
  @override
  List<Object?> get props => [];
}

class ErrorNamingPet extends petState {
  final String error;
  ErrorNamingPet(this.error);

  @override
  List<Object?> get props => [];
}
