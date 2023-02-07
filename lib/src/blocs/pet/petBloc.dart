import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:jitd_client/src/data/models/pet_model.dart';

import '../../data/respository/pet_repository.dart';

part 'petEvent.dart';
part 'petState.dart';

class petBloc extends Bloc<petEvent, petState> {

  PetRepository petRepository = PetRepository();

  petBloc() : super(InitialPetName()) { // Super คือตัว Initial State
    on<NamingPetEvent>((event, emit) async {
      // TODO: implement event handler

      emit(LoadingNamingPet());

      Future<String> response = petRepository.NamingPetEvent(event._PetName);

      //ยิงหลังบ้านสำเร็จ
      // 200 -> return LoadedNamingPet
      if (await response == "Naming pet successfully"){
        emit(LoadedNamingPet());
      }
      // 201 -> return ErrorNamingPet
      else{
        emit(ErrorNamingPet("Something Wrong"));
      }
    });
    // on<GetMyPet>((event, emit) async {
    //   await myPetName(emit, petRepository);
    // });
  }
}

// Future<void> myPetName(emit, postRepository) async {
//   try {
//     /// TODO: get Data and send List To PostLoadedState
//     final PetData = await PetRepository.;
//     final PetModel = petModelFromJson(PetData);
//     emit(LoadedNamingPet(PetModel.PetName));
//   } catch (e, stacktrace) {
//     print("Exxception occured: $e stackTrace: $stacktrace");
//     emit(ErrorNamingPet(e.toString()));
//   }
// }