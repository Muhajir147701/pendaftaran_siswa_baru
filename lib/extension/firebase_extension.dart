part of 'extension.dart';

extension FirebaseUserExtension on auth.User {
  User convertToUser(
          {String id,
          String email,
          String name = "No Name",
          List<String> selectedGenres = const [],
          String selectedLanguages = "English",
          int balance = 50000}) =>
      User(
        this.uid,
        this.email,
        name: name,
        balance: balance,
      );

  Future<User> fromFireStore() async => await UserServices.getUser(this.uid);
}
