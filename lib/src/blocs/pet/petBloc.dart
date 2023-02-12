import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../data/respository/pet_repository.dart';

part 'petEvent.dart';
part 'petState.dart';

class petBloc extends Bloc<petEvent, petState> {

  PetRepository petRepository = PetRepository();

  petBloc() : super(InitialPetName()) { // Super คือตัว Initial State
    on<NamingPetEvent>((event, emit) async {
      // TODO: implement event handler

      emit(LoadingNamingPet());

      if (event._PetName?.length != 0) {
        Future<String> response = petRepository.NamingPetEvent(event._PetName);

        //ยิงหลังบ้านสำเร็จ
        // 200 -> return LoadedNamingPet
        if (await response == "Naming pet successfully"){
          emit(LoadedNamingPet());
        }
        // 201 -> return ErrorNamingPet
        else{
          emit(ErrorNamingPet());
        }
      } else {
        emit(ErrorNamingPet());
      }
    });
  }
}