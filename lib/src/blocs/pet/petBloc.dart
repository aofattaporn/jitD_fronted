import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../data/models/user_model.dart';
import '../../data/respository/pet_repository.dart';

part 'petEvent.dart';
part 'petState.dart';

class petBloc extends Bloc<petEvent, petState> {
  PetRepository petRepository = PetRepository();

  petBloc() : super(InitialPetName()) {
    // Super คือตัว Initial State
    on<NamingPetEvent>((event, emit) async {
      // TODO: implement event handler

      emit(LoadingNamingPet());

      try {
        final petNameJson = await petRepository.NamingPetEvent(event._PetName);
        print(petNameJson);
        final petNameData = petNameFromJson(petNameJson);
        emit(LoadedNamingPet(petNameData.petName!));
      } catch (e, stacktrace) {
        print("Exxception occured: $e stackTrace: $stacktrace");
        emit(ErrorNamingPet("Something Wrong"));
      }
    });
  }
}
