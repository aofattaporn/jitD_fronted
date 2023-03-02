import 'package:bloc/bloc.dart';
import 'package:jitd_client/src/blocs/user/user_event.dart';
import 'package:jitd_client/src/blocs/user/user_state.dart';

import '../../data/models/user_model.dart';
import '../../data/respository/user_repository.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  // creating object repository
  /// inject Repository
  UserRepository userRepository = UserRepository();

  // global data user
  UserModel userModel = UserModel();

  UserBloc() : super(InitialUser()) {
    // get user
    on<GetUserByID>((event, emit) async {
      emit(GettingUser());
      try {
        final userJSON = await userRepository.getMyUser();
        final userData = userModelFromJson(userJSON);

        userModel.userID = userData.userID;
        userModel.petName = userData.petName;
        userModel.petHP = userData.petHP;
        userModel.point = userData.point;

        emit(GetUserSuccess(userModel.userID!, userModel.point!,
            userModel.petName!, userModel.petHP!));
      } catch (e, stacktrace) {
        print("Exxception occured: $e stackTrace: $stacktrace");
        emit(GetUserError(e.toString()));
      }
    });

    on<UpdatePetName>((event, emit) async {
      emit(UpdatingPetName(userModel.userID!, userModel.point!,
          userModel.petName!, userModel.petHP!));
      try {
        final userJSON = await userRepository.namingPet(event.petName!);
        final userData = petFromJson(userJSON);

        // new set
        userModel.petName = userData.petName;

        emit(UpdatePetNameSuccess(userModel.userID!, userModel.point!,
            userModel.petName!, userModel.petHP!));
      } catch (e, stacktrace) {
        print("Exxception occured: $e stackTrace: $stacktrace");
        emit(GetUserError(e.toString()));
      }
    });

    on<PointAdd>((event, emit) {
      int tempPoint = userModel.point! + 5;
      userModel.point = tempPoint;
      emit(UpdatePetNameSuccess(userModel.userID!, userModel.point!,
          userModel.petName!, userModel.petHP!));
      emit(GetUserSuccess(userModel.userID!, userModel.point!,
          userModel.petName!, userModel.petHP!));
    });
  }
}
