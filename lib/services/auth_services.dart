part of 'services.dart';

class AuthServices {
  static auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;

  static Future<SignUpResult> signUp(
    String email,
    String password,
    String name,
  ) async {
    try {
      auth.UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      User user = result.user.convertToUser(
        name: name,
      );
      await UserServices.updateUser(user);

      return SignUpResult(user: user);
    } catch (e) {
      return SignUpResult(message: e.toString());
    }
  }

  static Future<SignUpResult> signIn(String email, String password) async {
    try {
      auth.UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = await result.user.fromFireStore();

      return SignUpResult(user: user);
    } catch (e) {
      // return print('ada Eror');
      return SignUpResult(message: e.toString());
    }
  }

  static Future<void> signOut() async {
    await _auth.signOut();
  }

  static Stream<auth.User> get userStream => _auth.authStateChanges();
}

class SignUpResult {
  final User user;
  final String message;

  SignUpResult({this.user, this.message});
}
