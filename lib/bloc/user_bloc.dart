import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
// import 'package:pendaftaran_siswa_baru/bloc/blocs.dart';
import 'package:pendaftaran_siswa_baru/models/models.dart';
import 'package:pendaftaran_siswa_baru/services/services.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial());

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is LoadUser) {
      User user = await UserServices.getUser(event.id);

      yield UserLoaded(user);
    } else if (event is SignOut) {
      yield UserInitial();
    } else if (event is UserUpdateData) {
      User upadateUser = (state as UserLoaded)
          .user
          .copyWith(profilePicture: event.profileImage);
      await UserServices.updateUser(upadateUser);

      yield UserLoaded(upadateUser);
    }
  }
}
