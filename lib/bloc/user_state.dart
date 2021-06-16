part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserLoaded extends UserState {
  final User user;

  UserLoaded(this.user);
  @override
  List<Object> get props => [user];
}

class UserUplaodData extends UserState {
  final String profileImage;

  UserUplaodData(this.profileImage);

  List<Object> get props => [profileImage];
}
